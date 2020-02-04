registers         = {}
addr_spaces       = {}

# Register NVDLA_SDP_RDMA_S_STATUS_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['S_STATUS_0'] = {
    'addr'            : 0x8000,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('S_STATUS_0')



# Register NVDLA_SDP_RDMA_S_POINTER_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['S_POINTER_0'] = {
    'addr'            : 0x8004,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('S_POINTER_0')



# Register NVDLA_SDP_RDMA_D_OP_ENABLE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_OP_ENABLE_0'] = {
    'addr'            : 0x8008,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_SDP_RDMA_D_DATA_CUBE_WIDTH_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_DATA_CUBE_WIDTH_0'] = {
    'addr'            : 0x800c,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'WIDTH' : {
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
        'WIDTH',
    ],
} # End of register: D_DATA_CUBE_WIDTH_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_DATA_CUBE_WIDTH_0')



# Register NVDLA_SDP_RDMA_D_DATA_CUBE_HEIGHT_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_DATA_CUBE_HEIGHT_0'] = {
    'addr'            : 0x8010,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'HEIGHT' : {
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
        'HEIGHT',
    ],
} # End of register: D_DATA_CUBE_HEIGHT_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_DATA_CUBE_HEIGHT_0')



# Register NVDLA_SDP_RDMA_D_DATA_CUBE_CHANNEL_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_DATA_CUBE_CHANNEL_0'] = {
    'addr'            : 0x8014,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'CHANNEL' : {
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
        'CHANNEL',
    ],
} # End of register: D_DATA_CUBE_CHANNEL_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_DATA_CUBE_CHANNEL_0')



# Register NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_LOW_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_SRC_BASE_ADDR_LOW_0'] = {
    'addr'            : 0x8018,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_LOW_0')



# Register NVDLA_SDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_SRC_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0x801c,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_HIGH_0')



# Register NVDLA_SDP_RDMA_D_SRC_LINE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_SRC_LINE_STRIDE_0'] = {
    'addr'            : 0x8020,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('D_SRC_LINE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_SRC_SURFACE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_SRC_SURFACE_STRIDE_0'] = {
    'addr'            : 0x8024,
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

registers['NVDLA_SDP_RDMA']['register_list'].append('D_SRC_SURFACE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_BRDMA_CFG_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BRDMA_CFG_0'] = {
    'addr'            : 0x8028,
    'size'            : 0x6,
    'reset_val'       : 0x1,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x1,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'BRDMA_DISABLE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BRDMA_DATA_USE' : {
        'lsb'               : 1,
        'msb'               : 2,
        'size'              : 2,
        'field'             : (0x3 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MUL' : 0x0,
            'ALU' : 0x1,
            'BOTH' : 0x2,
        },
    },
    'BRDMA_DATA_SIZE' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'ONE_BYTE' : 0x0,
            'TWO_BYTE' : 0x1,
        },
    },
    'BRDMA_DATA_MODE' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'PER_KERNEL' : 0x0,
            'PER_ELEMENT' : 0x1,
        },
    },
    'BRDMA_RAM_TYPE' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
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
        'BRDMA_DISABLE',
        'BRDMA_DATA_USE',
        'BRDMA_DATA_SIZE',
        'BRDMA_DATA_MODE',
        'BRDMA_RAM_TYPE',
    ],
} # End of register: D_BRDMA_CFG_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BRDMA_CFG_0')



# Register NVDLA_SDP_RDMA_D_BS_BASE_ADDR_LOW_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BS_BASE_ADDR_LOW_0'] = {
    'addr'            : 0x802c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BS_BASE_ADDR_LOW' : {
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
        'BS_BASE_ADDR_LOW',
    ],
} # End of register: D_BS_BASE_ADDR_LOW_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BS_BASE_ADDR_LOW_0')



