registers         = {}
addr_spaces       = {}

# Register NVDLA_PDP_S_STATUS_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['S_STATUS_0'] = {
    'addr'            : 0xb000,
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

registers['NVDLA_PDP']['register_list'].append('S_STATUS_0')



# Register NVDLA_PDP_S_POINTER_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['S_POINTER_0'] = {
    'addr'            : 0xb004,
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

registers['NVDLA_PDP']['register_list'].append('S_POINTER_0')



# Register NVDLA_PDP_D_OP_ENABLE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_OP_ENABLE_0'] = {
    'addr'            : 0xb008,
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

registers['NVDLA_PDP']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_PDP_D_DATA_CUBE_IN_WIDTH_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_IN_WIDTH_0'] = {
    'addr'            : 0xb00c,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_IN_WIDTH' : {
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
        'CUBE_IN_WIDTH',
    ],
} # End of register: D_DATA_CUBE_IN_WIDTH_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_IN_WIDTH_0')



# Register NVDLA_PDP_D_DATA_CUBE_IN_HEIGHT_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_IN_HEIGHT_0'] = {
    'addr'            : 0xb010,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_IN_HEIGHT' : {
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
        'CUBE_IN_HEIGHT',
    ],
} # End of register: D_DATA_CUBE_IN_HEIGHT_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_IN_HEIGHT_0')



# Register NVDLA_PDP_D_DATA_CUBE_IN_CHANNEL_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_IN_CHANNEL_0'] = {
    'addr'            : 0xb014,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_IN_CHANNEL' : {
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
        'CUBE_IN_CHANNEL',
    ],
} # End of register: D_DATA_CUBE_IN_CHANNEL_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_IN_CHANNEL_0')



# Register NVDLA_PDP_D_DATA_CUBE_OUT_WIDTH_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_OUT_WIDTH_0'] = {
    'addr'            : 0xb018,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_OUT_WIDTH' : {
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
        'CUBE_OUT_WIDTH',
    ],
} # End of register: D_DATA_CUBE_OUT_WIDTH_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_OUT_WIDTH_0')



# Register NVDLA_PDP_D_DATA_CUBE_OUT_HEIGHT_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_OUT_HEIGHT_0'] = {
    'addr'            : 0xb01c,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_OUT_HEIGHT' : {
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
        'CUBE_OUT_HEIGHT',
    ],
} # End of register: D_DATA_CUBE_OUT_HEIGHT_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_OUT_HEIGHT_0')



# Register NVDLA_PDP_D_DATA_CUBE_OUT_CHANNEL_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_CUBE_OUT_CHANNEL_0'] = {
    'addr'            : 0xb020,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CUBE_OUT_CHANNEL' : {
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
        'CUBE_OUT_CHANNEL',
    ],
} # End of register: D_DATA_CUBE_OUT_CHANNEL_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_CUBE_OUT_CHANNEL_0')



# Register NVDLA_PDP_D_OPERATION_MODE_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_OPERATION_MODE_CFG_0'] = {
    'addr'            : 0xb024,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff13,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff13,
    'write_mask'      : 0xff13,
    'POOLING_METHOD' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'POOLING_METHOD_AVERAGE' : 0x0,
            'POOLING_METHOD_MAX' : 0x1,
            'POOLING_METHOD_MIN' : 0x2,
        },
    },
    'FLYING_MODE' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'ON_FLYING' : 0x0,
            'OFF_FLYING' : 0x1,
        },
    },
    'SPLIT_NUM' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'POOLING_METHOD',
        'FLYING_MODE',
        'SPLIT_NUM',
    ],
} # End of register: D_OPERATION_MODE_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_OPERATION_MODE_CFG_0')



# Register NVDLA_PDP_D_NAN_FLUSH_TO_ZERO_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_NAN_FLUSH_TO_ZERO_0'] = {
    'addr'            : 0xb028,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'NAN_TO_ZERO' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'NAN_TO_ZERO',
    ],
} # End of register: D_NAN_FLUSH_TO_ZERO_0

registers['NVDLA_PDP']['register_list'].append('D_NAN_FLUSH_TO_ZERO_0')



