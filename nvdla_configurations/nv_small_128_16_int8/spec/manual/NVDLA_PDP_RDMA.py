registers         = {}
addr_spaces       = {}

# Register NVDLA_PDP_RDMA_S_STATUS_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['S_STATUS_0'] = {
    'addr'            : 0xa000,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('S_STATUS_0')



# Register NVDLA_PDP_RDMA_S_POINTER_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['S_POINTER_0'] = {
    'addr'            : 0xa004,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('S_POINTER_0')



# Register NVDLA_PDP_RDMA_D_OP_ENABLE_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_OP_ENABLE_0'] = {
    'addr'            : 0xa008,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_PDP_RDMA_D_DATA_CUBE_IN_WIDTH_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_DATA_CUBE_IN_WIDTH_0'] = {
    'addr'            : 0xa00c,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_DATA_CUBE_IN_WIDTH_0')



# Register NVDLA_PDP_RDMA_D_DATA_CUBE_IN_HEIGHT_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_DATA_CUBE_IN_HEIGHT_0'] = {
    'addr'            : 0xa010,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_DATA_CUBE_IN_HEIGHT_0')



# Register NVDLA_PDP_RDMA_D_DATA_CUBE_IN_CHANNEL_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_DATA_CUBE_IN_CHANNEL_0'] = {
    'addr'            : 0xa014,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_DATA_CUBE_IN_CHANNEL_0')



# Register NVDLA_PDP_RDMA_D_FLYING_MODE_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_FLYING_MODE_0'] = {
    'addr'            : 0xa018,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'FLYING_MODE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'ON_FLYING' : 0x0,
            'OFF_FLYING' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'FLYING_MODE',
    ],
} # End of register: D_FLYING_MODE_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_FLYING_MODE_0')



# Register NVDLA_PDP_RDMA_D_SRC_BASE_ADDR_LOW_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_SRC_BASE_ADDR_LOW_0'] = {
    'addr'            : 0xa01c,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_LOW_0')



# Register NVDLA_PDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_SRC_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0xa020,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_HIGH_0')



# Register NVDLA_PDP_RDMA_D_SRC_LINE_STRIDE_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_SRC_LINE_STRIDE_0'] = {
    'addr'            : 0xa024,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_SRC_LINE_STRIDE_0')



# Register NVDLA_PDP_RDMA_D_SRC_SURFACE_STRIDE_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_SRC_SURFACE_STRIDE_0'] = {
    'addr'            : 0xa028,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_SRC_SURFACE_STRIDE_0')



# Register NVDLA_PDP_RDMA_D_SRC_RAM_CFG_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_SRC_RAM_CFG_0'] = {
    'addr'            : 0xa02c,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'SRC_RAM_TYPE' : {
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
        'SRC_RAM_TYPE',
    ],
} # End of register: D_SRC_RAM_CFG_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_SRC_RAM_CFG_0')



# Register NVDLA_PDP_RDMA_D_DATA_FORMAT_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_DATA_FORMAT_0'] = {
    'addr'            : 0xa030,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_DATA_FORMAT_0')



# Register NVDLA_PDP_RDMA_D_OPERATION_MODE_CFG_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_OPERATION_MODE_CFG_0'] = {
    'addr'            : 0xa034,
    'size'            : 0x8,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff,
    'write_mask'      : 0xff,
    'SPLIT_NUM' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SPLIT_NUM',
    ],
} # End of register: D_OPERATION_MODE_CFG_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_OPERATION_MODE_CFG_0')



# Register NVDLA_PDP_RDMA_D_POOLING_KERNEL_CFG_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_POOLING_KERNEL_CFG_0'] = {
    'addr'            : 0xa038,
    'size'            : 0x8,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff,
    'write_mask'      : 0xff,
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
    'KERNEL_STRIDE_WIDTH' : {
        'lsb'               : 4,
        'msb'               : 7,
        'size'              : 4,
        'field'             : (0xf << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'KERNEL_WIDTH',
        'KERNEL_STRIDE_WIDTH',
    ],
} # End of register: D_POOLING_KERNEL_CFG_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_POOLING_KERNEL_CFG_0')



# Register NVDLA_PDP_RDMA_D_POOLING_PADDING_CFG_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_POOLING_PADDING_CFG_0'] = {
    'addr'            : 0xa03c,
    'size'            : 0x4,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xf,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xf,
    'write_mask'      : 0xf,
    'PAD_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 3,
        'size'              : 4,
        'field'             : (0xf << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_WIDTH',
    ],
} # End of register: D_POOLING_PADDING_CFG_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_POOLING_PADDING_CFG_0')



# Register NVDLA_PDP_RDMA_D_PARTIAL_WIDTH_IN_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_PARTIAL_WIDTH_IN_0'] = {
    'addr'            : 0xa040,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_PARTIAL_WIDTH_IN_0')



# Register NVDLA_PDP_RDMA_D_PERF_ENABLE_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_PERF_ENABLE_0'] = {
    'addr'            : 0xa044,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_PDP_RDMA_D_PERF_READ_STALL_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_PERF_READ_STALL_0'] = {
    'addr'            : 0xa048,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_READ_STALL' : {
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
        'PERF_READ_STALL',
    ],
} # End of register: D_PERF_READ_STALL_0

registers['NVDLA_PDP_RDMA']['register_list'].append('D_PERF_READ_STALL_0')



# Register NVDLA_PDP_RDMA_D_CYA_0
if 'NVDLA_PDP_RDMA' not in registers:
    registers['NVDLA_PDP_RDMA'] = {}
    registers['NVDLA_PDP_RDMA']['register_list']  = []

registers['NVDLA_PDP_RDMA']['D_CYA_0'] = {
    'addr'            : 0xa04c,
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

registers['NVDLA_PDP_RDMA']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_PDP_RDMA'] = 0xa000;
