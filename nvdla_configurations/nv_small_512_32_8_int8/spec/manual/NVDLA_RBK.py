registers         = {}
addr_spaces       = {}

# Register NVDLA_RBK_S_STATUS_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['S_STATUS_0'] = {
    'addr'            : 0x11000,
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

registers['NVDLA_RBK']['register_list'].append('S_STATUS_0')



# Register NVDLA_RBK_S_POINTER_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['S_POINTER_0'] = {
    'addr'            : 0x11004,
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

registers['NVDLA_RBK']['register_list'].append('S_POINTER_0')



# Register NVDLA_RBK_D_OP_ENABLE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_OP_ENABLE_0'] = {
    'addr'            : 0x11008,
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

registers['NVDLA_RBK']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_RBK_D_MISC_CFG_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_MISC_CFG_0'] = {
    'addr'            : 0x1100c,
    'size'            : 0xa,
    'reset_val'       : 0x100,
    'reset_mask'      : 0x303,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x303,
    'write_mask'      : 0x303,
    'RUBIK_MODE' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CONTRACT' : 0x0,
            'SPLIT' : 0x1,
            'MERGE' : 0x2,
        },
    },
    'IN_PRECISION' : {
        'lsb'               : 8,
        'msb'               : 9,
        'size'              : 2,
        'field'             : (0x3 << 8),
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
        'RUBIK_MODE',
        'IN_PRECISION',
    ],
} # End of register: D_MISC_CFG_0

registers['NVDLA_RBK']['register_list'].append('D_MISC_CFG_0')



# Register NVDLA_RBK_D_DAIN_RAM_TYPE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_RAM_TYPE_0'] = {
    'addr'            : 0x11010,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'DATAIN_RAM_TYPE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CVIF' : 0x0,
            'MCIF' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAIN_RAM_TYPE',
    ],
} # End of register: D_DAIN_RAM_TYPE_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_RAM_TYPE_0')



# Register NVDLA_RBK_D_DATAIN_SIZE_0_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DATAIN_SIZE_0_0'] = {
    'addr'            : 0x11014,
    'size'            : 0x1d,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff1fff,
    'write_mask'      : 0x1fff1fff,
    'DATAIN_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 12,
        'size'              : 13,
        'field'             : (0x1fff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'DATAIN_HEIGHT' : {
        'lsb'               : 16,
        'msb'               : 28,
        'size'              : 13,
        'field'             : (0x1fff << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAIN_WIDTH',
        'DATAIN_HEIGHT',
    ],
} # End of register: D_DATAIN_SIZE_0_0

registers['NVDLA_RBK']['register_list'].append('D_DATAIN_SIZE_0_0')



# Register NVDLA_RBK_D_DATAIN_SIZE_1_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DATAIN_SIZE_1_0'] = {
    'addr'            : 0x11018,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'DATAIN_CHANNEL' : {
        'lsb'               : 0,
        'msb'               : 12,
        'size'              : 13,
        'field'             : (0x1fff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAIN_CHANNEL',
    ],
} # End of register: D_DATAIN_SIZE_1_0

registers['NVDLA_RBK']['register_list'].append('D_DATAIN_SIZE_1_0')



# Register NVDLA_RBK_D_DAIN_ADDR_HIGH_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_ADDR_HIGH_0'] = {
    'addr'            : 0x1101c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DAIN_ADDR_HIGH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAIN_ADDR_HIGH',
    ],
} # End of register: D_DAIN_ADDR_HIGH_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_ADDR_HIGH_0')



# Register NVDLA_RBK_D_DAIN_ADDR_LOW_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_ADDR_LOW_0'] = {
    'addr'            : 0x11020,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAIN_ADDR_LOW' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAIN_ADDR_LOW',
    ],
} # End of register: D_DAIN_ADDR_LOW_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_ADDR_LOW_0')



# Register NVDLA_RBK_D_DAIN_LINE_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_LINE_STRIDE_0'] = {
    'addr'            : 0x11024,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAIN_LINE_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAIN_LINE_STRIDE',
    ],
} # End of register: D_DAIN_LINE_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_LINE_STRIDE_0')



# Register NVDLA_RBK_D_DAIN_SURF_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_SURF_STRIDE_0'] = {
    'addr'            : 0x11028,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAIN_SURF_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAIN_SURF_STRIDE',
    ],
} # End of register: D_DAIN_SURF_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_SURF_STRIDE_0')



# Register NVDLA_RBK_D_DAIN_PLANAR_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAIN_PLANAR_STRIDE_0'] = {
    'addr'            : 0x1102c,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAIN_PLANAR_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAIN_PLANAR_STRIDE',
    ],
} # End of register: D_DAIN_PLANAR_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAIN_PLANAR_STRIDE_0')



# Register NVDLA_RBK_D_DAOUT_RAM_TYPE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_RAM_TYPE_0'] = {
    'addr'            : 0x11030,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'DATAOUT_RAM_TYPE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CVIF' : 0x0,
            'MCIF' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAOUT_RAM_TYPE',
    ],
} # End of register: D_DAOUT_RAM_TYPE_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_RAM_TYPE_0')



