//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_BDMA.rdl
//   Parms: opendla.parms
//   Date: Sat Feb 01 16:14:02 CET 2020
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

class ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> V32;
    ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> V8;
    ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_LOW : public ordt_reg {
  public:
    ordt_field<uint32_t> V32;
    ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_LOW(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_HIGH : public ordt_reg {
  public:
    ordt_field<uint32_t> V8;
    ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_HIGH(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_LINE : public ordt_reg {
  public:
    ordt_field<uint32_t> SIZE;
    ordt_rg_NVDLA_BDMA_CFG_LINE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_CMD : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> SRC_RAM_TYPE;
    ordt_field<uint_fast8_t> DST_RAM_TYPE;
    ordt_rg_NVDLA_BDMA_CFG_CMD(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_LINE_REPEAT : public ordt_reg {
  public:
    ordt_field<uint32_t> NUMBER;
    ordt_rg_NVDLA_BDMA_CFG_LINE_REPEAT(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_SRC_LINE : public ordt_reg {
  public:
    ordt_field<uint32_t> STRIDE;
    ordt_rg_NVDLA_BDMA_CFG_SRC_LINE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_DST_LINE : public ordt_reg {
  public:
    ordt_field<uint32_t> STRIDE;
    ordt_rg_NVDLA_BDMA_CFG_DST_LINE(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_SURF_REPEAT : public ordt_reg {
  public:
    ordt_field<uint32_t> NUMBER;
    ordt_rg_NVDLA_BDMA_CFG_SURF_REPEAT(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_SRC_SURF : public ordt_reg {
  public:
    ordt_field<uint32_t> STRIDE;
    ordt_rg_NVDLA_BDMA_CFG_SRC_SURF(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_DST_SURF : public ordt_reg {
  public:
    ordt_field<uint32_t> STRIDE;
    ordt_rg_NVDLA_BDMA_CFG_DST_SURF(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_OP : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> EN;
    ordt_rg_NVDLA_BDMA_CFG_OP(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_LAUNCH0 : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> GRP0_LAUNCH;
    ordt_rg_NVDLA_BDMA_CFG_LAUNCH0(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_LAUNCH1 : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> GRP1_LAUNCH;
    ordt_rg_NVDLA_BDMA_CFG_LAUNCH1(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_CFG_STATUS : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> STALL_COUNT_EN;
    ordt_rg_NVDLA_BDMA_CFG_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_STATUS : public ordt_reg {
  public:
    ordt_field<uint_fast8_t> FREE_SLOT;
    ordt_field<uint_fast8_t> IDLE;
    ordt_field<uint_fast8_t> GRP0_BUSY;
    ordt_field<uint_fast8_t> GRP1_BUSY;
    ordt_rg_NVDLA_BDMA_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_STATUS_GRP0_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> COUNT;
    ordt_rg_NVDLA_BDMA_STATUS_GRP0_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_STATUS_GRP0_WRITE_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> COUNT;
    ordt_rg_NVDLA_BDMA_STATUS_GRP0_WRITE_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_STATUS_GRP1_READ_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> COUNT;
    ordt_rg_NVDLA_BDMA_STATUS_GRP1_READ_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rg_NVDLA_BDMA_STATUS_GRP1_WRITE_STALL : public ordt_reg {
  public:
    ordt_field<uint32_t> COUNT;
    ordt_rg_NVDLA_BDMA_STATUS_GRP1_WRITE_STALL(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual int write(const uint64_t &addr, const ordt_data &wdata);
    virtual void write(const ordt_data &wdata);
    virtual int read(const uint64_t &addr, ordt_data &rdata);
    virtual void read(ordt_data &rdata);
};

class ordt_rset_NVDLA_BDMA : public ordt_regset {
  public:
    ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_LOW CFG_SRC_ADDR_LOW;
    ordt_rg_NVDLA_BDMA_CFG_SRC_ADDR_HIGH CFG_SRC_ADDR_HIGH;
    ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_LOW CFG_DST_ADDR_LOW;
    ordt_rg_NVDLA_BDMA_CFG_DST_ADDR_HIGH CFG_DST_ADDR_HIGH;
    ordt_rg_NVDLA_BDMA_CFG_LINE CFG_LINE;
    ordt_rg_NVDLA_BDMA_CFG_CMD CFG_CMD;
    ordt_rg_NVDLA_BDMA_CFG_LINE_REPEAT CFG_LINE_REPEAT;
    ordt_rg_NVDLA_BDMA_CFG_SRC_LINE CFG_SRC_LINE;
    ordt_rg_NVDLA_BDMA_CFG_DST_LINE CFG_DST_LINE;
    ordt_rg_NVDLA_BDMA_CFG_SURF_REPEAT CFG_SURF_REPEAT;
    ordt_rg_NVDLA_BDMA_CFG_SRC_SURF CFG_SRC_SURF;
    ordt_rg_NVDLA_BDMA_CFG_DST_SURF CFG_DST_SURF;
    ordt_rg_NVDLA_BDMA_CFG_OP CFG_OP;
    ordt_rg_NVDLA_BDMA_CFG_LAUNCH0 CFG_LAUNCH0;
    ordt_rg_NVDLA_BDMA_CFG_LAUNCH1 CFG_LAUNCH1;
    ordt_rg_NVDLA_BDMA_CFG_STATUS CFG_STATUS;
    ordt_rg_NVDLA_BDMA_STATUS STATUS;
    ordt_rg_NVDLA_BDMA_STATUS_GRP0_READ_STALL STATUS_GRP0_READ_STALL;
    ordt_rg_NVDLA_BDMA_STATUS_GRP0_WRITE_STALL STATUS_GRP0_WRITE_STALL;
    ordt_rg_NVDLA_BDMA_STATUS_GRP1_READ_STALL STATUS_GRP1_READ_STALL;
    ordt_rg_NVDLA_BDMA_STATUS_GRP1_WRITE_STALL STATUS_GRP1_WRITE_STALL;
    ordt_rset_NVDLA_BDMA(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual void update_child_ptrs();
};

class ordt_root : public ordt_regset {
  public:
    ordt_rset_NVDLA_BDMA NVDLA_BDMA;
    ordt_root();
    ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress);
    virtual void update_child_ptrs();
};

#endif // __ORDT_PIO_HPP_INCLUDED__