# Register NVDLA_SDP_RDMA_D_BS_BASE_ADDR_HIGH_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BS_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0x8030,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BS_BASE_ADDR_HIGH' : {
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
        'BS_BASE_ADDR_HIGH',
    ],
} # End of register: D_BS_BASE_ADDR_HIGH_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BS_BASE_ADDR_HIGH_0')



# Register NVDLA_SDP_RDMA_D_BS_LINE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BS_LINE_STRIDE_0'] = {
    'addr'            : 0x8034,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BS_LINE_STRIDE' : {
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
        'BS_LINE_STRIDE',
    ],
} # End of register: D_BS_LINE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BS_LINE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_BS_SURFACE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BS_SURFACE_STRIDE_0'] = {
    'addr'            : 0x8038,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BS_SURFACE_STRIDE' : {
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
        'BS_SURFACE_STRIDE',
    ],
} # End of register: D_BS_SURFACE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BS_SURFACE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_BS_BATCH_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BS_BATCH_STRIDE_0'] = {
    'addr'            : 0x803c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BS_BATCH_STRIDE' : {
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
        'BS_BATCH_STRIDE',
    ],
} # End of register: D_BS_BATCH_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BS_BATCH_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_NRDMA_CFG_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_NRDMA_CFG_0'] = {
    'addr'            : 0x8040,
    'size'            : 0x6,
    'reset_val'       : 0x1,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x1,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'NRDMA_DISABLE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'NRDMA_DATA_USE' : {
        'lsb'               : 1,
        'msb'               : 2,
        'size'              : 2,
        'field'             : (0x3 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MUL' : 0x0,
            'ALU' : 0x1,
            'BOTH' : 0x2,
        },
    },
    'NRDMA_DATA_SIZE' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'ONE_BYTE' : 0x0,
            'TWO_BYTE' : 0x1,
        },
    },
    'NRDMA_DATA_MODE' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'PER_KERNEL' : 0x0,
            'PER_ELEMENT' : 0x1,
        },
    },
    'NRDMA_RAM_TYPE' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
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
        'NRDMA_DISABLE',
        'NRDMA_DATA_USE',
        'NRDMA_DATA_SIZE',
        'NRDMA_DATA_MODE',
        'NRDMA_RAM_TYPE',
    ],
} # End of register: D_NRDMA_CFG_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_NRDMA_CFG_0')



# Register NVDLA_SDP_RDMA_D_BN_BASE_ADDR_LOW_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BN_BASE_ADDR_LOW_0'] = {
    'addr'            : 0x8044,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BN_BASE_ADDR_LOW' : {
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
        'BN_BASE_ADDR_LOW',
    ],
} # End of register: D_BN_BASE_ADDR_LOW_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BN_BASE_ADDR_LOW_0')



# Register NVDLA_SDP_RDMA_D_BN_BASE_ADDR_HIGH_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BN_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0x8048,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BN_BASE_ADDR_HIGH' : {
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
        'BN_BASE_ADDR_HIGH',
    ],
} # End of register: D_BN_BASE_ADDR_HIGH_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BN_BASE_ADDR_HIGH_0')



