# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_resetSystemStats
    rt::HARTNDb_startSystemStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "D:/uni/2019-2020/thesis/cogitantium/nvdla/nv_small_512_32_16_8_int8/nv_small_512_32_16_8_int8.runs/synth_1/.Xil/Vivado-6328-DESKTOP-9DNP7KK/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7z020clg484-1
    source $::env(HRT_TCL_PATH)/rtSynthParallelPrep.tcl
     file delete -force synth_hints.os

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_verilog -include {
    D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/include
    D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations
  } {
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/CKLNQD12.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/MUX2D4.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/MUX2HDD2.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_BLKBOX_SINK.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_BLKBOX_SRC0.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_CLK_gate_power.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_CALC_int8.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_assembly_buffer.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_assembly_ctrl.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_calculator.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_delivery_buffer.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_delivery_ctrl.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_dual_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_regfile.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_single_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_CACC_slcg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_CVT_cell.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_DC_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_ctrl.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_pack.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_sg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_IMG_sg2pack_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/fifos/NV_NVDLA_CDMA_WT_8ATMM_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_WT_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_cvt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_dc.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_dma_mux.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_dual_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_img.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_regfile.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_shared_buffer.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_single_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_slcg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_status.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_CDMA_wt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cfgrom/NV_NVDLA_CFGROM_rom.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_active.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_cfg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_mac.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_rt_in.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_rt_out.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_CORE_slcg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_REG_dual.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_REG_single.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_core.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_CMAC_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csb_master/NV_NVDLA_CSB_MASTER_csb2falcon_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csb_master/NV_NVDLA_CSB_MASTER_falcon2csb_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_SG_dat_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_SG_wt_fifo.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_WL_dec.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_dl.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_dual_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_regfile.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_sg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_single_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_slcg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_CSC_wl.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_DMAIF_rdreq.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_DMAIF_rdrsp.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_DMAIF_wr.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/glb/NV_NVDLA_GLB_CSB_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/glb/NV_NVDLA_GLB_csb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/glb/NV_NVDLA_GLB_ic.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_NVDLA_HLS_saturate.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_NVDLA_HLS_shiftleftsu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_NVDLA_HLS_shiftrightsatsu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/NV_NVDLA_HLS_shiftrightsu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_CSB_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_READ_IG_arb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_READ_IG_bpt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_READ_IG_cvt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_READ_eg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_READ_ig.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_IG_arb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_IG_bpt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_IG_cvt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_cq.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_eg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_WRITE_ig.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_csb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_read.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_MCIF_write.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/fifos/NV_NVDLA_SDP_BRDMA_cq_lib.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_BRDMA_gate.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/fifos/NV_NVDLA_SDP_BRDMA_lat_fifo_lib.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_gate.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_pack.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_CORE_unpack.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_C_int.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_alu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_mul.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_relu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_X_int_trt.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_c.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_prelu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_relu.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_sync2data.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_HLS_x1_int.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_cmd.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_din.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_EG_dout.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/fifos/NV_NVDLA_SDP_MRDMA_EG_lat_fifo_lib.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/fifos/NV_NVDLA_SDP_MRDMA_cq_lib.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_eg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_gate.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_MRDMA_ig.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_EG_ro.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_REG_dual.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_REG_single.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_dmaif.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_eg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_ig.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_pack.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_RDMA_unpack.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_REG_dual.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_REG_single.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_DAT_in.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_DAT_out.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_cmd.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_dat.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_gate.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_WDMA_intr.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_brdma.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_cmux.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_core.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_mrdma.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_rdma.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_reg.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_SDP_wdma.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_XXIF_libs.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/apb2csb/NV_NVDLA_apb2csb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cacc/NV_NVDLA_cacc.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cbuf/NV_NVDLA_cbuf.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cdma/NV_NVDLA_cdma.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cfgrom/NV_NVDLA_cfgrom.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/cmac/NV_NVDLA_cmac.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/car/NV_NVDLA_core_reset.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csb_master/NV_NVDLA_csb_master.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/csc/NV_NVDLA_csc.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/glb/NV_NVDLA_glb.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/nocif/NV_NVDLA_mcif.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_NVDLA_partition_a.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_NVDLA_partition_c.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_NVDLA_partition_m.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_NVDLA_partition_o.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_NVDLA_partition_p.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/car/NV_NVDLA_reset.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/sdp/NV_NVDLA_sdp.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/car/NV_NVDLA_sync3d.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/car/NV_NVDLA_sync3d_c.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/car/NV_NVDLA_sync3d_s.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/nvdla/top/NV_nvdla.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/OR2D1.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rws_16x256.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rws_16x272.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rws_16x64.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rws_256x3.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rws_256x64.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_128x11.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_128x6.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_16x14.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_16x16.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_16x65.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwsp_8x65.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/rams/fpga/model/nv_ram_rwst_256x8.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/oneHotClk_async_read_clock.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/oneHotClk_async_write_clock.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/p_SSYNC2DO_C_PP.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/p_SSYNC3DO.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/p_SSYNC3DO_C_PPP.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/p_SSYNC3DO_S_PPP.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/p_STRICTSYNC3DOTM_C_PPP.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/sync3d.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/sync3d_c_ppp.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/sync3d_s_ppp.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/vmod/vlibs/sync_reset.v
      D:/uni/2019-2020/thesis/cogitantium/nvdla_configurations/nv_small_512_32_8_int8/nv_nvdla_wrapper.v
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top nv_nvdla_wrapper
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter elaborateRtlOnlyFlow false
    rt::set_parameter gatedClockConversion 2
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops false
# MODE: 
    rt::set_parameter webTalkPath {D:/uni/2019-2020/thesis/cogitantium/nvdla/nv_small_512_32_16_8_int8/nv_small_512_32_16_8_int8.cache/wt}
    rt::set_parameter enableSplitFlowPath "D:/uni/2019-2020/thesis/cogitantium/nvdla/nv_small_512_32_16_8_int8/nv_small_512_32_16_8_int8.runs/synth_1/.Xil/Vivado-6328-DESKTOP-9DNP7KK/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
