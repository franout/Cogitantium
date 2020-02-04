registers         = {}
addr_spaces       = {}

# Register NVDLA_CMAC_A_S_STATUS_0
if 'NVDLA_CMAC_A' not in registers:
    registers['NVDLA_CMAC_A'] = {}
    registers['NVDLA_CMAC_A']['register_list']  = []

registers['NVDLA_CMAC_A']['S_STATUS_0'] = {
    'addr'            : 0x5000,
    'size'            : 0x12,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x30003,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x30003,
    'write_mask'      : 0x0,
    'STATUS_0' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'IDLE' : 0x0,
            'RUNNING' : 0x1,
            'PENDING' : 0x2,
        },
    },
    'STATUS_1' : {
        'lsb'               : 16,
        'msb'               : 17,
        'size'              : 2,
        'field'             : (0x3 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'IDLE' : 0x0,
            'RUNNING' : 0x1,
            'PENDING' : 0x2,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'STATUS_0',
        'STATUS_1',
    ],
} # End of register: S_STATUS_0

registers['NVDLA_CMAC_A']['register_list'].append('S_STATUS_0')



# Register NVDLA_CMAC_A_S_POINTER_0
if 'NVDLA_CMAC_A' not in registers:
    registers['NVDLA_CMAC_A'] = {}
    registers['NVDLA_CMAC_A']['register_list']  = []

registers['NVDLA_CMAC_A']['S_POINTER_0'] = {
    'addr'            : 0x5004,
    'size'            : 0x11,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x10001,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x10001,
    'write_mask'      : 0x1,
    'PRODUCER' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'GROUP_0' : 0x0,
            'GROUP_1' : 0x1,
        },
    },
    'CONSUMER' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'GROUP_0' : 0x0,
            'GROUP_1' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PRODUCER',
        'CONSUMER',
    ],
} # End of register: S_POINTER_0

registers['NVDLA_CMAC_A']['register_list'].append('S_POINTER_0')



# Register NVDLA_CMAC_A_D_OP_ENABLE_0
if 'NVDLA_CMAC_A' not in registers:
    registers['NVDLA_CMAC_A'] = {}
    registers['NVDLA_CMAC_A']['register_list']  = []

registers['NVDLA_CMAC_A']['D_OP_ENABLE_0'] = {
    'addr'            : 0x5008,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'OP_EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwto',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'OP_EN',
    ],
} # End of register: D_OP_ENABLE_0

registers['NVDLA_CMAC_A']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CMAC_A_D_MISC_CFG_0
if 'NVDLA_CMAC_A' not in registers:
    registers['NVDLA_CMAC_A'] = {}
    registers['NVDLA_CMAC_A']['register_list']  = []

registers['NVDLA_CMAC_A']['D_MISC_CFG_0'] = {
    'addr'            : 0x500c,
    'size'            : 0xe,
    'reset_val'       : 0x1000,
    'reset_mask'      : 0x3001,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3001,
    'write_mask'      : 0x3001,
    'CONV_MODE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DIRECT' : 0x0,
            'WINOGRAD' : 0x1,
        },
    },
    'PROC_PRECISION' : {
        'lsb'               : 12,
        'msb'               : 13,
        'size'              : 2,
        'field'             : (0x3 << 12),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'INT8' : 0x0,
            'INT16' : 0x1,
            'FP16' : 0x2,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CONV_MODE',
        'PROC_PRECISION',
    ],
} # End of register: D_MISC_CFG_0

registers['NVDLA_CMAC_A']['register_list'].append('D_MISC_CFG_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CMAC_A'] = 0x5000;
