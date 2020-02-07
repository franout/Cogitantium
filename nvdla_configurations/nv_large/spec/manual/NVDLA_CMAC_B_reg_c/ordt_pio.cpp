//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_CMAC_B.rdl
//   Parms: opendla.parms
//   Date: Tue Feb 04 16:45:00 CET 2020
//

#include "ordt_pio_common.hpp"
#include "ordt_pio.hpp"

// ------------------ ordt_addr_elem methods ------------------

ordt_addr_elem::ordt_addr_elem(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : m_startaddress(_m_startaddress),
    m_endaddress(_m_endaddress) {
}

bool  ordt_addr_elem::containsAddress(const uint64_t &addr) {
  return ((addr >= m_startaddress) && (addr <= m_endaddress));
}

bool  ordt_addr_elem::isBelowAddress(const uint64_t &addr) {
  return (addr > m_endaddress);
}

bool  ordt_addr_elem::isAboveAddress(const uint64_t &addr) {
  return (addr < m_startaddress);
}

bool  ordt_addr_elem::hasStartAddress(const uint64_t &addr) {
  return (addr == m_startaddress);
}

void  ordt_addr_elem::update_child_ptrs() {
}

// ------------------ ordt_regset methods ------------------

ordt_addr_elem*  ordt_regset::findAddrElem(const uint64_t &addr) {
  int lo = 0;
  int hi = m_children.size()-1;
  int mid = 0;
  while (lo <= hi) {
     mid = (lo + hi) / 2;
     if (m_children[mid]->containsAddress(addr)) {
        //outElem = m_children[mid];
        return m_children[mid];
     }
     else if (m_children[mid]->isAboveAddress(addr))
        hi = mid - 1;
     else
        lo = mid + 1;
  }
  return nullptr;
}

ordt_regset::ordt_regset(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

int  ordt_regset::write(const uint64_t &addr, const ordt_data &wdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->write(addr, wdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in regset\n";
  #endif
     return 8;
}

int  ordt_regset::read(const uint64_t &addr, ordt_data &rdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->read(addr, rdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in regset\n";
  #endif
     rdata.clear();
     return 8;
}

// ------------------ ordt_reg methods ------------------

ordt_reg::ordt_reg(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

ordt_reg::ordt_reg(const ordt_reg &_old)
  : ordt_addr_elem(_old),
    m_mutex() {
}

void  ordt_reg::write(const ordt_data &wdata) {
}

int  ordt_reg::write(const uint64_t &addr, const ordt_data &wdata) {
     return 0;
}

void  ordt_reg::read(ordt_data &rdata) {
}

int  ordt_reg::read(const uint64_t &addr, ordt_data &rdata) {
     return 0;
}

// ------------------ ordt_rg_NVDLA_CMAC_B_S_STATUS methods ------------------

ordt_rg_NVDLA_CMAC_B_S_STATUS::ordt_rg_NVDLA_CMAC_B_S_STATUS(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    STATUS_0(0, 2, 0x0, r_std, w_none),
    STATUS_1(16, 2, 0x0, r_std, w_none) {
}

int  ordt_rg_NVDLA_CMAC_B_S_STATUS::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CMAC_B_S_STATUS at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_S_STATUS\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_S_STATUS::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  STATUS_0.write(wdata);
  STATUS_1.write(wdata);
}

int  ordt_rg_NVDLA_CMAC_B_S_STATUS::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CMAC_B_S_STATUS at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_S_STATUS\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_S_STATUS::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  STATUS_0.read(rdata);
  STATUS_1.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CMAC_B_S_POINTER methods ------------------

ordt_rg_NVDLA_CMAC_B_S_POINTER::ordt_rg_NVDLA_CMAC_B_S_POINTER(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    PRODUCER(0, 1, 0x0, r_std, w_std),
    CONSUMER(16, 1, 0x0, r_std, w_none) {
}

int  ordt_rg_NVDLA_CMAC_B_S_POINTER::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CMAC_B_S_POINTER at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_S_POINTER\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_S_POINTER::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  PRODUCER.write(wdata);
  CONSUMER.write(wdata);
}

int  ordt_rg_NVDLA_CMAC_B_S_POINTER::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CMAC_B_S_POINTER at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_S_POINTER\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_S_POINTER::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  PRODUCER.read(rdata);
  CONSUMER.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE methods ------------------

ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE::ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    OP_EN(0, 1, 0x0, r_std, w_std) {
}

int  ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  OP_EN.write(wdata);
}

int  ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_D_OP_ENABLE::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  OP_EN.read(rdata);
}

// ------------------ ordt_rg_NVDLA_CMAC_B_D_MISC_CFG methods ------------------

ordt_rg_NVDLA_CMAC_B_D_MISC_CFG::ordt_rg_NVDLA_CMAC_B_D_MISC_CFG(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    CONV_MODE(0, 1, 0x0, r_std, w_std),
    PROC_PRECISION(12, 2, 0x1, r_std, w_std) {
}

int  ordt_rg_NVDLA_CMAC_B_D_MISC_CFG::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_NVDLA_CMAC_B_D_MISC_CFG at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_D_MISC_CFG\n";
  #endif
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_D_MISC_CFG::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  CONV_MODE.write(wdata);
  PROC_PRECISION.write(wdata);
}

int  ordt_rg_NVDLA_CMAC_B_D_MISC_CFG::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_NVDLA_CMAC_B_D_MISC_CFG at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_NVDLA_CMAC_B_D_MISC_CFG\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_NVDLA_CMAC_B_D_MISC_CFG::read(ordt_data &rdata) {
  rdata.clear();
  for (int widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  CONV_MODE.read(rdata);
  PROC_PRECISION.read(rdata);
}

// ------------------ ordt_rset_NVDLA_CMAC_B methods ------------------

ordt_rset_NVDLA_CMAC_B::ordt_rset_NVDLA_CMAC_B(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    S_STATUS(_m_startaddress + 0x0, _m_startaddress + 0x3),
    S_POINTER(_m_startaddress + 0x4, _m_startaddress + 0x7),
    D_OP_ENABLE(_m_startaddress + 0x8, _m_startaddress + 0xb),
    D_MISC_CFG(_m_startaddress + 0xc, _m_startaddress + 0xf) {
  m_children.push_back(&S_STATUS);
  m_children.push_back(&S_POINTER);
  m_children.push_back(&D_OP_ENABLE);
  m_children.push_back(&D_MISC_CFG);
}

void  ordt_rset_NVDLA_CMAC_B::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&S_STATUS);
  m_children.push_back(&S_POINTER);
  m_children.push_back(&D_OP_ENABLE);
  m_children.push_back(&D_MISC_CFG);
}

// ------------------ ordt_root methods ------------------

ordt_root::ordt_root()
  : ordt_root(0x0, 0x600f) {
}

ordt_root::ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    NVDLA_CMAC_B(_m_startaddress + 0x6000, _m_startaddress + 0x600f) {
  m_children.push_back(&NVDLA_CMAC_B);
}

void  ordt_root::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&NVDLA_CMAC_B);
}

