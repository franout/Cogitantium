proc getPresetInfo {} {
  return [dict create name {my_qynd} description {my_qynd}  vlnv xilinx.com:ip:processing_system7:5.5 display_name {my_qynd} ]
}

proc validate_preset {IPINST} { return true }


proc apply_preset {IPINST} {
  return [dict create \
    CONFIG.PCW_DDR_RAM_HIGHADDR {0x0FFFFFFF}  \
    CONFIG.PCW_FCLK_CLK1_BUF {FALSE}  \
    CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {400}  \
    CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3}  \
    CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {14}  \
    CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10}  \
    CONFIG.PCW_UIPARAM_DDR_CL {7}  \
    CONFIG.PCW_UIPARAM_DDR_CWL {6}  \
    CONFIG.PCW_UIPARAM_DDR_T_RCD {7}  \
    CONFIG.PCW_UIPARAM_DDR_T_RP {7}  \
    CONFIG.PCW_UIPARAM_DDR_T_RC {48.75}  \
    CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0}  \
    CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0}  \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.217}  \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.133}  \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.089}  \
    CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.248}  \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.537}  \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.442}  \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.464}  \
    CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.521}  \
    CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50}  \
    CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666666}  \
    CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200}  \
    CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60}  \
    CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50}  \
    CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {50}  \
    CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {23.8095}  \
    CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25}  \
    CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50}  \
    CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333}  \
    CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333}  \
    CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333}  \
    CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100}  \
    CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650.000000}  \
    CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {400.000000}  \
    CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.062893}  \
    CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000}  \
    CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000}  \
    CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {50.000000}  \
    CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000}  \
    CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000}  \
    CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {50.000000}  \
    CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000}  \
    CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108.333336}  \
    CONFIG.PCW_CLK0_FREQ {50000000}  \
    CONFIG.PCW_CLK1_FREQ {10000000}  \
    CONFIG.PCW_CLK2_FREQ {10000000}  \
    CONFIG.PCW_CLK3_FREQ {10000000}  \
    CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2}  \
    CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {4}  \
    CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {8}  \
    CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {32}  \
    CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {32}  \
    CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {8}  \
    CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {4}  \
    CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1}  \
    CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1}  \
    CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {53}  \
    CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {3}  \
    CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {8}  \
    CONFIG.PCW_ARMPLL_CTRL_FBDIV {26}  \
    CONFIG.PCW_IOPLL_CTRL_FBDIV {32}  \
    CONFIG.PCW_DDRPLL_CTRL_FBDIV {32}  \
    CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1300.000}  \
    CONFIG.PCW_IO_IO_PLL_FREQMHZ {1600.000}  \
    CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1600.000}  \
    CONFIG.PCW_SDIO_PERIPHERAL_VALID {1}  \
    CONFIG.PCW_CAN_PERIPHERAL_VALID {0}  \
    CONFIG.PCW_UART_PERIPHERAL_VALID {1}  \
    CONFIG.PCW_EN_EMIO_ENET1 {0}  \
    CONFIG.PCW_EN_EMIO_GPIO {1}  \
    CONFIG.PCW_EN_EMIO_I2C1 {0}  \
    CONFIG.PCW_EN_EMIO_UART0 {0}  \
    CONFIG.PCW_EN_EMIO_TTC0 {0}  \
    CONFIG.PCW_USE_M_AXI_GP0 {1}  \
    CONFIG.PCW_USE_S_AXI_HP0 {1}  \
    CONFIG.PCW_USE_S_AXI_HP1 {0}  \
    CONFIG.PCW_USE_FABRIC_INTERRUPT {1}  \
    CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {1}  \
    CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {32}  \
    CONFIG.PCW_EN_QSPI {1}  \
    CONFIG.PCW_EN_CAN0 {0}  \
    CONFIG.PCW_EN_ENET0 {0}  \
    CONFIG.PCW_EN_ENET1 {0}  \
    CONFIG.PCW_EN_GPIO {0}  \
    CONFIG.PCW_EN_I2C0 {0}  \
    CONFIG.PCW_EN_I2C1 {0}  \
    CONFIG.PCW_EN_SDIO0 {1}  \
    CONFIG.PCW_EN_UART0 {0}  \
    CONFIG.PCW_EN_UART1 {1}  \
    CONFIG.PCW_EN_TTC0 {0}  \
    CONFIG.PCW_EN_USB0 {0}  \
    CONFIG.PCW_EN_CLK1_PORT {0}  \
    CONFIG.PCW_IRQ_F2P_INTR {0}  \
    CONFIG.PCW_CORE0_FIQ_INTR {1}  \
    CONFIG.PCW_CORE0_IRQ_INTR {1}  \
    CONFIG.PCW_IMPORT_BOARD_PRESET {D:/uni/2019-2020/thesis/cogitantium/board_documentation/zynq_block_system_configuration.tcl}  \
    CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V}  \
    CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V}  \
    CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3 (Low Voltage)}  \
    CONFIG.PCW_UIPARAM_DDR_ECC {Disabled}  \
    CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit}  \
    CONFIG.PCW_UIPARAM_DDR_BL {8}  \
    CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J128M16 HA-125}  \
    CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits}  \
    CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {2048 MBits}  \
    CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F}  \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1}  \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1}  \
    CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1}  \
    CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1}  \
    CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_NAND_GRP_D8_ENABLE {0}  \
    CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_A25_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_CS0_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_CS1_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0}  \
    CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0}  \
    CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1}  \
    CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6}  \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1}  \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6}  \
    CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0}  \
    CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4}  \
    CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0}  \
    CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1}  \
    CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8}  \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_ENET0_ENET0_IO {<Select>}  \
    CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {0}  \
    CONFIG.PCW_ENET0_GRP_MDIO_IO {<Select>}  \
    CONFIG.PCW_ENET_RESET_ENABLE {0}  \
    CONFIG.PCW_ENET_RESET_SELECT {<Select>}  \
    CONFIG.PCW_ENET0_RESET_ENABLE {0}  \
    CONFIG.PCW_ENET0_RESET_IO {<Select>}  \
    CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_ENET1_ENET1_IO {<Select>}  \
    CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0}  \
    CONFIG.PCW_ENET1_RESET_ENABLE {0}  \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1}  \
    CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45}  \
    CONFIG.PCW_SD0_GRP_CD_ENABLE {1}  \
    CONFIG.PCW_SD0_GRP_CD_IO {MIO 0}  \
    CONFIG.PCW_SD0_GRP_WP_ENABLE {1}  \
    CONFIG.PCW_SD0_GRP_WP_IO {MIO 15}  \
    CONFIG.PCW_SD0_GRP_POW_ENABLE {0}  \
    CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_UART0_GRP_FULL_ENABLE {0}  \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1}  \
    CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49}  \
    CONFIG.PCW_UART1_GRP_FULL_ENABLE {0}  \
    CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_CAN0_CAN0_IO {<Select>}  \
    CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0}  \
    CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_TTC0_TTC0_IO {<Select>}  \
    CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_USB0_USB0_IO {<Select>}  \
    CONFIG.PCW_USB_RESET_ENABLE {0}  \
    CONFIG.PCW_USB_RESET_SELECT {<Select>}  \
    CONFIG.PCW_USB0_RESET_ENABLE {0}  \
    CONFIG.PCW_USB0_RESET_IO {<Select>}  \
    CONFIG.PCW_USB1_RESET_ENABLE {0}  \
    CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_I2C0_I2C0_IO {<Select>}  \
    CONFIG.PCW_I2C0_GRP_INT_ENABLE {0}  \
    CONFIG.PCW_I2C0_RESET_ENABLE {0}  \
    CONFIG.PCW_I2C0_RESET_IO {<Select>}  \
    CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0}  \
    CONFIG.PCW_I2C1_GRP_INT_ENABLE {0}  \
    CONFIG.PCW_I2C_RESET_ENABLE {0}  \
    CONFIG.PCW_I2C_RESET_SELECT {<Select>}  \
    CONFIG.PCW_I2C1_RESET_ENABLE {0}  \
    CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {0}  \
    CONFIG.PCW_GPIO_MIO_GPIO_IO {<Select>}  \
    CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1}  \
    CONFIG.PCW_GPIO_EMIO_GPIO_IO {1}  \
    CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps}  \
    CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps}  \
    CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL}  \
    CONFIG.PCW_MIO_0_PULLUP {enabled}  \
    CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_0_DIRECTION {in}  \
    CONFIG.PCW_MIO_0_SLEW {slow}  \
    CONFIG.PCW_MIO_1_PULLUP {enabled}  \
    CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_1_DIRECTION {out}  \
    CONFIG.PCW_MIO_1_SLEW {slow}  \
    CONFIG.PCW_MIO_2_PULLUP {disabled}  \
    CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_2_DIRECTION {inout}  \
    CONFIG.PCW_MIO_2_SLEW {slow}  \
    CONFIG.PCW_MIO_3_PULLUP {disabled}  \
    CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_3_DIRECTION {inout}  \
    CONFIG.PCW_MIO_3_SLEW {slow}  \
    CONFIG.PCW_MIO_4_PULLUP {disabled}  \
    CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_4_DIRECTION {inout}  \
    CONFIG.PCW_MIO_4_SLEW {slow}  \
    CONFIG.PCW_MIO_5_PULLUP {disabled}  \
    CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_5_DIRECTION {inout}  \
    CONFIG.PCW_MIO_5_SLEW {slow}  \
    CONFIG.PCW_MIO_6_PULLUP {disabled}  \
    CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_6_DIRECTION {out}  \
    CONFIG.PCW_MIO_6_SLEW {slow}  \
    CONFIG.PCW_MIO_7_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_7_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_7_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_7_SLEW {<Select>}  \
    CONFIG.PCW_MIO_8_PULLUP {disabled}  \
    CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_8_DIRECTION {out}  \
    CONFIG.PCW_MIO_8_SLEW {slow}  \
    CONFIG.PCW_MIO_9_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_9_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_9_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_9_SLEW {<Select>}  \
    CONFIG.PCW_MIO_10_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_10_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_10_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_10_SLEW {<Select>}  \
    CONFIG.PCW_MIO_11_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_11_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_11_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_11_SLEW {<Select>}  \
    CONFIG.PCW_MIO_12_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_12_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_12_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_12_SLEW {<Select>}  \
    CONFIG.PCW_MIO_13_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_13_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_13_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_13_SLEW {<Select>}  \
    CONFIG.PCW_MIO_14_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_14_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_14_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_14_SLEW {<Select>}  \
    CONFIG.PCW_MIO_15_PULLUP {enabled}  \
    CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_15_DIRECTION {in}  \
    CONFIG.PCW_MIO_15_SLEW {slow}  \
    CONFIG.PCW_MIO_16_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_16_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_16_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_16_SLEW {<Select>}  \
    CONFIG.PCW_MIO_17_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_17_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_17_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_17_SLEW {<Select>}  \
    CONFIG.PCW_MIO_18_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_18_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_18_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_18_SLEW {<Select>}  \
    CONFIG.PCW_MIO_19_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_19_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_19_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_19_SLEW {<Select>}  \
    CONFIG.PCW_MIO_20_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_20_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_20_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_20_SLEW {<Select>}  \
    CONFIG.PCW_MIO_21_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_21_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_21_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_21_SLEW {<Select>}  \
    CONFIG.PCW_MIO_22_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_22_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_22_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_22_SLEW {<Select>}  \
    CONFIG.PCW_MIO_23_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_23_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_23_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_23_SLEW {<Select>}  \
    CONFIG.PCW_MIO_24_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_24_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_24_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_24_SLEW {<Select>}  \
    CONFIG.PCW_MIO_25_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_25_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_25_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_25_SLEW {<Select>}  \
    CONFIG.PCW_MIO_26_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_26_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_26_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_26_SLEW {<Select>}  \
    CONFIG.PCW_MIO_27_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_27_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_27_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_27_SLEW {<Select>}  \
    CONFIG.PCW_MIO_28_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_28_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_28_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_28_SLEW {<Select>}  \
    CONFIG.PCW_MIO_29_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_29_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_29_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_29_SLEW {<Select>}  \
    CONFIG.PCW_MIO_30_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_30_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_30_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_30_SLEW {<Select>}  \
    CONFIG.PCW_MIO_31_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_31_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_31_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_31_SLEW {<Select>}  \
    CONFIG.PCW_MIO_32_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_32_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_32_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_32_SLEW {<Select>}  \
    CONFIG.PCW_MIO_33_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_33_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_33_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_33_SLEW {<Select>}  \
    CONFIG.PCW_MIO_34_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_34_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_34_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_34_SLEW {<Select>}  \
    CONFIG.PCW_MIO_35_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_35_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_35_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_35_SLEW {<Select>}  \
    CONFIG.PCW_MIO_36_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_36_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_36_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_36_SLEW {<Select>}  \
    CONFIG.PCW_MIO_37_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_37_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_37_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_37_SLEW {<Select>}  \
    CONFIG.PCW_MIO_38_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_38_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_38_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_38_SLEW {<Select>}  \
    CONFIG.PCW_MIO_39_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_39_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_39_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_39_SLEW {<Select>}  \
    CONFIG.PCW_MIO_40_PULLUP {disabled}  \
    CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_40_DIRECTION {inout}  \
    CONFIG.PCW_MIO_40_SLEW {slow}  \
    CONFIG.PCW_MIO_41_PULLUP {disabled}  \
    CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_41_DIRECTION {inout}  \
    CONFIG.PCW_MIO_41_SLEW {slow}  \
    CONFIG.PCW_MIO_42_PULLUP {disabled}  \
    CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_42_DIRECTION {inout}  \
    CONFIG.PCW_MIO_42_SLEW {slow}  \
    CONFIG.PCW_MIO_43_PULLUP {disabled}  \
    CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_43_DIRECTION {inout}  \
    CONFIG.PCW_MIO_43_SLEW {slow}  \
    CONFIG.PCW_MIO_44_PULLUP {disabled}  \
    CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_44_DIRECTION {inout}  \
    CONFIG.PCW_MIO_44_SLEW {slow}  \
    CONFIG.PCW_MIO_45_PULLUP {disabled}  \
    CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_45_DIRECTION {inout}  \
    CONFIG.PCW_MIO_45_SLEW {slow}  \
    CONFIG.PCW_MIO_46_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_46_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_46_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_46_SLEW {<Select>}  \
    CONFIG.PCW_MIO_47_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_47_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_47_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_47_SLEW {<Select>}  \
    CONFIG.PCW_MIO_48_PULLUP {disabled}  \
    CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_48_DIRECTION {out}  \
    CONFIG.PCW_MIO_48_SLEW {slow}  \
    CONFIG.PCW_MIO_49_PULLUP {disabled}  \
    CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V}  \
    CONFIG.PCW_MIO_49_DIRECTION {in}  \
    CONFIG.PCW_MIO_49_SLEW {slow}  \
    CONFIG.PCW_MIO_50_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_50_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_50_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_50_SLEW {<Select>}  \
    CONFIG.PCW_MIO_51_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_51_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_51_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_51_SLEW {<Select>}  \
    CONFIG.PCW_MIO_52_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_52_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_52_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_52_SLEW {<Select>}  \
    CONFIG.PCW_MIO_53_PULLUP {<Select>}  \
    CONFIG.PCW_MIO_53_IOTYPE {<Select>}  \
    CONFIG.PCW_MIO_53_DIRECTION {<Select>}  \
    CONFIG.PCW_MIO_53_SLEW {<Select>}  \
    CONFIG.PCW_MIO_TREE_PERIPHERALS {SD 0#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#unassigned#Quad SPI Flash#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#SD 0#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#unassigned#unassigned#UART 1#UART 1#unassigned#unassigned#unassigned#unassigned}  \
    CONFIG.PCW_MIO_TREE_SIGNALS {cd#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#unassigned#qspi_fbclk#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#wp#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#clk#cmd#data[0]#data[1]#data[2]#data[3]#unassigned#unassigned#tx#rx#unassigned#unassigned#unassigned#unassigned}  \
    CONFIG.PCW_FPGA_FCLK0_ENABLE {1}  \
    CONFIG.PCW_FPGA_FCLK1_ENABLE {0}  \
    CONFIG.PCW_FPGA_FCLK2_ENABLE {0}  \
    CONFIG.PCW_FPGA_FCLK3_ENABLE {0}  \
  ]
}