# Register NVDLA_PDP_D_PARTIAL_WIDTH_IN_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_PARTIAL_WIDTH_IN_0'] = {
    'addr'            : 0xb02c,
    'size'            : 0x1e,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3fffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3fffffff,
    'write_mask'      : 0x3fffffff,
    'PARTIAL_WIDTH_IN_FIRST' : {
        'lsb'               : 0,
        'msb'               : 9,
        'size'              : 10,
        'field'             : (0x3ff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PARTIAL_WIDTH_IN_LAST' : {
        'lsb'               : 10,
        'msb'               : 19,
        'size'              : 10,
        'field'             : (0x3ff << 10),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PARTIAL_WIDTH_IN_MID' : {
        'lsb'               : 20,
        'msb'               : 29,
        'size'              : 10,
        'field'             : (0x3ff << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PARTIAL_WIDTH_IN_FIRST',
        'PARTIAL_WIDTH_IN_LAST',
        'PARTIAL_WIDTH_IN_MID',
    ],
} # End of register: D_PARTIAL_WIDTH_IN_0

registers['NVDLA_PDP']['register_list'].append('D_PARTIAL_WIDTH_IN_0')



# Register NVDLA_PDP_D_PARTIAL_WIDTH_OUT_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_PARTIAL_WIDTH_OUT_0'] = {
    'addr'            : 0xb030,
    'size'            : 0x1e,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3fffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3fffffff,
    'write_mask'      : 0x3fffffff,
    'PARTIAL_WIDTH_OUT_FIRST' : {
        'lsb'               : 0,
        'msb'               : 9,
        'size'              : 10,
        'field'             : (0x3ff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PARTIAL_WIDTH_OUT_LAST' : {
        'lsb'               : 10,
        'msb'               : 19,
        'size'              : 10,
        'field'             : (0x3ff << 10),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PARTIAL_WIDTH_OUT_MID' : {
        'lsb'               : 20,
        'msb'               : 29,
        'size'              : 10,
        'field'             : (0x3ff << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PARTIAL_WIDTH_OUT_FIRST',
        'PARTIAL_WIDTH_OUT_LAST',
        'PARTIAL_WIDTH_OUT_MID',
    ],
} # End of register: D_PARTIAL_WIDTH_OUT_0

registers['NVDLA_PDP']['register_list'].append('D_PARTIAL_WIDTH_OUT_0')



# Register NVDLA_PDP_D_POOLING_KERNEL_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_KERNEL_CFG_0'] = {
    'addr'            : 0xb034,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff0f0f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff0f0f,
    'write_mask'      : 0xff0f0f,
    'KERNEL_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 3,
        'size'              : 4,
        'field'             : (0xf << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'KERNEL_WIDTH_1' : 0x0,
            'KERNEL_WIDTH_2' : 0x1,
            'KERNEL_WIDTH_3' : 0x2,
            'KERNEL_WIDTH_4' : 0x3,
            'KERNEL_WIDTH_5' : 0x4,
            'KERNEL_WIDTH_6' : 0x5,
            'KERNEL_WIDTH_7' : 0x6,
            'KERNEL_WIDTH_8' : 0x7,
        },
    },
    'KERNEL_HEIGHT' : {
        'lsb'               : 8,
        'msb'               : 11,
        'size'              : 4,
        'field'             : (0xf << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'KERNEL_HEIGHT_1' : 0x0,
            'KERNEL_HEIGHT_2' : 0x1,
            'KERNEL_HEIGHT_3' : 0x2,
            'KERNEL_HEIGHT_4' : 0x3,
            'KERNEL_HEIGHT_5' : 0x4,
            'KERNEL_HEIGHT_6' : 0x5,
            'KERNEL_HEIGHT_7' : 0x6,
            'KERNEL_HEIGHT_8' : 0x7,
        },
    },
    'KERNEL_STRIDE_WIDTH' : {
        'lsb'               : 16,
        'msb'               : 19,
        'size'              : 4,
        'field'             : (0xf << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'KERNEL_STRIDE_HEIGHT' : {
        'lsb'               : 20,
        'msb'               : 23,
        'size'              : 4,
        'field'             : (0xf << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'KERNEL_WIDTH',
        'KERNEL_HEIGHT',
        'KERNEL_STRIDE_WIDTH',
        'KERNEL_STRIDE_HEIGHT',
    ],
} # End of register: D_POOLING_KERNEL_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_KERNEL_CFG_0')



# Register NVDLA_PDP_D_RECIP_KERNEL_WIDTH_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_RECIP_KERNEL_WIDTH_0'] = {
    'addr'            : 0xb038,
    'size'            : 0x11,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1ffff,
    'write_mask'      : 0x1ffff,
    'RECIP_KERNEL_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 16,
        'size'              : 17,
        'field'             : (0x1ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RECIP_KERNEL_WIDTH',
    ],
} # End of register: D_RECIP_KERNEL_WIDTH_0

registers['NVDLA_PDP']['register_list'].append('D_RECIP_KERNEL_WIDTH_0')



# Register NVDLA_PDP_D_RECIP_KERNEL_HEIGHT_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_RECIP_KERNEL_HEIGHT_0'] = {
    'addr'            : 0xb03c,
    'size'            : 0x11,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1ffff,
    'write_mask'      : 0x1ffff,
    'RECIP_KERNEL_HEIGHT' : {
        'lsb'               : 0,
        'msb'               : 16,
        'size'              : 17,
        'field'             : (0x1ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RECIP_KERNEL_HEIGHT',
    ],
} # End of register: D_RECIP_KERNEL_HEIGHT_0

registers['NVDLA_PDP']['register_list'].append('D_RECIP_KERNEL_HEIGHT_0')



# Register NVDLA_PDP_D_POOLING_PADDING_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_CFG_0'] = {
    'addr'            : 0xb040,
    'size'            : 0xf,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7777,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7777,
    'write_mask'      : 0x7777,
    'PAD_LEFT' : {
        'lsb'               : 0,
        'msb'               : 2,
        'size'              : 3,
        'field'             : (0x7 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PAD_TOP' : {
        'lsb'               : 4,
        'msb'               : 6,
        'size'              : 3,
        'field'             : (0x7 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PAD_RIGHT' : {
        'lsb'               : 8,
        'msb'               : 10,
        'size'              : 3,
        'field'             : (0x7 << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PAD_BOTTOM' : {
        'lsb'               : 12,
        'msb'               : 14,
        'size'              : 3,
        'field'             : (0x7 << 12),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_LEFT',
        'PAD_TOP',
        'PAD_RIGHT',
        'PAD_BOTTOM',
    ],
} # End of register: D_POOLING_PADDING_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_1_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_1_CFG_0'] = {
    'addr'            : 0xb044,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_1X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_1X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_1_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_1_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_2_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_2_CFG_0'] = {
    'addr'            : 0xb048,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_2X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_2X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_2_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_2_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_3_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_3_CFG_0'] = {
    'addr'            : 0xb04c,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_3X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_3X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_3_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_3_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_4_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_4_CFG_0'] = {
    'addr'            : 0xb050,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_4X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_4X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_4_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_4_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_5_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_5_CFG_0'] = {
    'addr'            : 0xb054,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_5X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_5X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_5_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_5_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_6_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_6_CFG_0'] = {
    'addr'            : 0xb058,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_6X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_6X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_6_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_6_CFG_0')



# Register NVDLA_PDP_D_POOLING_PADDING_VALUE_7_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_POOLING_PADDING_VALUE_7_CFG_0'] = {
    'addr'            : 0xb05c,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ffff,
    'write_mask'      : 0x7ffff,
    'PAD_VALUE_7X' : {
        'lsb'               : 0,
        'msb'               : 18,
        'size'              : 19,
        'field'             : (0x7ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_VALUE_7X',
    ],
} # End of register: D_POOLING_PADDING_VALUE_7_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_POOLING_PADDING_VALUE_7_CFG_0')



# Register NVDLA_PDP_D_SRC_BASE_ADDR_LOW_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_SRC_BASE_ADDR_LOW_0'] = {
    'addr'            : 0xb060,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'SRC_BASE_ADDR_LOW' : {
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
        'SRC_BASE_ADDR_LOW',
    ],
} # End of register: D_SRC_BASE_ADDR_LOW_0

registers['NVDLA_PDP']['register_list'].append('D_SRC_BASE_ADDR_LOW_0')



# Register NVDLA_PDP_D_SRC_BASE_ADDR_HIGH_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_SRC_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0xb064,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'SRC_BASE_ADDR_HIGH' : {
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
        'SRC_BASE_ADDR_HIGH',
    ],
} # End of register: D_SRC_BASE_ADDR_HIGH_0

registers['NVDLA_PDP']['register_list'].append('D_SRC_BASE_ADDR_HIGH_0')



# Register NVDLA_PDP_D_SRC_LINE_STRIDE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_SRC_LINE_STRIDE_0'] = {
    'addr'            : 0xb068,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'SRC_LINE_STRIDE' : {
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
        'SRC_LINE_STRIDE',
    ],
} # End of register: D_SRC_LINE_STRIDE_0

