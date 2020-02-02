#if !defined(_nvdla_dma_rd_rsp_IFACE)
#define _nvdla_dma_rd_rsp_IFACE

#define PKT_DMA_READ_RSP_data_WIDTH 128
#define PKT_DMA_READ_RSP_data_LSB 0
#define PKT_DMA_READ_RSP_data_MSB 127
#define PKT_DMA_READ_RSP_data_FIELD 127:0
#define PKT_DMA_READ_RSP_mask_WIDTH 1
#define PKT_DMA_READ_RSP_mask_LSB 128
#define PKT_DMA_READ_RSP_mask_MSB 128
#define PKT_DMA_READ_RSP_mask_FIELD 128:128
#define PKT_DMA_READ_RSP_WIDTH 129

#define FLOW_nvdla_dma_rd_rsp valid_ready

#define SIG_nvdla_dma_rd_rsp_PD_WIDTH 130
#define SIG_nvdla_dma_rd_rsp_PD_FIELD 129:0

#define PKT_nvdla_dma_rd_rsp_PAYLOAD_WIDTH    129
#define PKT_nvdla_dma_rd_rsp_PAYLOAD_FIELD    128:0
#define PKT_nvdla_dma_rd_rsp_ID_WIDTH    1
#define PKT_nvdla_dma_rd_rsp_ID_FIELD    129:129
#define PKT_nvdla_dma_rd_rsp_DMA_READ_RSP_FIELD    128:0
#define PKT_nvdla_dma_rd_rsp_DMA_READ_RSP_ID       1'd0
#define PKT_nvdla_dma_rd_rsp_DMA_READ_RSP_int_ID   0

#endif // !defined(_nvdla_dma_rd_rsp_IFACE)
