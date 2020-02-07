#if !defined(_nvdla_dma_wr_rsp_iface_H_)
#define _nvdla_dma_wr_rsp_iface_H_

#include <stdint.h>
typedef struct nvdla_dma_wr_rsp_s {
    sc_int<1> complete ;
} nvdla_dma_wr_rsp_t;

#endif // !defined(_nvdla_dma_wr_rsp_iface_H_)