# Register NVDLA_SDP_RDMA_D_BN_LINE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BN_LINE_STRIDE_0'] = {
    'addr'            : 0x804c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BN_LINE_STRIDE' : {
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
        'BN_LINE_STRIDE',
    ],
} # End of register: D_BN_LINE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BN_LINE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_BN_SURFACE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BN_SURFACE_STRIDE_0'] = {
    'addr'            : 0x8050,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BN_SURFACE_STRIDE' : {
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
        'BN_SURFACE_STRIDE',
    ],
} # End of register: D_BN_SURFACE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BN_SURFACE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_BN_BATCH_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_BN_BATCH_STRIDE_0'] = {
    'addr'            : 0x8054,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BN_BATCH_STRIDE' : {
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
        'BN_BATCH_STRIDE',
    ],
} # End of register: D_BN_BATCH_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_BN_BATCH_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_ERDMA_CFG_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_ERDMA_CFG_0'] = {
    'addr'            : 0x8058,
    'size'            : 0x6,
    'reset_val'       : 0x1,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x1,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'ERDMA_DISABLE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'ERDMA_DATA_USE' : {
        'lsb'               : 1,
        'msb'               : 2,
        'size'              : 2,
        'field'             : (0x3 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MUL' : 0x0,
            'ALU' : 0x1,
            'BOTH' : 0x2,
        },
    },
    'ERDMA_DATA_SIZE' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'ONE_BYTE' : 0x0,
            'TWO_BYTE' : 0x1,
        },
    },
    'ERDMA_DATA_MODE' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'PER_KERNEL' : 0x0,
            'PER_ELEMENT' : 0x1,
        },
    },
    'ERDMA_RAM_TYPE' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
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
        'ERDMA_DISABLE',
        'ERDMA_DATA_USE',
        'ERDMA_DATA_SIZE',
        'ERDMA_DATA_MODE',
        'ERDMA_RAM_TYPE',
    ],
} # End of register: D_ERDMA_CFG_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_ERDMA_CFG_0')



# Register NVDLA_SDP_RDMA_D_EW_BASE_ADDR_LOW_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_EW_BASE_ADDR_LOW_0'] = {
    'addr'            : 0x805c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_BASE_ADDR_LOW' : {
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
        'EW_BASE_ADDR_LOW',
    ],
} # End of register: D_EW_BASE_ADDR_LOW_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_EW_BASE_ADDR_LOW_0')



# Register NVDLA_SDP_RDMA_D_EW_BASE_ADDR_HIGH_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_EW_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0x8060,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_BASE_ADDR_HIGH' : {
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
        'EW_BASE_ADDR_HIGH',
    ],
} # End of register: D_EW_BASE_ADDR_HIGH_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_EW_BASE_ADDR_HIGH_0')



# Register NVDLA_SDP_RDMA_D_EW_LINE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_EW_LINE_STRIDE_0'] = {
    'addr'            : 0x8064,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_LINE_STRIDE' : {
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
        'EW_LINE_STRIDE',
    ],
} # End of register: D_EW_LINE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_EW_LINE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_EW_SURFACE_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_EW_SURFACE_STRIDE_0'] = {
    'addr'            : 0x8068,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_SURFACE_STRIDE' : {
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
        'EW_SURFACE_STRIDE',
    ],
} # End of register: D_EW_SURFACE_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_EW_SURFACE_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_EW_BATCH_STRIDE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_EW_BATCH_STRIDE_0'] = {
    'addr'            : 0x806c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_BATCH_STRIDE' : {
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
        'EW_BATCH_STRIDE',
    ],
} # End of register: D_EW_BATCH_STRIDE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_EW_BATCH_STRIDE_0')



# Register NVDLA_SDP_RDMA_D_FEATURE_MODE_CFG_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_FEATURE_MODE_CFG_0'] = {
    'addr'            : 0x8070,
    'size'            : 0xd,
    'reset_val'       : 0x14,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'FLYING_MODE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'OFF' : 0x0,
            'ON' : 0x1,
        },
    },
    'WINOGRAD' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'OFF' : 0x0,
            'ON' : 0x1,
        },
    },
    'IN_PRECISION' : {
        'lsb'               : 2,
        'msb'               : 3,
        'size'              : 2,
        'field'             : (0x3 << 2),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'INT8' : 0x0,
            'INT16' : 0x1,
            'FP16' : 0x2,
        },
    },
    'PROC_PRECISION' : {
        'lsb'               : 4,
        'msb'               : 5,
        'size'              : 2,
        'field'             : (0x3 << 4),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'INT8' : 0x0,
            'INT16' : 0x1,
            'FP16' : 0x2,
        },
    },
    'OUT_PRECISION' : {
        'lsb'               : 6,
        'msb'               : 7,
        'size'              : 2,
        'field'             : (0x3 << 6),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'INT8' : 0x0,
            'INT16' : 0x1,
            'FP16' : 0x2,
        },
    },
    'BATCH_NUMBER' : {
        'lsb'               : 8,
        'msb'               : 12,
        'size'              : 5,
        'field'             : (0x1f << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'FLYING_MODE',
        'WINOGRAD',
        'IN_PRECISION',
        'PROC_PRECISION',
        'OUT_PRECISION',
        'BATCH_NUMBER',
    ],
} # End of register: D_FEATURE_MODE_CFG_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_FEATURE_MODE_CFG_0')



