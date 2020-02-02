registers         = {}
addr_spaces       = {}

# Register NVDLA_CDP_S_STATUS_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_STATUS_0'] = {
    'addr'            : 0xd000,
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

registers['NVDLA_CDP']['register_list'].append('S_STATUS_0')



# Register NVDLA_CDP_S_POINTER_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_POINTER_0'] = {
    'addr'            : 0xd004,
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

registers['NVDLA_CDP']['register_list'].append('S_POINTER_0')



# Register NVDLA_CDP_S_LUT_ACCESS_CFG_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_ACCESS_CFG_0'] = {
    'addr'            : 0xd008,
    'size'            : 0x12,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x303ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x303ff,
    'write_mask'      : 0x303ff,
    'LUT_ADDR' : {
        'lsb'               : 0,
        'msb'               : 9,
        'size'              : 10,
        'field'             : (0x3ff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwto',
        'enums' : {
        },
    },
    'LUT_TABLE_ID' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'LE' : 0x0,
            'LO' : 0x1,
        },
    },
    'LUT_ACCESS_TYPE' : {
        'lsb'               : 17,
        'msb'               : 17,
        'size'              : 1,
        'field'             : (0x1 << 17),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'READ' : 0x0,
            'WRITE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_ADDR',
        'LUT_TABLE_ID',
        'LUT_ACCESS_TYPE',
    ],
} # End of register: S_LUT_ACCESS_CFG_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_ACCESS_CFG_0')



# Register NVDLA_CDP_S_LUT_ACCESS_DATA_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_ACCESS_DATA_0'] = {
    'addr'            : 0xd00c,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'LUT_DATA' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwto',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_DATA',
    ],
} # End of register: S_LUT_ACCESS_DATA_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_ACCESS_DATA_0')



# Register NVDLA_CDP_S_LUT_CFG_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_CFG_0'] = {
    'addr'            : 0xd010,
    'size'            : 0x7,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x71,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x71,
    'write_mask'      : 0x71,
    'LUT_LE_FUNCTION' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'EXPONENT' : 0x0,
            'LINEAR' : 0x1,
        },
    },
    'LUT_UFLOW_PRIORITY' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'LE' : 0x0,
            'LO' : 0x1,
        },
    },
    'LUT_OFLOW_PRIORITY' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'LE' : 0x0,
            'LO' : 0x1,
        },
    },
    'LUT_HYBRID_PRIORITY' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'LE' : 0x0,
            'LO' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_FUNCTION',
        'LUT_UFLOW_PRIORITY',
        'LUT_OFLOW_PRIORITY',
        'LUT_HYBRID_PRIORITY',
    ],
} # End of register: S_LUT_CFG_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_CFG_0')



# Register NVDLA_CDP_S_LUT_INFO_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_INFO_0'] = {
    'addr'            : 0xd014,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0xffffff,
    'LUT_LE_INDEX_OFFSET' : {
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
    'LUT_LE_INDEX_SELECT' : {
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
    'LUT_LO_INDEX_SELECT' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_INDEX_OFFSET',
        'LUT_LE_INDEX_SELECT',
        'LUT_LO_INDEX_SELECT',
    ],
} # End of register: S_LUT_INFO_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_INFO_0')



# Register NVDLA_CDP_S_LUT_LE_START_LOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_START_LOW_0'] = {
    'addr'            : 0xd018,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LE_START_LOW' : {
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
        'LUT_LE_START_LOW',
    ],
} # End of register: S_LUT_LE_START_LOW_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_START_LOW_0')



# Register NVDLA_CDP_S_LUT_LE_START_HIGH_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_START_HIGH_0'] = {
    'addr'            : 0xd01c,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'LUT_LE_START_HIGH' : {
        'lsb'               : 0,
        'msb'               : 5,
        'size'              : 6,
        'field'             : (0x3f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_START_HIGH',
    ],
} # End of register: S_LUT_LE_START_HIGH_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_START_HIGH_0')



# Register NVDLA_CDP_S_LUT_LE_END_LOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_END_LOW_0'] = {
    'addr'            : 0xd020,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LE_END_LOW' : {
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
        'LUT_LE_END_LOW',
    ],
} # End of register: S_LUT_LE_END_LOW_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_END_LOW_0')



# Register NVDLA_CDP_S_LUT_LE_END_HIGH_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_END_HIGH_0'] = {
    'addr'            : 0xd024,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'LUT_LE_END_HIGH' : {
        'lsb'               : 0,
        'msb'               : 5,
        'size'              : 6,
        'field'             : (0x3f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_END_HIGH',
    ],
} # End of register: S_LUT_LE_END_HIGH_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_END_HIGH_0')



