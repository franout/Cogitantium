registers         = {}
addr_spaces       = {}

# Register NVDLA_CDP_RDMA_S_STATUS_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['S_STATUS_0'] = {
    'addr'            : 0xc000,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('S_STATUS_0')



# Register NVDLA_CDP_RDMA_S_POINTER_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['S_POINTER_0'] = {
    'addr'            : 0xc004,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('S_POINTER_0')



# Register NVDLA_CDP_RDMA_D_OP_ENABLE_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_OP_ENABLE_0'] = {
    'addr'            : 0xc008,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CDP_RDMA_D_DATA_CUBE_WIDTH_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_DATA_CUBE_WIDTH_0'] = {
    'addr'            : 0xc00c,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_DATA_CUBE_WIDTH_0')



# Register NVDLA_CDP_RDMA_D_DATA_CUBE_HEIGHT_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_DATA_CUBE_HEIGHT_0'] = {
    'addr'            : 0xc010,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_DATA_CUBE_HEIGHT_0')



# Register NVDLA_CDP_RDMA_D_DATA_CUBE_CHANNEL_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_DATA_CUBE_CHANNEL_0'] = {
    'addr'            : 0xc014,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_DATA_CUBE_CHANNEL_0')



# Register NVDLA_CDP_RDMA_D_SRC_BASE_ADDR_LOW_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_BASE_ADDR_LOW_0'] = {
    'addr'            : 0xc018,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_LOW_0')



# Register NVDLA_CDP_RDMA_D_SRC_BASE_ADDR_HIGH_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0xc01c,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_BASE_ADDR_HIGH_0')



# Register NVDLA_CDP_RDMA_D_SRC_LINE_STRIDE_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_LINE_STRIDE_0'] = {
    'addr'            : 0xc020,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_LINE_STRIDE_0')



# Register NVDLA_CDP_RDMA_D_SRC_SURFACE_STRIDE_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_SURFACE_STRIDE_0'] = {
    'addr'            : 0xc024,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_SURFACE_STRIDE_0')



# Register NVDLA_CDP_RDMA_D_SRC_DMA_CFG_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_DMA_CFG_0'] = {
    'addr'            : 0xc028,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_DMA_CFG_0')



# Register NVDLA_CDP_RDMA_D_SRC_COMPRESSION_EN_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_SRC_COMPRESSION_EN_0'] = {
    'addr'            : 0xc02c,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x0,
    'SRC_COMPRESSION_EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'c',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SRC_COMPRESSION_EN',
    ],
} # End of register: D_SRC_COMPRESSION_EN_0

registers['NVDLA_CDP_RDMA']['register_list'].append('D_SRC_COMPRESSION_EN_0')



# Register NVDLA_CDP_RDMA_D_OPERATION_MODE_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_OPERATION_MODE_0'] = {
    'addr'            : 0xc030,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x0,
    'OPERATION_MODE' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'c',
        'enums' : {
            'READPHILE' : 0x0,
            'WRITEPHILE' : 0x1,
            'ORDINARY' : 0x2,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'OPERATION_MODE',
    ],
} # End of register: D_OPERATION_MODE_0

registers['NVDLA_CDP_RDMA']['register_list'].append('D_OPERATION_MODE_0')



# Register NVDLA_CDP_RDMA_D_DATA_FORMAT_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_DATA_FORMAT_0'] = {
    'addr'            : 0xc034,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_DATA_FORMAT_0')



# Register NVDLA_CDP_RDMA_D_PERF_ENABLE_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_PERF_ENABLE_0'] = {
    'addr'            : 0xc038,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_CDP_RDMA_D_PERF_READ_STALL_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_PERF_READ_STALL_0'] = {
    'addr'            : 0xc03c,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_PERF_READ_STALL_0')



# Register NVDLA_CDP_RDMA_D_CYA_0
if 'NVDLA_CDP_RDMA' not in registers:
    registers['NVDLA_CDP_RDMA'] = {}
    registers['NVDLA_CDP_RDMA']['register_list']  = []

registers['NVDLA_CDP_RDMA']['D_CYA_0'] = {
    'addr'            : 0xc040,
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

registers['NVDLA_CDP_RDMA']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CDP_RDMA'] = 0xc000;
