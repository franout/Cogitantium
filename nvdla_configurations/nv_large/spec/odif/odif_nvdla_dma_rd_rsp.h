#if !defined(_nvdla_dma_rd_rsp_iface_H_)
#define _nvdla_dma_rd_rsp_iface_H_

#include <stdint.h>
#ifndef _DMA_READ_RSP_struct_H_
#define _DMA_READ_RSP_struct_H_

typedef struct DMA_READ_RSP_s {
    sc_int<256> data ;
    sc_int<1> mask ;
} DMA_READ_RSP_t;

#endif
union nvdla_dma_rd_rsp_u {
    sc_int<1> tag;
    DMA_READ_RSP_t DMA_READ_RSP;
};
typedef struct nvdla_dma_rd_rsp_s {
    union nvdla_dma_rd_rsp_u pd ;
} nvdla_dma_rd_rsp_t;

#endif // !defined(_nvdla_dma_rd_rsp_iface_H_)
