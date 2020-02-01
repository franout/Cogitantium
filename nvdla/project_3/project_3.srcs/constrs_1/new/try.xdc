ram_style="block"

#    Using the XST option.
#        in the GUI, this can be found in Process > Properties > HDL Options > RAM Style.
#        In the command line, the switch is -rom_style/ -ram_style 

#    Using the . xcf file.
#    MODEL "entity_name " ram_style={auto | block | distributed | pipe_distributed | block_power1 | block_power2};

#    Specifying within the hdl code.
#    verilog
#    (* ram_style = "{auto | block | distributed | pipe_distributed | block_power1 | block_power2}" *)
#    The default is auto.
#    vhdl
#    attribute ram_style of {signal_name | entity_name }: {signal | entity} is "{auto | block | distributed | pipe_distributed | block_power1 | block_power2}"; 

#•block: Instructs the tool to infer RAMB type components.
#•distributed: Instructs the tool to infer the LUT RAMs. 
#•register: Instructs the tool to infer registers instead of RAMs.
#•ultra: Instructs the tool to use the Zynq UltraScale+™ URAM primitives.