# Register NVDLA_SDP_RDMA_D_SRC_DMA_CFG_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_SRC_DMA_CFG_0'] = {
    'addr'            : 0x8074,
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
} # End of register: D_SRC_DMA_CFG_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_SRC_DMA_CFG_0')



# Register NVDLA_SDP_RDMA_D_STATUS_NAN_INPUT_NUM_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_STATUS_NAN_INPUT_NUM_0'] = {
    'addr'            : 0x8078,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'STATUS_NAN_INPUT_NUM' : {
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
        'STATUS_NAN_INPUT_NUM',
    ],
} # End of register: D_STATUS_NAN_INPUT_NUM_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_STATUS_NAN_INPUT_NUM_0')



# Register NVDLA_SDP_RDMA_D_STATUS_INF_INPUT_NUM_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_STATUS_INF_INPUT_NUM_0'] = {
    'addr'            : 0x807c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'STATUS_INF_INPUT_NUM' : {
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
        'STATUS_INF_INPUT_NUM',
    ],
} # End of register: D_STATUS_INF_INPUT_NUM_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_STATUS_INF_INPUT_NUM_0')



# Register NVDLA_SDP_RDMA_D_PERF_ENABLE_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_PERF_ENABLE_0'] = {
    'addr'            : 0x8080,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'PERF_DMA_EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'PERF_NAN_INF_COUNT_EN' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PERF_DMA_EN',
        'PERF_NAN_INF_COUNT_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_SDP_RDMA_D_PERF_MRDMA_READ_STALL_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_PERF_MRDMA_READ_STALL_0'] = {
    'addr'            : 0x8084,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'MRDMA_STALL' : {
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
        'MRDMA_STALL',
    ],
} # End of register: D_PERF_MRDMA_READ_STALL_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_PERF_MRDMA_READ_STALL_0')



# Register NVDLA_SDP_RDMA_D_PERF_BRDMA_READ_STALL_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_PERF_BRDMA_READ_STALL_0'] = {
    'addr'            : 0x8088,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'BRDMA_STALL' : {
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
        'BRDMA_STALL',
    ],
} # End of register: D_PERF_BRDMA_READ_STALL_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_PERF_BRDMA_READ_STALL_0')



# Register NVDLA_SDP_RDMA_D_PERF_NRDMA_READ_STALL_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_PERF_NRDMA_READ_STALL_0'] = {
    'addr'            : 0x808c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'NRDMA_STALL' : {
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
        'NRDMA_STALL',
    ],
} # End of register: D_PERF_NRDMA_READ_STALL_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_PERF_NRDMA_READ_STALL_0')



# Register NVDLA_SDP_RDMA_D_PERF_ERDMA_READ_STALL_0
if 'NVDLA_SDP_RDMA' not in registers:
    registers['NVDLA_SDP_RDMA'] = {}
    registers['NVDLA_SDP_RDMA']['register_list']  = []

registers['NVDLA_SDP_RDMA']['D_PERF_ERDMA_READ_STALL_0'] = {
    'addr'            : 0x8090,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'ERDMA_STALL' : {
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
        'ERDMA_STALL',
    ],
} # End of register: D_PERF_ERDMA_READ_STALL_0

registers['NVDLA_SDP_RDMA']['register_list'].append('D_PERF_ERDMA_READ_STALL_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_SDP_RDMA'] = 0x8000;