# Register NVDLA_CDP_S_LUT_LO_START_LOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_START_LOW_0'] = {
    'addr'            : 0xd028,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LO_START_LOW' : {
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
        'LUT_LO_START_LOW',
    ],
} # End of register: S_LUT_LO_START_LOW_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_START_LOW_0')



# Register NVDLA_CDP_S_LUT_LO_START_HIGH_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_START_HIGH_0'] = {
    'addr'            : 0xd02c,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'LUT_LO_START_HIGH' : {
        'lsb'               : 0,
        'msb'               : 5,
        'size'              : 6,
        'field'             : (0x3f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LO_START_HIGH',
    ],
} # End of register: S_LUT_LO_START_HIGH_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_START_HIGH_0')



# Register NVDLA_CDP_S_LUT_LO_END_LOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_END_LOW_0'] = {
    'addr'            : 0xd030,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LO_END_LOW' : {
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
        'LUT_LO_END_LOW',
    ],
} # End of register: S_LUT_LO_END_LOW_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_END_LOW_0')



# Register NVDLA_CDP_S_LUT_LO_END_HIGH_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_END_HIGH_0'] = {
    'addr'            : 0xd034,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'LUT_LO_END_HIGH' : {
        'lsb'               : 0,
        'msb'               : 5,
        'size'              : 6,
        'field'             : (0x3f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LO_END_HIGH',
    ],
} # End of register: S_LUT_LO_END_HIGH_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_END_HIGH_0')



# Register NVDLA_CDP_S_LUT_LE_SLOPE_SCALE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_SLOPE_SCALE_0'] = {
    'addr'            : 0xd038,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LE_SLOPE_UFLOW_SCALE' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'LUT_LE_SLOPE_OFLOW_SCALE' : {
        'lsb'               : 16,
        'msb'               : 31,
        'size'              : 16,
        'field'             : (0xffff << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_SLOPE_UFLOW_SCALE',
        'LUT_LE_SLOPE_OFLOW_SCALE',
    ],
} # End of register: S_LUT_LE_SLOPE_SCALE_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_SLOPE_SCALE_0')



# Register NVDLA_CDP_S_LUT_LE_SLOPE_SHIFT_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LE_SLOPE_SHIFT_0'] = {
    'addr'            : 0xd03c,
    'size'            : 0xa,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3ff,
    'write_mask'      : 0x3ff,
    'LUT_LE_SLOPE_UFLOW_SHIFT' : {
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
    'LUT_LE_SLOPE_OFLOW_SHIFT' : {
        'lsb'               : 5,
        'msb'               : 9,
        'size'              : 5,
        'field'             : (0x1f << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LE_SLOPE_UFLOW_SHIFT',
        'LUT_LE_SLOPE_OFLOW_SHIFT',
    ],
} # End of register: S_LUT_LE_SLOPE_SHIFT_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LE_SLOPE_SHIFT_0')



# Register NVDLA_CDP_S_LUT_LO_SLOPE_SCALE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_SLOPE_SCALE_0'] = {
    'addr'            : 0xd040,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LO_SLOPE_UFLOW_SCALE' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'LUT_LO_SLOPE_OFLOW_SCALE' : {
        'lsb'               : 16,
        'msb'               : 31,
        'size'              : 16,
        'field'             : (0xffff << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LO_SLOPE_UFLOW_SCALE',
        'LUT_LO_SLOPE_OFLOW_SCALE',
    ],
} # End of register: S_LUT_LO_SLOPE_SCALE_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_SLOPE_SCALE_0')



# Register NVDLA_CDP_S_LUT_LO_SLOPE_SHIFT_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['S_LUT_LO_SLOPE_SHIFT_0'] = {
    'addr'            : 0xd044,
    'size'            : 0xa,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3ff,
    'write_mask'      : 0x3ff,
    'LUT_LO_SLOPE_UFLOW_SHIFT' : {
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
    'LUT_LO_SLOPE_OFLOW_SHIFT' : {
        'lsb'               : 5,
        'msb'               : 9,
        'size'              : 5,
        'field'             : (0x1f << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LUT_LO_SLOPE_UFLOW_SHIFT',
        'LUT_LO_SLOPE_OFLOW_SHIFT',
    ],
} # End of register: S_LUT_LO_SLOPE_SHIFT_0

registers['NVDLA_CDP']['register_list'].append('S_LUT_LO_SLOPE_SHIFT_0')



# Register NVDLA_CDP_D_OP_ENABLE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_OP_ENABLE_0'] = {
    'addr'            : 0xd048,
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

registers['NVDLA_CDP']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CDP_D_FUNC_BYPASS_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_FUNC_BYPASS_0'] = {
    'addr'            : 0xd04c,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'SQSUM_BYPASS' : {
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
    'MUL_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
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
        'SQSUM_BYPASS',
        'MUL_BYPASS',
    ],
} # End of register: D_FUNC_BYPASS_0

