#if !defined(_nvdla_dma_rd_req_iface_H_)
#define _nvdla_dma_rd_req_iface_H_

#include <stdint.h>
#ifndef _DMA_READ_REQ_struct_H_
#define _DMA_READ_REQ_struct_H_

typedef struct DMA_READ_REQ_s {
    sc_int<32> addr ;
    sc_int<15> size ;
} DMA_READ_REQ_t;

#endif
union nvdla_dma_rd_req_u {
    sc_int<1> tag;
    DMA_READ_REQ_t DMA_READ_REQ;
};
typedef struct nvdla_dma_rd_req_s {
    union nvdla_dma_rd_req_u pd ;
} nvdla_dma_rd_req_t;

#endif // !defined(_nvdla_dma_rd_req_iface_H_)
