
################################################################
# This is a generated script based on design: dtpu
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source dtpu_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# dtpu_core

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
   set_property BOARD_PART tul.com.tw:pynq-z2:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name dtpu

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "axi stream are for input/output  fifo and bram 
" [get_bd_designs $design_name]

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M_AXIS_0_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_0_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $M_AXIS_0_0

  set S_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S_AXI

  set S_AXIS_0_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_0_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {4} \
   CONFIG.TID_WIDTH {4} \
   CONFIG.TUSER_WIDTH {8} \
   ] $S_AXIS_0_0

  set S_AXIS_1_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_1_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {4} \
   CONFIG.TID_WIDTH {4} \
   CONFIG.TUSER_WIDTH {8} \
   ] $S_AXIS_1_0

  set S_AXIS_2_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_2_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {4} \
   CONFIG.TID_WIDTH {4} \
   CONFIG.TUSER_WIDTH {8} \
   ] $S_AXIS_2_0


  # Create ports
  set axi_aclk [ create_bd_port -dir I -type clk -freq_hz 100000000 axi_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXI:S_AXIS_0_0:M_AXIS_0_0:S_AXIS_1_0:S_AXIS_2_0} \
   CONFIG.ASSOCIATED_RESET {axi_resetn:axi_resetn} \
 ] $axi_aclk
  set axi_resetn [ create_bd_port -dir I -type rst axi_resetn ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 40000000 clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {} \
   CONFIG.ASSOCIATED_RESET {} \
 ] $clk
  set enable [ create_bd_port -dir I enable ]
  set idle_signal [ create_bd_port -dir O idle_signal ]
  set intr_dtpu [ create_bd_port -dir O -type intr intr_dtpu ]
  set test_mode [ create_bd_port -dir I test_mode ]

  # Create instance: axis_accelerator_ada_0, and set properties
  set axis_accelerator_ada_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_accelerator_adapter:2.1 axis_accelerator_ada_0 ]
  set_property -dict [ list \
   CONFIG.C_AP_IARG_0_DWIDTH {8} \
   CONFIG.C_AP_IARG_0_MB_DEPTH {1} \
   CONFIG.C_AP_IARG_1_DIM_1 {2048} \
   CONFIG.C_AP_IARG_1_DWIDTH {64} \
   CONFIG.C_AP_IARG_1_MB_DEPTH {2} \
   CONFIG.C_AP_IARG_2_DIM_1 {2048} \
   CONFIG.C_AP_IARG_2_DWIDTH {64} \
   CONFIG.C_AP_IARG_2_TYPE {1} \
   CONFIG.C_AP_OARG_0_DIM_1 {2048} \
   CONFIG.C_AP_OARG_0_DWIDTH {64} \
   CONFIG.C_AP_OARG_0_TYPE {1} \
   CONFIG.C_IARG_HAS_BRAM {1} \
   CONFIG.C_IARG_HAS_FIFO {1} \
   CONFIG.C_N_INPUT_ARGS {3} \
   CONFIG.C_OARG_HAS_BRAM {0} \
   CONFIG.C_OARG_HAS_FIFO {1} \
   CONFIG.C_PRMRY_IS_ACLK_ASYNC {1} \
 ] $axis_accelerator_ada_0

  # Create instance: dtpu_core_0, and set properties
  set block_name dtpu_core
  set block_cell_name dtpu_core_0
  if { [catch {set dtpu_core_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dtpu_core_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.COLUMNS {3} \
   CONFIG.ROWS {3} \
 ] $dtpu_core_0

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_0_0_1 [get_bd_intf_ports S_AXIS_0_0] [get_bd_intf_pins axis_accelerator_ada_0/S_AXIS_0]
  connect_bd_intf_net -intf_net S_AXIS_1_0_1 [get_bd_intf_ports S_AXIS_1_0] [get_bd_intf_pins axis_accelerator_ada_0/S_AXIS_1]
  connect_bd_intf_net -intf_net S_AXIS_2_0_1 [get_bd_intf_ports S_AXIS_2_0] [get_bd_intf_pins axis_accelerator_ada_0/S_AXIS_2]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_ports S_AXI] [get_bd_intf_pins axis_accelerator_ada_0/S_AXI]
  connect_bd_intf_net -intf_net axis_accelerator_ada_0_AP_CTRL [get_bd_intf_pins axis_accelerator_ada_0/AP_CTRL] [get_bd_intf_pins dtpu_core_0/control_interface]
  connect_bd_intf_net -intf_net axis_accelerator_ada_0_M_AXIS_0 [get_bd_intf_ports M_AXIS_0_0] [get_bd_intf_pins axis_accelerator_ada_0/M_AXIS_0]
  connect_bd_intf_net -intf_net dtpu_core_0_csr_mem_interface [get_bd_intf_pins axis_accelerator_ada_0/AP_BRAM_IARG_0] [get_bd_intf_pins dtpu_core_0/csr_mem_interface]
  connect_bd_intf_net -intf_net dtpu_core_0_input_fifo [get_bd_intf_pins axis_accelerator_ada_0/AP_FIFO_IARG_2] [get_bd_intf_pins dtpu_core_0/input_fifo]
  connect_bd_intf_net -intf_net dtpu_core_0_output_fifo [get_bd_intf_pins axis_accelerator_ada_0/AP_FIFO_OARG_0] [get_bd_intf_pins dtpu_core_0/output_fifo]
  connect_bd_intf_net -intf_net dtpu_core_0_weight_mem_interface [get_bd_intf_pins axis_accelerator_ada_0/AP_BRAM_IARG_1] [get_bd_intf_pins dtpu_core_0/weight_mem_interface]

  # Create port connections
  connect_bd_net -net axi_aclk_1 [get_bd_ports axi_aclk] [get_bd_pins axis_accelerator_ada_0/m_axis_aclk] [get_bd_pins axis_accelerator_ada_0/s_axi_aclk] [get_bd_pins axis_accelerator_ada_0/s_axis_aclk]
  connect_bd_net -net axi_resetn_1 [get_bd_ports axi_resetn] [get_bd_pins axis_accelerator_ada_0/m_axis_aresetn] [get_bd_pins axis_accelerator_ada_0/s_axi_aresetn] [get_bd_pins axis_accelerator_ada_0/s_axis_aresetn]
  connect_bd_net -net axis_accelerator_ada_0_aresetn [get_bd_pins axis_accelerator_ada_0/aresetn] [get_bd_pins dtpu_core_0/reset]
  connect_bd_net -net axis_accelerator_ada_0_interrupt [get_bd_ports intr_dtpu] [get_bd_pins axis_accelerator_ada_0/interrupt]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins axis_accelerator_ada_0/aclk] [get_bd_pins dtpu_core_0/clk]
  connect_bd_net -net dtpu_core_0_cs_idle [get_bd_ports idle_signal] [get_bd_pins dtpu_core_0/cs_idle]
  connect_bd_net -net enable_1 [get_bd_ports enable] [get_bd_pins dtpu_core_0/enable]
  connect_bd_net -net test_mode_1 [get_bd_ports test_mode] [get_bd_pins dtpu_core_0/test_mode]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x00008000 -target_address_space [get_bd_addr_spaces S_AXI] [get_bd_addr_segs axis_accelerator_ada_0/S_AXI/Reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