registers['NVDLA_CDP']['register_list'].append('D_FUNC_BYPASS_0')



# Register NVDLA_CDP_D_DST_BASE_ADDR_LOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_BASE_ADDR_LOW_0'] = {
    'addr'            : 0xd050,
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

registers['NVDLA_CDP']['register_list'].append('D_DST_BASE_ADDR_LOW_0')



# Register NVDLA_CDP_D_DST_BASE_ADDR_HIGH_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0xd054,
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

registers['NVDLA_CDP']['register_list'].append('D_DST_BASE_ADDR_HIGH_0')



# Register NVDLA_CDP_D_DST_LINE_STRIDE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_LINE_STRIDE_0'] = {
    'addr'            : 0xd058,
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

registers['NVDLA_CDP']['register_list'].append('D_DST_LINE_STRIDE_0')



# Register NVDLA_CDP_D_DST_SURFACE_STRIDE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_SURFACE_STRIDE_0'] = {
    'addr'            : 0xd05c,
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

registers['NVDLA_CDP']['register_list'].append('D_DST_SURFACE_STRIDE_0')



# Register NVDLA_CDP_D_DST_DMA_CFG_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_DMA_CFG_0'] = {
    'addr'            : 0xd060,
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
} # End of register: D_DST_DMA_CFG_0

registers['NVDLA_CDP']['register_list'].append('D_DST_DMA_CFG_0')



# Register NVDLA_CDP_D_DST_COMPRESSION_EN_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DST_COMPRESSION_EN_0'] = {
    'addr'            : 0xd064,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x0,
    'DST_COMPRESSION_EN' : {
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
        'DST_COMPRESSION_EN',
    ],
} # End of register: D_DST_COMPRESSION_EN_0

registers['NVDLA_CDP']['register_list'].append('D_DST_COMPRESSION_EN_0')



# Register NVDLA_CDP_D_DATA_FORMAT_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATA_FORMAT_0'] = {
    'addr'            : 0xd068,
    'size'            : 0x2,
    'reset_val'       : 0x1,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'INPUT_DATA_TYPE' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
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
        'INPUT_DATA_TYPE',
    ],
} # End of register: D_DATA_FORMAT_0

registers['NVDLA_CDP']['register_list'].append('D_DATA_FORMAT_0')



# Register NVDLA_CDP_D_NAN_FLUSH_TO_ZERO_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_NAN_FLUSH_TO_ZERO_0'] = {
    'addr'            : 0xd06c,
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

registers['NVDLA_CDP']['register_list'].append('D_NAN_FLUSH_TO_ZERO_0')



# Register NVDLA_CDP_D_LRN_CFG_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_LRN_CFG_0'] = {
    'addr'            : 0xd070,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'NORMALZ_LEN' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'LEN3' : 0x0,
            'LEN5' : 0x1,
            'LEN7' : 0x2,
            'LEN9' : 0x3,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'NORMALZ_LEN',
    ],
} # End of register: D_LRN_CFG_0

registers['NVDLA_CDP']['register_list'].append('D_LRN_CFG_0')



# Register NVDLA_CDP_D_DATIN_OFFSET_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATIN_OFFSET_0'] = {
    'addr'            : 0xd074,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'DATIN_OFFSET' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATIN_OFFSET',
    ],
} # End of register: D_DATIN_OFFSET_0

registers['NVDLA_CDP']['register_list'].append('D_DATIN_OFFSET_0')



# Register NVDLA_CDP_D_DATIN_SCALE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATIN_SCALE_0'] = {
    'addr'            : 0xd078,
    'size'            : 0x10,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'DATIN_SCALE' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATIN_SCALE',
    ],
} # End of register: D_DATIN_SCALE_0

registers['NVDLA_CDP']['register_list'].append('D_DATIN_SCALE_0')



# Register NVDLA_CDP_D_DATIN_SHIFTER_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATIN_SHIFTER_0'] = {
    'addr'            : 0xd07c,
    'size'            : 0x5,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f,
    'write_mask'      : 0x1f,
    'DATIN_SHIFTER' : {
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
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATIN_SHIFTER',
    ],
} # End of register: D_DATIN_SHIFTER_0

registers['NVDLA_CDP']['register_list'].append('D_DATIN_SHIFTER_0')



# Register NVDLA_CDP_D_DATOUT_OFFSET_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATOUT_OFFSET_0'] = {
    'addr'            : 0xd080,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATOUT_OFFSET' : {
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
        'DATOUT_OFFSET',
    ],
} # End of register: D_DATOUT_OFFSET_0

registers['NVDLA_CDP']['register_list'].append('D_DATOUT_OFFSET_0')



