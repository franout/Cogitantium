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

#define PKT_DMA_WR_DATA_data_WIDTH 256
#define PKT_DMA_WR_DATA_data_LSB 0
#define PKT_DMA_WR_DATA_data_MSB 255
#define PKT_DMA_WR_DATA_data_FIELD 255:0
#define PKT_DMA_WR_DATA_mask_WIDTH 1
#define PKT_DMA_WR_DATA_mask_LSB 256
#define PKT_DMA_WR_DATA_mask_MSB 256
#define PKT_DMA_WR_DATA_mask_FIELD 256:256
#define PKT_DMA_WR_DATA_WIDTH 257

#define FLOW_nvdla_dma_wr_req valid_ready

#define SIG_nvdla_dma_wr_req_PD_WIDTH 258
#define SIG_nvdla_dma_wr_req_PD_FIELD 257:0

#define PKT_nvdla_dma_wr_req_PAYLOAD_WIDTH    257
#define PKT_nvdla_dma_wr_req_PAYLOAD_FIELD    256:0
#define PKT_nvdla_dma_wr_req_ID_WIDTH    1
#define PKT_nvdla_dma_wr_req_ID_FIELD    257:257
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_FIELD    76:0
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_ID       1'd0
#define PKT_nvdla_dma_wr_req_DMA_WR_REQ_int_ID   0
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_FIELD    256:0
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_ID       1'd1
#define PKT_nvdla_dma_wr_req_DMA_WR_DATA_int_ID   1

#endif // !defined(_nvdla_dma_wr_req_IFACE)
