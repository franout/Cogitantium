# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDRESS_SIZE_CSR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ADDRESS_SIZE_WMEMORY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COLUMNS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH_CSR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH_FIFO_IN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH_FIFO_OUT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH_MAC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH_WMEMORY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_BOARD_DSP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ROWS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_CSR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_WMEMORY" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDRESS_SIZE_CSR { PARAM_VALUE.ADDRESS_SIZE_CSR } {
	# Procedure called to update ADDRESS_SIZE_CSR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDRESS_SIZE_CSR { PARAM_VALUE.ADDRESS_SIZE_CSR } {
	# Procedure called to validate ADDRESS_SIZE_CSR
	return true
}

proc update_PARAM_VALUE.ADDRESS_SIZE_WMEMORY { PARAM_VALUE.ADDRESS_SIZE_WMEMORY } {
	# Procedure called to update ADDRESS_SIZE_WMEMORY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDRESS_SIZE_WMEMORY { PARAM_VALUE.ADDRESS_SIZE_WMEMORY } {
	# Procedure called to validate ADDRESS_SIZE_WMEMORY
	return true
}

proc update_PARAM_VALUE.COLUMNS { PARAM_VALUE.COLUMNS } {
	# Procedure called to update COLUMNS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COLUMNS { PARAM_VALUE.COLUMNS } {
	# Procedure called to validate COLUMNS
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH_CSR { PARAM_VALUE.DATA_WIDTH_CSR } {
	# Procedure called to update DATA_WIDTH_CSR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH_CSR { PARAM_VALUE.DATA_WIDTH_CSR } {
	# Procedure called to validate DATA_WIDTH_CSR
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH_FIFO_IN { PARAM_VALUE.DATA_WIDTH_FIFO_IN } {
	# Procedure called to update DATA_WIDTH_FIFO_IN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH_FIFO_IN { PARAM_VALUE.DATA_WIDTH_FIFO_IN } {
	# Procedure called to validate DATA_WIDTH_FIFO_IN
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH_FIFO_OUT { PARAM_VALUE.DATA_WIDTH_FIFO_OUT } {
	# Procedure called to update DATA_WIDTH_FIFO_OUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH_FIFO_OUT { PARAM_VALUE.DATA_WIDTH_FIFO_OUT } {
	# Procedure called to validate DATA_WIDTH_FIFO_OUT
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH_MAC { PARAM_VALUE.DATA_WIDTH_MAC } {
	# Procedure called to update DATA_WIDTH_MAC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH_MAC { PARAM_VALUE.DATA_WIDTH_MAC } {
	# Procedure called to validate DATA_WIDTH_MAC
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH_WMEMORY { PARAM_VALUE.DATA_WIDTH_WMEMORY } {
	# Procedure called to update DATA_WIDTH_WMEMORY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH_WMEMORY { PARAM_VALUE.DATA_WIDTH_WMEMORY } {
	# Procedure called to validate DATA_WIDTH_WMEMORY
	return true
}

proc update_PARAM_VALUE.MAX_BOARD_DSP { PARAM_VALUE.MAX_BOARD_DSP } {
	# Procedure called to update MAX_BOARD_DSP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_BOARD_DSP { PARAM_VALUE.MAX_BOARD_DSP } {
	# Procedure called to validate MAX_BOARD_DSP
	return true
}

proc update_PARAM_VALUE.ROWS { PARAM_VALUE.ROWS } {
	# Procedure called to update ROWS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROWS { PARAM_VALUE.ROWS } {
	# Procedure called to validate ROWS
	return true
}

proc update_PARAM_VALUE.SIZE_CSR { PARAM_VALUE.SIZE_CSR } {
	# Procedure called to update SIZE_CSR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_CSR { PARAM_VALUE.SIZE_CSR } {
	# Procedure called to validate SIZE_CSR
	return true
}

proc update_PARAM_VALUE.SIZE_WMEMORY { PARAM_VALUE.SIZE_WMEMORY } {
	# Procedure called to update SIZE_WMEMORY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_WMEMORY { PARAM_VALUE.SIZE_WMEMORY } {
	# Procedure called to validate SIZE_WMEMORY
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH_MAC { MODELPARAM_VALUE.DATA_WIDTH_MAC PARAM_VALUE.DATA_WIDTH_MAC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH_MAC}] ${MODELPARAM_VALUE.DATA_WIDTH_MAC}
}

proc update_MODELPARAM_VALUE.ROWS { MODELPARAM_VALUE.ROWS PARAM_VALUE.ROWS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROWS}] ${MODELPARAM_VALUE.ROWS}
}

proc update_MODELPARAM_VALUE.COLUMNS { MODELPARAM_VALUE.COLUMNS PARAM_VALUE.COLUMNS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COLUMNS}] ${MODELPARAM_VALUE.COLUMNS}
}

proc update_MODELPARAM_VALUE.SIZE_WMEMORY { MODELPARAM_VALUE.SIZE_WMEMORY PARAM_VALUE.SIZE_WMEMORY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_WMEMORY}] ${MODELPARAM_VALUE.SIZE_WMEMORY}
}

proc update_MODELPARAM_VALUE.ADDRESS_SIZE_WMEMORY { MODELPARAM_VALUE.ADDRESS_SIZE_WMEMORY PARAM_VALUE.ADDRESS_SIZE_WMEMORY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDRESS_SIZE_WMEMORY}] ${MODELPARAM_VALUE.ADDRESS_SIZE_WMEMORY}
}

proc update_MODELPARAM_VALUE.ADDRESS_SIZE_CSR { MODELPARAM_VALUE.ADDRESS_SIZE_CSR PARAM_VALUE.ADDRESS_SIZE_CSR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDRESS_SIZE_CSR}] ${MODELPARAM_VALUE.ADDRESS_SIZE_CSR}
}

proc update_MODELPARAM_VALUE.SIZE_CSR { MODELPARAM_VALUE.SIZE_CSR PARAM_VALUE.SIZE_CSR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_CSR}] ${MODELPARAM_VALUE.SIZE_CSR}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH_CSR { MODELPARAM_VALUE.DATA_WIDTH_CSR PARAM_VALUE.DATA_WIDTH_CSR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH_CSR}] ${MODELPARAM_VALUE.DATA_WIDTH_CSR}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH_WMEMORY { MODELPARAM_VALUE.DATA_WIDTH_WMEMORY PARAM_VALUE.DATA_WIDTH_WMEMORY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH_WMEMORY}] ${MODELPARAM_VALUE.DATA_WIDTH_WMEMORY}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH_FIFO_IN { MODELPARAM_VALUE.DATA_WIDTH_FIFO_IN PARAM_VALUE.DATA_WIDTH_FIFO_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH_FIFO_IN}] ${MODELPARAM_VALUE.DATA_WIDTH_FIFO_IN}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH_FIFO_OUT { MODELPARAM_VALUE.DATA_WIDTH_FIFO_OUT PARAM_VALUE.DATA_WIDTH_FIFO_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH_FIFO_OUT}] ${MODELPARAM_VALUE.DATA_WIDTH_FIFO_OUT}
}

proc update_MODELPARAM_VALUE.MAX_BOARD_DSP { MODELPARAM_VALUE.MAX_BOARD_DSP PARAM_VALUE.MAX_BOARD_DSP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_BOARD_DSP}] ${MODELPARAM_VALUE.MAX_BOARD_DSP}
}

