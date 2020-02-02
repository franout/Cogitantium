//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_SDP.rdl
//   Parms: opendla.parms
//   Date: Sat Feb 01 17:43:25 CET 2020
//

#ifndef __ORDT_PIO_COMMON_HPP_INCLUDED__
#define __ORDT_PIO_COMMON_HPP_INCLUDED__

#include <vector>
#include <iostream>
#include <memory>
#include <cstdint>
#include <algorithm>
#include <string>
#include <sstream>
#define quote(x) #x

class ordt_data : public std::vector<uint32_t> {
  public:
    ordt_data();
    ordt_data(int _size, uint32_t _data);
    ordt_data(const ordt_data& _data);
    void set_slice(int lobit, int size, const ordt_data& update);
    template<typename T>
    void set_slice(int lobit, int size, const T& update);
    void get_slice(int lobit, int size, ordt_data& slice_out) const;
    template<typename T>
    void get_slice(int lobit, int size, T& slice_out) const;
    std::string to_string() const;
    ordt_data& operator=(const uint32_t rhs);
    ordt_data operator~();
    ordt_data operator&(const ordt_data& rhs);
    ordt_data operator|(const ordt_data& rhs);
};

// ------------------ ordt_data methods ------------------

template<typename T>
void  ordt_data::set_slice(int lobit, int size, const T& update) {
  int data_size = this->size() * 32;
  if (sizeof(T) > 8) {
    std::cout << "ERROR set_slice: size of update type is greater than 64b" << "\n";
    return;
  }
  int hibit = lobit + size - 1;
  int loword = lobit / 32;
  int hiword = hibit / 32;
  if (hibit > data_size - 1) {
    std::cout << "ERROR set_slice: specified slice is not contained in data" << "\n";
    return;
  }
  int update_rshift=0;
  for (int idx=loword; idx < hiword + 1; idx++) {
    int offset=idx*32;
    int lo_modbit = std::max(0, lobit - offset);
    int hi_modbit = std::min(31, hibit - offset);
    int modsize = hi_modbit - lo_modbit + 1;
    uint32_t mask = (modsize == 32)? 0xffffffff : (1 << modsize) - 1;
    uint32_t shifted_mask = mask << lo_modbit;
    this->at(idx) = (this->at(idx) & ~shifted_mask) ^ (((update >> update_rshift) & mask) << lo_modbit);
    update_rshift += modsize;
  }
}

template<typename T>
void  ordt_data::get_slice(int lobit, int size, T& slice_out) const {
  int data_size = this->size() * 32;
  slice_out = 0;
  if (sizeof(T) > 8) {
    std::cout << "ERROR get_slice: size of return type is greater than 64b" << "\n";
    return;
  }
  int hibit = lobit + size - 1;
  int loword = lobit / 32;
  int hiword = hibit / 32;
  if (hibit > data_size - 1) {
    std::cout << "ERROR set_slice: specified slice is not contained in data" << "\n";
    return;
  }
  int ret_lshift=0;
  for (int idx=loword; idx < hiword + 1; idx++) {
    int offset=idx*32;
    int lo_modbit = std::max(0, lobit - offset);
    int hi_modbit = std::min(31, hibit - offset);
    int modsize = hi_modbit - lo_modbit + 1;
    uint32_t mask = (modsize == 32)? 0xffffffff : (1 << modsize) - 1;
    uint32_t shifted_mask = mask << lo_modbit;
    slice_out |= ((this->at(idx) & shifted_mask) >> lo_modbit) << ret_lshift;
    ret_lshift += modsize;
  }
  return;
}

#endif // __ORDT_PIO_COMMON_HPP_INCLUDED__
