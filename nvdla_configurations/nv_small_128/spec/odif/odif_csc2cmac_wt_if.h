#if !defined(_csc2cmac_wt_if_iface_H_)
#define _csc2cmac_wt_if_iface_H_

#include <stdint.h>
typedef struct csc2cmac_wt_if_s {
    sc_int<8> data[8] ;
    sc_int<8> mask ;
    sc_int<4> sel ;
} csc2cmac_wt_if_t;

#endif // !defined(_csc2cmac_wt_if_iface_H_)