# Register NVDLA_RBK_D_DATAOUT_SIZE_1_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DATAOUT_SIZE_1_0'] = {
    'addr'            : 0x11034,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'DATAOUT_CHANNEL' : {
        'lsb'               : 0,
        'msb'               : 12,
        'size'              : 13,
        'field'             : (0x1fff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAOUT_CHANNEL',
    ],
} # End of register: D_DATAOUT_SIZE_1_0

registers['NVDLA_RBK']['register_list'].append('D_DATAOUT_SIZE_1_0')



# Register NVDLA_RBK_D_DAOUT_ADDR_HIGH_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_ADDR_HIGH_0'] = {
    'addr'            : 0x11038,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DAOUT_ADDR_HIGH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAOUT_ADDR_HIGH',
    ],
} # End of register: D_DAOUT_ADDR_HIGH_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_ADDR_HIGH_0')



# Register NVDLA_RBK_D_DAOUT_ADDR_LOW_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_ADDR_LOW_0'] = {
    'addr'            : 0x1103c,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAOUT_ADDR_LOW' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAOUT_ADDR_LOW',
    ],
} # End of register: D_DAOUT_ADDR_LOW_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_ADDR_LOW_0')



# Register NVDLA_RBK_D_DAOUT_LINE_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_LINE_STRIDE_0'] = {
    'addr'            : 0x11040,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAOUT_LINE_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAOUT_LINE_STRIDE',
    ],
} # End of register: D_DAOUT_LINE_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_LINE_STRIDE_0')



# Register NVDLA_RBK_D_CONTRACT_STRIDE_0_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_CONTRACT_STRIDE_0_0'] = {
    'addr'            : 0x11044,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'CONTRACT_STRIDE_0' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CONTRACT_STRIDE_0',
    ],
} # End of register: D_CONTRACT_STRIDE_0_0

registers['NVDLA_RBK']['register_list'].append('D_CONTRACT_STRIDE_0_0')



# Register NVDLA_RBK_D_CONTRACT_STRIDE_1_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_CONTRACT_STRIDE_1_0'] = {
    'addr'            : 0x11048,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'CONTRACT_STRIDE_1' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CONTRACT_STRIDE_1',
    ],
} # End of register: D_CONTRACT_STRIDE_1_0

registers['NVDLA_RBK']['register_list'].append('D_CONTRACT_STRIDE_1_0')



# Register NVDLA_RBK_D_DAOUT_SURF_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_SURF_STRIDE_0'] = {
    'addr'            : 0x1104c,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAOUT_SURF_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAOUT_SURF_STRIDE',
    ],
} # End of register: D_DAOUT_SURF_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_SURF_STRIDE_0')



# Register NVDLA_RBK_D_DAOUT_PLANAR_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DAOUT_PLANAR_STRIDE_0'] = {
    'addr'            : 0x11050,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'DAOUT_PLANAR_STRIDE' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DAOUT_PLANAR_STRIDE',
    ],
} # End of register: D_DAOUT_PLANAR_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DAOUT_PLANAR_STRIDE_0')



# Register NVDLA_RBK_D_DECONV_STRIDE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_DECONV_STRIDE_0'] = {
    'addr'            : 0x11054,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f001f,
    'write_mask'      : 0x1f001f,
    'DECONV_X_STRIDE' : {
        'lsb'               : 0,
        'msb'               : 4,
        'size'              : 5,
        'field'             : (0x1f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'DECONV_Y_STRIDE' : {
        'lsb'               : 16,
        'msb'               : 20,
        'size'              : 5,
        'field'             : (0x1f << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DECONV_X_STRIDE',
        'DECONV_Y_STRIDE',
    ],
} # End of register: D_DECONV_STRIDE_0

registers['NVDLA_RBK']['register_list'].append('D_DECONV_STRIDE_0')



# Register NVDLA_RBK_D_PERF_ENABLE_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_PERF_ENABLE_0'] = {
    'addr'            : 0x11058,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'PERF_EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PERF_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_RBK']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_RBK_D_PERF_READ_STALL_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_PERF_READ_STALL_0'] = {
    'addr'            : 0x1105c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'RD_STALL_CNT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RD_STALL_CNT',
    ],
} # End of register: D_PERF_READ_STALL_0

registers['NVDLA_RBK']['register_list'].append('D_PERF_READ_STALL_0')



# Register NVDLA_RBK_D_PERF_WRITE_STALL_0
if 'NVDLA_RBK' not in registers:
    registers['NVDLA_RBK'] = {}
    registers['NVDLA_RBK']['register_list']  = []

registers['NVDLA_RBK']['D_PERF_WRITE_STALL_0'] = {
    'addr'            : 0x11060,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'WR_STALL_CNT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'WR_STALL_CNT',
    ],
} # End of register: D_PERF_WRITE_STALL_0

registers['NVDLA_RBK']['register_list'].append('D_PERF_WRITE_STALL_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_RBK'] = 0x11000;