registers['NVDLA_PDP']['register_list'].append('D_SRC_LINE_STRIDE_0')



# Register NVDLA_PDP_D_SRC_SURFACE_STRIDE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_SRC_SURFACE_STRIDE_0'] = {
    'addr'            : 0xb06c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'SRC_SURFACE_STRIDE' : {
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
        'SRC_SURFACE_STRIDE',
    ],
} # End of register: D_SRC_SURFACE_STRIDE_0

registers['NVDLA_PDP']['register_list'].append('D_SRC_SURFACE_STRIDE_0')



# Register NVDLA_PDP_D_DST_BASE_ADDR_LOW_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DST_BASE_ADDR_LOW_0'] = {
    'addr'            : 0xb070,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DST_BASE_ADDR_LOW' : {
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
        'DST_BASE_ADDR_LOW',
    ],
} # End of register: D_DST_BASE_ADDR_LOW_0

registers['NVDLA_PDP']['register_list'].append('D_DST_BASE_ADDR_LOW_0')



# Register NVDLA_PDP_D_DST_BASE_ADDR_HIGH_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DST_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0xb074,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DST_BASE_ADDR_HIGH' : {
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
        'DST_BASE_ADDR_HIGH',
    ],
} # End of register: D_DST_BASE_ADDR_HIGH_0

