#if !defined(_csc2cmac_wt_if_iface_H_)
#define _csc2cmac_wt_if_iface_H_

#include <stdint.h>
typedef struct csc2cmac_wt_if_s {
    sc_int<8> data[64] ;
    sc_int<64> mask ;
    sc_int<16> sel ;
} csc2cmac_wt_if_t;

#endif // !defined(_csc2cmac_wt_if_iface_H_)
