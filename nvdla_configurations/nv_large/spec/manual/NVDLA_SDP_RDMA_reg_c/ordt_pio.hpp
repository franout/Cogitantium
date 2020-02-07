//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_SDP_RDMA.rdl
//   Parms: opendla.parms
//   Date: Tue Feb 04 16:45:03 CET 2020
//

#ifndef __ORDT_PIO_HPP_INCLUDED__
#define __ORDT_PIO_HPP_INCLUDED__

#include <vector>
#include <iostream>
#include <memory>
#include <cstdint>
#include <algorithm>
#include <string>
#include <sstream>
#include <mutex>
#include <atomic>
#define quote(x) #x

enum ordt_read_mode_t : uint8_t {r_none, r_std, r_clr};
enum ordt_write_mode_t : uint8_t {w_none, w_std, w_1clr, w_1set};
class ordt_addr_elem {
  protected:
    uint64_t m_startaddress;
    uint64_t m_endaddress;
  public:
    ordt_addr_elem(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata) = 0;
    virtual int read(const uint64_t &addr, ordt_data &rdata) = 0;
    bool containsAddress(const uint64_t &addr);
    bool isBelowAddress(const uint64_t &addr);
    bool isAboveAddress(const uint64_t &addr);
    bool hasStartAddress(const uint64_t &addr);
    virtual void update_child_ptrs();
};

