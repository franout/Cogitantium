// Register NVDLA_BDMA_CFG_SRC_ADDR_LOW_0
#define NVDLA_BDMA_CFG_SRC_ADDR_LOW_0					32'h10000
#define NVDLA_BDMA_CFG_SRC_ADDR_LOW_0_V32_RANGE			31:5
#define NVDLA_BDMA_CFG_SRC_ADDR_LOW_0_V32_SIZE				27


// Register NVDLA_BDMA_CFG_SRC_ADDR_HIGH_0
#define NVDLA_BDMA_CFG_SRC_ADDR_HIGH_0					32'h10004
#define NVDLA_BDMA_CFG_SRC_ADDR_HIGH_0_V8_RANGE			31:0
#define NVDLA_BDMA_CFG_SRC_ADDR_HIGH_0_V8_SIZE				32


// Register NVDLA_BDMA_CFG_DST_ADDR_LOW_0
#define NVDLA_BDMA_CFG_DST_ADDR_LOW_0					32'h10008
#define NVDLA_BDMA_CFG_DST_ADDR_LOW_0_V32_RANGE			31:5
#define NVDLA_BDMA_CFG_DST_ADDR_LOW_0_V32_SIZE				27


// Register NVDLA_BDMA_CFG_DST_ADDR_HIGH_0
#define NVDLA_BDMA_CFG_DST_ADDR_HIGH_0					32'h1000c
#define NVDLA_BDMA_CFG_DST_ADDR_HIGH_0_V8_RANGE			31:0
#define NVDLA_BDMA_CFG_DST_ADDR_HIGH_0_V8_SIZE				32


// Register NVDLA_BDMA_CFG_LINE_0
#define NVDLA_BDMA_CFG_LINE_0					32'h10010
#define NVDLA_BDMA_CFG_LINE_0_SIZE_RANGE			12:0
#define NVDLA_BDMA_CFG_LINE_0_SIZE_SIZE				13


// Register NVDLA_BDMA_CFG_CMD_0
#define NVDLA_BDMA_CFG_CMD_0					32'h10014
#define NVDLA_BDMA_CFG_CMD_0_SRC_RAM_TYPE_RANGE			0:0
#define NVDLA_BDMA_CFG_CMD_0_SRC_RAM_TYPE_SIZE				1
#define NVDLA_BDMA_CFG_CMD_0_SRC_RAM_TYPE_CVSRAM			1'h0
#define NVDLA_BDMA_CFG_CMD_0_SRC_RAM_TYPE_MC			1'h1
#define NVDLA_BDMA_CFG_CMD_0_DST_RAM_TYPE_RANGE			1:1
#define NVDLA_BDMA_CFG_CMD_0_DST_RAM_TYPE_SIZE				1
#define NVDLA_BDMA_CFG_CMD_0_DST_RAM_TYPE_CVSRAM			1'h0
#define NVDLA_BDMA_CFG_CMD_0_DST_RAM_TYPE_MC			1'h1


// Register NVDLA_BDMA_CFG_LINE_REPEAT_0
#define NVDLA_BDMA_CFG_LINE_REPEAT_0					32'h10018
#define NVDLA_BDMA_CFG_LINE_REPEAT_0_NUMBER_RANGE			23:0
#define NVDLA_BDMA_CFG_LINE_REPEAT_0_NUMBER_SIZE				24


// Register NVDLA_BDMA_CFG_SRC_LINE_0
#define NVDLA_BDMA_CFG_SRC_LINE_0					32'h1001c
#define NVDLA_BDMA_CFG_SRC_LINE_0_STRIDE_RANGE			31:5
#define NVDLA_BDMA_CFG_SRC_LINE_0_STRIDE_SIZE				27


// Register NVDLA_BDMA_CFG_DST_LINE_0
#define NVDLA_BDMA_CFG_DST_LINE_0					32'h10020
#define NVDLA_BDMA_CFG_DST_LINE_0_STRIDE_RANGE			31:5
#define NVDLA_BDMA_CFG_DST_LINE_0_STRIDE_SIZE				27


// Register NVDLA_BDMA_CFG_SURF_REPEAT_0
#define NVDLA_BDMA_CFG_SURF_REPEAT_0					32'h10024
#define NVDLA_BDMA_CFG_SURF_REPEAT_0_NUMBER_RANGE			23:0
#define NVDLA_BDMA_CFG_SURF_REPEAT_0_NUMBER_SIZE				24


// Register NVDLA_BDMA_CFG_SRC_SURF_0
#define NVDLA_BDMA_CFG_SRC_SURF_0					32'h10028
#define NVDLA_BDMA_CFG_SRC_SURF_0_STRIDE_RANGE			31:5
#define NVDLA_BDMA_CFG_SRC_SURF_0_STRIDE_SIZE				27


// Register NVDLA_BDMA_CFG_DST_SURF_0
#define NVDLA_BDMA_CFG_DST_SURF_0					32'h1002c
#define NVDLA_BDMA_CFG_DST_SURF_0_STRIDE_RANGE			31:5
#define NVDLA_BDMA_CFG_DST_SURF_0_STRIDE_SIZE				27