# Register NVDLA_CDP_D_DATOUT_SCALE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATOUT_SCALE_0'] = {
    'addr'            : 0xd084,
    'size'            : 0x10,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'DATOUT_SCALE' : {
        'lsb'               : 0,
        'msb'               : 15,
        'size'              : 16,
        'field'             : (0xffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATOUT_SCALE',
    ],
} # End of register: D_DATOUT_SCALE_0

registers['NVDLA_CDP']['register_list'].append('D_DATOUT_SCALE_0')



# Register NVDLA_CDP_D_DATOUT_SHIFTER_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_DATOUT_SHIFTER_0'] = {
    'addr'            : 0xd088,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'DATOUT_SHIFTER' : {
        'lsb'               : 0,
        'msb'               : 5,
        'size'              : 6,
        'field'             : (0x3f << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATOUT_SHIFTER',
    ],
} # End of register: D_DATOUT_SHIFTER_0

registers['NVDLA_CDP']['register_list'].append('D_DATOUT_SHIFTER_0')



# Register NVDLA_CDP_D_NAN_INPUT_NUM_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_NAN_INPUT_NUM_0'] = {
    'addr'            : 0xd08c,
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

registers['NVDLA_CDP']['register_list'].append('D_NAN_INPUT_NUM_0')



# Register NVDLA_CDP_D_INF_INPUT_NUM_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_INF_INPUT_NUM_0'] = {
    'addr'            : 0xd090,
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

registers['NVDLA_CDP']['register_list'].append('D_INF_INPUT_NUM_0')



# Register NVDLA_CDP_D_NAN_OUTPUT_NUM_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_NAN_OUTPUT_NUM_0'] = {
    'addr'            : 0xd094,
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

registers['NVDLA_CDP']['register_list'].append('D_NAN_OUTPUT_NUM_0')



# Register NVDLA_CDP_D_OUT_SATURATION_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_OUT_SATURATION_0'] = {
    'addr'            : 0xd098,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'OUT_SATURATION' : {
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
        'OUT_SATURATION',
    ],
} # End of register: D_OUT_SATURATION_0

registers['NVDLA_CDP']['register_list'].append('D_OUT_SATURATION_0')



# Register NVDLA_CDP_D_PERF_ENABLE_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_ENABLE_0'] = {
    'addr'            : 0xd09c,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
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
    'LUT_EN' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
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
        'LUT_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_CDP_D_PERF_WRITE_STALL_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_WRITE_STALL_0'] = {
    'addr'            : 0xd0a0,
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

registers['NVDLA_CDP']['register_list'].append('D_PERF_WRITE_STALL_0')



# Register NVDLA_CDP_D_PERF_LUT_UFLOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_LUT_UFLOW_0'] = {
    'addr'            : 0xd0a4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_LUT_UFLOW' : {
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
        'PERF_LUT_UFLOW',
    ],
} # End of register: D_PERF_LUT_UFLOW_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_LUT_UFLOW_0')



# Register NVDLA_CDP_D_PERF_LUT_OFLOW_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_LUT_OFLOW_0'] = {
    'addr'            : 0xd0a8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_LUT_OFLOW' : {
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
        'PERF_LUT_OFLOW',
    ],
} # End of register: D_PERF_LUT_OFLOW_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_LUT_OFLOW_0')



# Register NVDLA_CDP_D_PERF_LUT_HYBRID_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_LUT_HYBRID_0'] = {
    'addr'            : 0xd0ac,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_LUT_HYBRID' : {
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
        'PERF_LUT_HYBRID',
    ],
} # End of register: D_PERF_LUT_HYBRID_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_LUT_HYBRID_0')



# Register NVDLA_CDP_D_PERF_LUT_LE_HIT_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_LUT_LE_HIT_0'] = {
    'addr'            : 0xd0b0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_LUT_LE_HIT' : {
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
        'PERF_LUT_LE_HIT',
    ],
} # End of register: D_PERF_LUT_LE_HIT_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_LUT_LE_HIT_0')



# Register NVDLA_CDP_D_PERF_LUT_LO_HIT_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_PERF_LUT_LO_HIT_0'] = {
    'addr'            : 0xd0b4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PERF_LUT_LO_HIT' : {
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
        'PERF_LUT_LO_HIT',
    ],
} # End of register: D_PERF_LUT_LO_HIT_0

registers['NVDLA_CDP']['register_list'].append('D_PERF_LUT_LO_HIT_0')



# Register NVDLA_CDP_D_CYA_0
if 'NVDLA_CDP' not in registers:
    registers['NVDLA_CDP'] = {}
    registers['NVDLA_CDP']['register_list']  = []

registers['NVDLA_CDP']['D_CYA_0'] = {
    'addr'            : 0xd0b8,
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

registers['NVDLA_CDP']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CDP'] = 0xd000;
