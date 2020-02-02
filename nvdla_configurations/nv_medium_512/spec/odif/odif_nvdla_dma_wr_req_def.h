#if !defined(_nvdla_dma_wr_req_IFACE)
#define _nvdla_dma_wr_req_IFACE

#define PKT_DMA_WR_REQ_addr_WIDTH 64
#define PKT_DMA_WR_REQ_addr_LSB 0
#define PKT_DMA_WR_REQ_addr_MSB 63
#define PKT_DMA_WR_REQ_addr_FIELD 63:0
#define PKT_DMA_WR_REQ_size_WIDTH 13
#define PKT_DMA_WR_REQ_size_LSB 64
#define PKT_DMA_WR_REQ_size_MSB 76
#define PKT_DMA_WR_REQ_size_FIELD 76:64
#define PKT_DMA_WR_REQ_WIDTH 77

#define PKT_DMA_WR_DATA_data_WIDTH 128
#define PKT_DMA_WR_DATA_data_LSB 0
#define PKT_DMA_WR_DATA_data_MSB 127
#define PKT_DMA_WR_DATA_data_FIELD 127:0
#define PKT_DMA_WR_DATA_mask_WIDTH 1
#define PKT_DMA_WR_DATA_mask_LSB 128
#define PKT_DMA_WR_DATA_mask_MSB 128
#define PKT_DMA_WR_DATA_mask_FIELD 128:128
#define PKT_DMA_WR_DATA_WIDTH 129

#define FLOW_nvdla_dma_wr_req valid_ready

#define SIG_nvdla_dma_wr_req_PD_WIDTH 130
#define SIG_nvdla_dma_wr_req_PD_FIELD 129:0

#define PKT_nvdla_dma_wr_req_PAYLOAD_WIDTH    129
#define PKT_nvdla_dma_wr_req_PAYLOAD_FIELD    128:0
#define PKT_nvdla_dma_wr_req_ID_WIDTH    1
#define PKT_nvdla_dma_wr_req_ID_FIELD    129:129
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_FIELD    76:0
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_ID       1'd0
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_int_ID   0
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_FIELD    128:0
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_ID       1'd1
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_int_ID   1

#endif // !defined(_nvdla_dma_wr_req_IFACE)