// Register NVDLA_BDMA_CFG_OP_0
#define NVDLA_BDMA_CFG_OP_0					32'h10030
#define NVDLA_BDMA_CFG_OP_0_EN_RANGE			0:0
#define NVDLA_BDMA_CFG_OP_0_EN_SIZE				1
#define NVDLA_BDMA_CFG_OP_0_EN_DISABLE			1'h0
#define NVDLA_BDMA_CFG_OP_0_EN_ENABLE			1'h1


// Register NVDLA_BDMA_CFG_LAUNCH0_0
#define NVDLA_BDMA_CFG_LAUNCH0_0					32'h10034
#define NVDLA_BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_RANGE			0:0
#define NVDLA_BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_SIZE				1
#define NVDLA_BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_NO			1'h0
#define NVDLA_BDMA_CFG_LAUNCH0_0_GRP0_LAUNCH_YES			1'h1


// Register NVDLA_BDMA_CFG_LAUNCH1_0
#define NVDLA_BDMA_CFG_LAUNCH1_0					32'h10038
#define NVDLA_BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_RANGE			0:0
#define NVDLA_BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_SIZE				1
#define NVDLA_BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_NO			1'h0
#define NVDLA_BDMA_CFG_LAUNCH1_0_GRP1_LAUNCH_YES			1'h1


// Register NVDLA_BDMA_CFG_STATUS_0
#define NVDLA_BDMA_CFG_STATUS_0					32'h1003c
#define NVDLA_BDMA_CFG_STATUS_0_STALL_COUNT_EN_RANGE			0:0
#define NVDLA_BDMA_CFG_STATUS_0_STALL_COUNT_EN_SIZE				1
#define NVDLA_BDMA_CFG_STATUS_0_STALL_COUNT_EN_NO			1'h0
#define NVDLA_BDMA_CFG_STATUS_0_STALL_COUNT_EN_YES			1'h1


// Register NVDLA_BDMA_STATUS_0
#define NVDLA_BDMA_STATUS_0					32'h10040
#define NVDLA_BDMA_STATUS_0_FREE_SLOT_RANGE			7:0
#define NVDLA_BDMA_STATUS_0_FREE_SLOT_SIZE				8
#define NVDLA_BDMA_STATUS_0_IDLE_RANGE			8:8
#define NVDLA_BDMA_STATUS_0_IDLE_SIZE				1
#define NVDLA_BDMA_STATUS_0_IDLE_NO			1'h0
#define NVDLA_BDMA_STATUS_0_IDLE_YES			1'h1
#define NVDLA_BDMA_STATUS_0_GRP0_BUSY_RANGE			9:9
#define NVDLA_BDMA_STATUS_0_GRP0_BUSY_SIZE				1
#define NVDLA_BDMA_STATUS_0_GRP0_BUSY_NO			1'h0
#define NVDLA_BDMA_STATUS_0_GRP0_BUSY_YES			1'h1
#define NVDLA_BDMA_STATUS_0_GRP1_BUSY_RANGE			10:10
#define NVDLA_BDMA_STATUS_0_GRP1_BUSY_SIZE				1
#define NVDLA_BDMA_STATUS_0_GRP1_BUSY_NO			1'h0
#define NVDLA_BDMA_STATUS_0_GRP1_BUSY_YES			1'h1


// Register NVDLA_BDMA_STATUS_GRP0_READ_STALL_0
#define NVDLA_BDMA_STATUS_GRP0_READ_STALL_0					32'h10044
#define NVDLA_BDMA_STATUS_GRP0_READ_STALL_0_COUNT_RANGE			31:0
#define NVDLA_BDMA_STATUS_GRP0_READ_STALL_0_COUNT_SIZE				32


// Register NVDLA_BDMA_STATUS_GRP0_WRITE_STALL_0
#define NVDLA_BDMA_STATUS_GRP0_WRITE_STALL_0					32'h10048
#define NVDLA_BDMA_STATUS_GRP0_WRITE_STALL_0_COUNT_RANGE			31:0
#define NVDLA_BDMA_STATUS_GRP0_WRITE_STALL_0_COUNT_SIZE				32


// Register NVDLA_BDMA_STATUS_GRP1_READ_STALL_0
#define NVDLA_BDMA_STATUS_GRP1_READ_STALL_0					32'h1004c
#define NVDLA_BDMA_STATUS_GRP1_READ_STALL_0_COUNT_RANGE			31:0
#define NVDLA_BDMA_STATUS_GRP1_READ_STALL_0_COUNT_SIZE				32


// Register NVDLA_BDMA_STATUS_GRP1_WRITE_STALL_0
#define NVDLA_BDMA_STATUS_GRP1_WRITE_STALL_0					32'h10050
#define NVDLA_BDMA_STATUS_GRP1_WRITE_STALL_0_COUNT_RANGE			31:0
#define NVDLA_BDMA_STATUS_GRP1_WRITE_STALL_0_COUNT_SIZE				32



//
// ADDRESS SPACES
//

#define BASE_ADDRESS_NVDLA_BDMA	32'h10000