registers['NVDLA_PDP']['register_list'].append('D_DST_BASE_ADDR_HIGH_0')



# Register NVDLA_PDP_D_DST_LINE_STRIDE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DST_LINE_STRIDE_0'] = {
    'addr'            : 0xb078,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DST_LINE_STRIDE' : {
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
        'DST_LINE_STRIDE',
    ],
} # End of register: D_DST_LINE_STRIDE_0

registers['NVDLA_PDP']['register_list'].append('D_DST_LINE_STRIDE_0')



# Register NVDLA_PDP_D_DST_SURFACE_STRIDE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DST_SURFACE_STRIDE_0'] = {
    'addr'            : 0xb07c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DST_SURFACE_STRIDE' : {
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
        'DST_SURFACE_STRIDE',
    ],
} # End of register: D_DST_SURFACE_STRIDE_0

registers['NVDLA_PDP']['register_list'].append('D_DST_SURFACE_STRIDE_0')



# Register NVDLA_PDP_D_DST_RAM_CFG_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DST_RAM_CFG_0'] = {
    'addr'            : 0xb080,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'DST_RAM_TYPE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CV' : 0x0,
            'MC' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DST_RAM_TYPE',
    ],
} # End of register: D_DST_RAM_CFG_0

registers['NVDLA_PDP']['register_list'].append('D_DST_RAM_CFG_0')



# Register NVDLA_PDP_D_DATA_FORMAT_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_DATA_FORMAT_0'] = {
    'addr'            : 0xb084,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'INPUT_DATA' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
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
        'INPUT_DATA',
    ],
} # End of register: D_DATA_FORMAT_0

registers['NVDLA_PDP']['register_list'].append('D_DATA_FORMAT_0')



# Register NVDLA_PDP_D_INF_INPUT_NUM_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_INF_INPUT_NUM_0'] = {
    'addr'            : 0xb088,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'INF_INPUT_NUM' : {
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
        'INF_INPUT_NUM',
    ],
} # End of register: D_INF_INPUT_NUM_0

registers['NVDLA_PDP']['register_list'].append('D_INF_INPUT_NUM_0')



# Register NVDLA_PDP_D_NAN_INPUT_NUM_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_NAN_INPUT_NUM_0'] = {
    'addr'            : 0xb08c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'NAN_INPUT_NUM' : {
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
        'NAN_INPUT_NUM',
    ],
} # End of register: D_NAN_INPUT_NUM_0

registers['NVDLA_PDP']['register_list'].append('D_NAN_INPUT_NUM_0')



# Register NVDLA_PDP_D_NAN_OUTPUT_NUM_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_NAN_OUTPUT_NUM_0'] = {
    'addr'            : 0xb090,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'NAN_OUTPUT_NUM' : {
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
        'NAN_OUTPUT_NUM',
    ],
} # End of register: D_NAN_OUTPUT_NUM_0

registers['NVDLA_PDP']['register_list'].append('D_NAN_OUTPUT_NUM_0')



# Register NVDLA_PDP_D_PERF_ENABLE_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_PERF_ENABLE_0'] = {
    'addr'            : 0xb094,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'DMA_EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DMA_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_PDP']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_PDP_D_PERF_WRITE_STALL_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_PERF_WRITE_STALL_0'] = {
    'addr'            : 0xb098,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_WRITE_STALL' : {
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
        'PERF_WRITE_STALL',
    ],
} # End of register: D_PERF_WRITE_STALL_0

registers['NVDLA_PDP']['register_list'].append('D_PERF_WRITE_STALL_0')



# Register NVDLA_PDP_D_CYA_0
if 'NVDLA_PDP' not in registers:
    registers['NVDLA_PDP'] = {}
    registers['NVDLA_PDP']['register_list']  = []

registers['NVDLA_PDP']['D_CYA_0'] = {
    'addr'            : 0xb09c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'CYA' : {
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
        'CYA',
    ],
} # End of register: D_CYA_0

registers['NVDLA_PDP']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_PDP'] = 0xb000;