class ordt_regset : public ordt_addr_elem {
  private:
    ordt_addr_elem* childElem;
    ordt_addr_elem* findAddrElem(const uint64_t &addr);
  protected:
    std::vector<ordt_addr_elem *>  m_children;
  public:
    ordt_regset(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
};


template<typename T>
class ordt_addr_elem_array : public std::vector<T>, public ordt_addr_elem {
  protected:
    std::vector<T> vec;
    uint64_t m_stride;
  public:
    ordt_addr_elem_array(uint64_t _m_startaddress, uint64_t _m_endaddress, int _reps, uint64_t _m_stride);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
};

template<typename T>
ordt_addr_elem_array<T>::ordt_addr_elem_array(uint64_t _m_startaddress, uint64_t _m_endaddress, int _reps, uint64_t _m_stride)
   : ordt_addr_elem(_m_startaddress, _m_endaddress + (_m_stride * _reps)), m_stride(_m_stride) {
   this->reserve(_reps);
   uint64_t el_startaddress = _m_startaddress;
   uint64_t el_endaddress = _m_endaddress;
   for(int idx=0; idx<_reps; idx++) {
      std::unique_ptr<T> new_elem(new T(el_startaddress, el_endaddress));
      this->push_back(*new_elem);
      this->back().update_child_ptrs();
      el_startaddress += _m_stride;
      el_endaddress += _m_stride;
   }
}

template<typename T>
int ordt_addr_elem_array<T>::write(const uint64_t &addr, const ordt_data &wdata) {
   if (this->containsAddress(addr)) {
      int idx = (addr - m_startaddress) / m_stride;
      if (idx < this->size()) return this->at(idx).write(addr, wdata);
   }
#ifdef ORDT_PIO_VERBOSE
   std::cout << "--> write to invalid address " << addr << " in arrayed regset\n";
#endif
   return 8;
}

template<typename T>
int ordt_addr_elem_array<T>::read(const uint64_t &addr, ordt_data &rdata) {
   if (this->containsAddress(addr)) {
      int idx = (addr - m_startaddress) / m_stride;
      if (idx < this->size()) return this->at(idx).read(addr, rdata);
   }
#ifdef ORDT_PIO_VERBOSE
   std::cout << "--> read to invalid address " << addr << " in arrayed regset\n";
#endif
   rdata.clear();
   return 8;
}

class ordt_reg : public ordt_addr_elem {
  public:
    std::mutex  m_mutex;
    ordt_reg(uint64_t _m_startaddress, uint64_t _m_endaddress);
    ordt_reg(const ordt_reg &_old);
    virtual void write(const ordt_data &wdata);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void read(ordt_data &rdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
};


template<typename T>
class ordt_field {
  public:
    int lobit, size;
    T data;
    ordt_read_mode_t r_mode;
    ordt_write_mode_t w_mode;
    ordt_field(int _lobit, int _size, int _vsize, uint32_t _data, ordt_read_mode_t _r_mode, ordt_write_mode_t _w_mode);
    ordt_field(int _lobit, int _size, T _init_data, ordt_read_mode_t _r_mode, ordt_write_mode_t _w_mode);
    void write(const ordt_data &wdata);
    void read(ordt_data &rdata);
    void clear();
};

template<typename T>
ordt_field<T>::ordt_field(int _lobit, int _size, int _vsize, uint32_t _data, ordt_read_mode_t _r_mode, ordt_write_mode_t _w_mode)
   : lobit(_lobit), size(_size), data(_vsize, _data), r_mode(_r_mode), w_mode(_w_mode) {
}

template<typename T>
ordt_field<T>::ordt_field(int _lobit, int _size, T _init_data, ordt_read_mode_t _r_mode, ordt_write_mode_t _w_mode)
   : lobit(_lobit), size(_size), data(_init_data), r_mode(_r_mode), w_mode(_w_mode) {
}

template<typename T>
void ordt_field<T>::write(const ordt_data &wdata) {
   if (w_mode == w_std) wdata.get_slice(lobit, size, data);
   else if (w_mode == w_1set) {
      T mask_data;
      wdata.get_slice(lobit, size, mask_data);
      data = data | mask_data;
   }
   else if (w_mode == w_1clr) {
      T mask_data;
      wdata.get_slice(lobit, size, mask_data);
      data = data & ~mask_data;
   }
}

template<typename T>
void ordt_field<T>::read(ordt_data &rdata) {
   rdata.set_slice(lobit, size, data);
   if (r_mode == r_clr) clear();
}

template<typename T>
void ordt_field<T>::clear() {
    data = 0;
}

class ordt_rg_NVDLA_SDP_RDMA_S_STATUS : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> STATUS_0;
    ordt_field<uint_fast8_t> STATUS_1;
    ordt_rg_NVDLA_SDP_RDMA_S_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_S_POINTER : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> PRODUCER;
    ordt_field<uint_fast8_t> CONSUMER;
    ordt_rg_NVDLA_SDP_RDMA_S_POINTER(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_OP_ENABLE : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> OP_EN;
    ordt_rg_NVDLA_SDP_RDMA_D_OP_ENABLE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_WIDTH : public ordt_reg {
  public:
    ordt_field<uint32_t> WIDTH;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_WIDTH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_HEIGHT : public ordt_reg {
  public:
    ordt_field<uint32_t> HEIGHT;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_HEIGHT(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_CHANNEL : public ordt_reg {
  public:
    ordt_field<uint32_t> CHANNEL;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_CHANNEL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> SRC_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> SRC_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_SRC_LINE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> SRC_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_LINE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_SRC_SURFACE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> SRC_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_SURFACE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BRDMA_CFG : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> BRDMA_DISABLE;
    ordt_field<uint_fast8_t> BRDMA_DATA_USE;
    ordt_field<uint_fast8_t> BRDMA_DATA_SIZE;
    ordt_field<uint_fast8_t> BRDMA_DATA_MODE;
    ordt_field<uint_fast8_t> BRDMA_RAM_TYPE;
    ordt_rg_NVDLA_SDP_RDMA_D_BRDMA_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> BS_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> BS_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BS_LINE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BS_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_LINE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BS_SURFACE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BS_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_SURFACE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BS_BATCH_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BS_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BATCH_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_NRDMA_CFG : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> NRDMA_DISABLE;
    ordt_field<uint_fast8_t> NRDMA_DATA_USE;
    ordt_field<uint_fast8_t> NRDMA_DATA_SIZE;
    ordt_field<uint_fast8_t> NRDMA_DATA_MODE;
    ordt_field<uint_fast8_t> NRDMA_RAM_TYPE;
    ordt_rg_NVDLA_SDP_RDMA_D_NRDMA_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> BN_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> BN_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BN_LINE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BN_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_LINE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BN_SURFACE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BN_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_SURFACE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_BN_BATCH_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> BN_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BATCH_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_ERDMA_CFG : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> ERDMA_DISABLE;
    ordt_field<uint_fast8_t> ERDMA_DATA_USE;
    ordt_field<uint_fast8_t> ERDMA_DATA_SIZE;
    ordt_field<uint_fast8_t> ERDMA_DATA_MODE;
    ordt_field<uint_fast8_t> ERDMA_RAM_TYPE;
    ordt_rg_NVDLA_SDP_RDMA_D_ERDMA_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> EW_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> EW_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_EW_LINE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> EW_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_LINE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_EW_SURFACE_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> EW_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_SURFACE_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_EW_BATCH_STRIDE : public ordt_reg {
  public:
    ordt_field<uint32_t> EW_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BATCH_STRIDE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_FEATURE_MODE_CFG : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> FLYING_MODE;
    ordt_field<uint_fast8_t> WINOGRAD;
    ordt_field<uint_fast8_t> IN_PRECISION;
    ordt_field<uint_fast8_t> PROC_PRECISION;
    ordt_field<uint_fast8_t> OUT_PRECISION;
    ordt_field<uint_fast8_t> BATCH_NUMBER;
    ordt_rg_NVDLA_SDP_RDMA_D_FEATURE_MODE_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_SRC_DMA_CFG : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> SRC_RAM_TYPE;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_DMA_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_STATUS_NAN_INPUT_NUM : public ordt_reg {
  public:
    ordt_field<uint32_t> STATUS_NAN_INPUT_NUM;
    ordt_rg_NVDLA_SDP_RDMA_D_STATUS_NAN_INPUT_NUM(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_STATUS_INF_INPUT_NUM : public ordt_reg {
  public:
    ordt_field<uint32_t> STATUS_INF_INPUT_NUM;
    ordt_rg_NVDLA_SDP_RDMA_D_STATUS_INF_INPUT_NUM(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_PERF_ENABLE : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> PERF_DMA_EN;
    ordt_field<uint_fast8_t> PERF_NAN_INF_COUNT_EN;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_ENABLE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_PERF_MRDMA_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> MRDMA_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_MRDMA_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_PERF_BRDMA_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> BRDMA_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_BRDMA_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_PERF_NRDMA_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> NRDMA_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_NRDMA_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_SDP_RDMA_D_PERF_ERDMA_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> ERDMA_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_ERDMA_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rset_NVDLA_SDP_RDMA : public ordt_regset {
  public:
    ordt_rg_NVDLA_SDP_RDMA_S_STATUS S_STATUS;
    ordt_rg_NVDLA_SDP_RDMA_S_POINTER S_POINTER;
    ordt_rg_NVDLA_SDP_RDMA_D_OP_ENABLE D_OP_ENABLE;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_WIDTH D_DATA_CUBE_WIDTH;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_HEIGHT D_DATA_CUBE_HEIGHT;
    ordt_rg_NVDLA_SDP_RDMA_D_DATA_CUBE_CHANNEL D_DATA_CUBE_CHANNEL;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_LOW D_SRC_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_HIGH D_SRC_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_LINE_STRIDE D_SRC_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_SURFACE_STRIDE D_SRC_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BRDMA_CFG D_BRDMA_CFG;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_LOW D_BS_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BASE_ADDR_HIGH D_BS_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_LINE_STRIDE D_BS_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_SURFACE_STRIDE D_BS_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BS_BATCH_STRIDE D_BS_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_NRDMA_CFG D_NRDMA_CFG;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_LOW D_BN_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BASE_ADDR_HIGH D_BN_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_LINE_STRIDE D_BN_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_SURFACE_STRIDE D_BN_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_BN_BATCH_STRIDE D_BN_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_ERDMA_CFG D_ERDMA_CFG;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_LOW D_EW_BASE_ADDR_LOW;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BASE_ADDR_HIGH D_EW_BASE_ADDR_HIGH;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_LINE_STRIDE D_EW_LINE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_SURFACE_STRIDE D_EW_SURFACE_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_EW_BATCH_STRIDE D_EW_BATCH_STRIDE;
    ordt_rg_NVDLA_SDP_RDMA_D_FEATURE_MODE_CFG D_FEATURE_MODE_CFG;
    ordt_rg_NVDLA_SDP_RDMA_D_SRC_DMA_CFG D_SRC_DMA_CFG;
    ordt_rg_NVDLA_SDP_RDMA_D_STATUS_NAN_INPUT_NUM D_STATUS_NAN_INPUT_NUM;
    ordt_rg_NVDLA_SDP_RDMA_D_STATUS_INF_INPUT_NUM D_STATUS_INF_INPUT_NUM;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_ENABLE D_PERF_ENABLE;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_MRDMA_READ_STALL D_PERF_MRDMA_READ_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_BRDMA_READ_STALL D_PERF_BRDMA_READ_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_NRDMA_READ_STALL D_PERF_NRDMA_READ_STALL;
    ordt_rg_NVDLA_SDP_RDMA_D_PERF_ERDMA_READ_STALL D_PERF_ERDMA_READ_STALL;
    ordt_rset_NVDLA_SDP_RDMA(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual void update_child_ptrs();
};

class ordt_root : public ordt_regset {
  public:
    ordt_rset_NVDLA_SDP_RDMA NVDLA_SDP_RDMA;
    ordt_root();
    ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual void update_child_ptrs();
};

#endif // __ORDT_PIO_HPP_INCLUDED__
