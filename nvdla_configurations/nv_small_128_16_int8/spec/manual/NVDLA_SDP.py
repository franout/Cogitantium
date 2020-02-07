registers         = {}
addr_spaces       = {}

# Register NVDLA_SDP_S_STATUS_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_STATUS_0'] = {
    'addr'            : 0x9000,
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

registers['NVDLA_SDP']['register_list'].append('S_STATUS_0')



# Register NVDLA_SDP_S_POINTER_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_POINTER_0'] = {
    'addr'            : 0x9004,
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

registers['NVDLA_SDP']['register_list'].append('S_POINTER_0')



# Register NVDLA_SDP_S_LUT_ACCESS_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_ACCESS_CFG_0'] = {
    'addr'            : 0x9008,
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
        'action'            : 'rwt',
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_ACCESS_CFG_0')



# Register NVDLA_SDP_S_LUT_ACCESS_DATA_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_ACCESS_DATA_0'] = {
    'addr'            : 0x900c,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_ACCESS_DATA_0')



# Register NVDLA_SDP_S_LUT_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_CFG_0'] = {
    'addr'            : 0x9010,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_CFG_0')



# Register NVDLA_SDP_S_LUT_INFO_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_INFO_0'] = {
    'addr'            : 0x9014,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_INFO_0')



# Register NVDLA_SDP_S_LUT_LE_START_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LE_START_0'] = {
    'addr'            : 0x9018,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LE_START' : {
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
        'LUT_LE_START',
    ],
} # End of register: S_LUT_LE_START_0

registers['NVDLA_SDP']['register_list'].append('S_LUT_LE_START_0')



# Register NVDLA_SDP_S_LUT_LE_END_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LE_END_0'] = {
    'addr'            : 0x901c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LE_END' : {
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
        'LUT_LE_END',
    ],
} # End of register: S_LUT_LE_END_0

registers['NVDLA_SDP']['register_list'].append('S_LUT_LE_END_0')



# Register NVDLA_SDP_S_LUT_LO_START_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LO_START_0'] = {
    'addr'            : 0x9020,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LO_START' : {
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
        'LUT_LO_START',
    ],
} # End of register: S_LUT_LO_START_0

registers['NVDLA_SDP']['register_list'].append('S_LUT_LO_START_0')



# Register NVDLA_SDP_S_LUT_LO_END_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LO_END_0'] = {
    'addr'            : 0x9024,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LUT_LO_END' : {
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
        'LUT_LO_END',
    ],
} # End of register: S_LUT_LO_END_0

registers['NVDLA_SDP']['register_list'].append('S_LUT_LO_END_0')



# Register NVDLA_SDP_S_LUT_LE_SLOPE_SCALE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LE_SLOPE_SCALE_0'] = {
    'addr'            : 0x9028,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_LE_SLOPE_SCALE_0')



# Register NVDLA_SDP_S_LUT_LE_SLOPE_SHIFT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LE_SLOPE_SHIFT_0'] = {
    'addr'            : 0x902c,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_LE_SLOPE_SHIFT_0')



# Register NVDLA_SDP_S_LUT_LO_SLOPE_SCALE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LO_SLOPE_SCALE_0'] = {
    'addr'            : 0x9030,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_LO_SLOPE_SCALE_0')



# Register NVDLA_SDP_S_LUT_LO_SLOPE_SHIFT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['S_LUT_LO_SLOPE_SHIFT_0'] = {
    'addr'            : 0x9034,
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

registers['NVDLA_SDP']['register_list'].append('S_LUT_LO_SLOPE_SHIFT_0')



# Register NVDLA_SDP_D_OP_ENABLE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_OP_ENABLE_0'] = {
    'addr'            : 0x9038,
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

registers['NVDLA_SDP']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_SDP_D_DATA_CUBE_WIDTH_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DATA_CUBE_WIDTH_0'] = {
    'addr'            : 0x903c,
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

registers['NVDLA_SDP']['register_list'].append('D_DATA_CUBE_WIDTH_0')



# Register NVDLA_SDP_D_DATA_CUBE_HEIGHT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DATA_CUBE_HEIGHT_0'] = {
    'addr'            : 0x9040,
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

registers['NVDLA_SDP']['register_list'].append('D_DATA_CUBE_HEIGHT_0')



# Register NVDLA_SDP_D_DATA_CUBE_CHANNEL_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DATA_CUBE_CHANNEL_0'] = {
    'addr'            : 0x9044,
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

registers['NVDLA_SDP']['register_list'].append('D_DATA_CUBE_CHANNEL_0')



# Register NVDLA_SDP_D_DST_BASE_ADDR_LOW_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_BASE_ADDR_LOW_0'] = {
    'addr'            : 0x9048,
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

registers['NVDLA_SDP']['register_list'].append('D_DST_BASE_ADDR_LOW_0')



# Register NVDLA_SDP_D_DST_BASE_ADDR_HIGH_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_BASE_ADDR_HIGH_0'] = {
    'addr'            : 0x904c,
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

registers['NVDLA_SDP']['register_list'].append('D_DST_BASE_ADDR_HIGH_0')



# Register NVDLA_SDP_D_DST_LINE_STRIDE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_LINE_STRIDE_0'] = {
    'addr'            : 0x9050,
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

registers['NVDLA_SDP']['register_list'].append('D_DST_LINE_STRIDE_0')



# Register NVDLA_SDP_D_DST_SURFACE_STRIDE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_SURFACE_STRIDE_0'] = {
    'addr'            : 0x9054,
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

registers['NVDLA_SDP']['register_list'].append('D_DST_SURFACE_STRIDE_0')



# Register NVDLA_SDP_D_DP_BS_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BS_CFG_0'] = {
    'addr'            : 0x9058,
    'size'            : 0x7,
    'reset_val'       : 0x73,
    'reset_mask'      : 0x7f,
    'sw_default_val'  : 0x53,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7f,
    'write_mask'      : 0x7f,
    'BS_BYPASS' : {
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
    'BS_ALU_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BS_ALU_ALGO' : {
        'lsb'               : 2,
        'msb'               : 3,
        'size'              : 2,
        'field'             : (0x3 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MAX' : 0x0,
            'MIN' : 0x1,
            'SUM' : 0x2,
        },
    },
    'BS_MUL_BYPASS' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BS_MUL_PRELU' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BS_RELU_BYPASS' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BS_BYPASS',
        'BS_ALU_BYPASS',
        'BS_ALU_ALGO',
        'BS_MUL_BYPASS',
        'BS_MUL_PRELU',
        'BS_RELU_BYPASS',
    ],
} # End of register: D_DP_BS_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BS_CFG_0')



# Register NVDLA_SDP_D_DP_BS_ALU_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BS_ALU_CFG_0'] = {
    'addr'            : 0x905c,
    'size'            : 0xe,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f01,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f01,
    'write_mask'      : 0x3f01,
    'BS_ALU_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'BS_ALU_SHIFT_VALUE' : {
        'lsb'               : 8,
        'msb'               : 13,
        'size'              : 6,
        'field'             : (0x3f << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BS_ALU_SRC',
        'BS_ALU_SHIFT_VALUE',
    ],
} # End of register: D_DP_BS_ALU_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BS_ALU_CFG_0')



# Register NVDLA_SDP_D_DP_BS_ALU_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BS_ALU_SRC_VALUE_0'] = {
    'addr'            : 0x9060,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'BS_ALU_OPERAND' : {
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
        'BS_ALU_OPERAND',
    ],
} # End of register: D_DP_BS_ALU_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BS_ALU_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_BS_MUL_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BS_MUL_CFG_0'] = {
    'addr'            : 0x9064,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff01,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff01,
    'write_mask'      : 0xff01,
    'BS_MUL_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'BS_MUL_SHIFT_VALUE' : {
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
        'BS_MUL_SRC',
        'BS_MUL_SHIFT_VALUE',
    ],
} # End of register: D_DP_BS_MUL_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BS_MUL_CFG_0')



# Register NVDLA_SDP_D_DP_BS_MUL_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BS_MUL_SRC_VALUE_0'] = {
    'addr'            : 0x9068,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'BS_MUL_OPERAND' : {
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
        'BS_MUL_OPERAND',
    ],
} # End of register: D_DP_BS_MUL_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BS_MUL_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_BN_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BN_CFG_0'] = {
    'addr'            : 0x906c,
    'size'            : 0x7,
    'reset_val'       : 0x53,
    'reset_mask'      : 0x7f,
    'sw_default_val'  : 0x53,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7f,
    'write_mask'      : 0x7f,
    'BN_BYPASS' : {
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
    'BN_ALU_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BN_ALU_ALGO' : {
        'lsb'               : 2,
        'msb'               : 3,
        'size'              : 2,
        'field'             : (0x3 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MAX' : 0x0,
            'MIN' : 0x1,
            'SUM' : 0x2,
        },
    },
    'BN_MUL_BYPASS' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BN_MUL_PRELU' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'BN_RELU_BYPASS' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BN_BYPASS',
        'BN_ALU_BYPASS',
        'BN_ALU_ALGO',
        'BN_MUL_BYPASS',
        'BN_MUL_PRELU',
        'BN_RELU_BYPASS',
    ],
} # End of register: D_DP_BN_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BN_CFG_0')



# Register NVDLA_SDP_D_DP_BN_ALU_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BN_ALU_CFG_0'] = {
    'addr'            : 0x9070,
    'size'            : 0xe,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f01,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f01,
    'write_mask'      : 0x3f01,
    'BN_ALU_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'BN_ALU_SHIFT_VALUE' : {
        'lsb'               : 8,
        'msb'               : 13,
        'size'              : 6,
        'field'             : (0x3f << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BN_ALU_SRC',
        'BN_ALU_SHIFT_VALUE',
    ],
} # End of register: D_DP_BN_ALU_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BN_ALU_CFG_0')



# Register NVDLA_SDP_D_DP_BN_ALU_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BN_ALU_SRC_VALUE_0'] = {
    'addr'            : 0x9074,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'BN_ALU_OPERAND' : {
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
        'BN_ALU_OPERAND',
    ],
} # End of register: D_DP_BN_ALU_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BN_ALU_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_BN_MUL_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BN_MUL_CFG_0'] = {
    'addr'            : 0x9078,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xff01,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff01,
    'write_mask'      : 0xff01,
    'BN_MUL_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'BN_MUL_SHIFT_VALUE' : {
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
        'BN_MUL_SRC',
        'BN_MUL_SHIFT_VALUE',
    ],
} # End of register: D_DP_BN_MUL_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BN_MUL_CFG_0')



# Register NVDLA_SDP_D_DP_BN_MUL_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_BN_MUL_SRC_VALUE_0'] = {
    'addr'            : 0x907c,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'BN_MUL_OPERAND' : {
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
        'BN_MUL_OPERAND',
    ],
} # End of register: D_DP_BN_MUL_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_BN_MUL_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_CFG_0'] = {
    'addr'            : 0x9080,
    'size'            : 0x7,
    'reset_val'       : 0x53,
    'reset_mask'      : 0x7f,
    'sw_default_val'  : 0x53,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7f,
    'write_mask'      : 0x7f,
    'EW_BYPASS' : {
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
    'EW_ALU_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'EW_ALU_ALGO' : {
        'lsb'               : 2,
        'msb'               : 3,
        'size'              : 2,
        'field'             : (0x3 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MAX' : 0x0,
            'MIN' : 0x1,
            'SUM' : 0x2,
            'EQL' : 0x3,
        },
    },
    'EW_MUL_BYPASS' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'EW_MUL_PRELU' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'EW_LUT_BYPASS' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'EW_BYPASS',
        'EW_ALU_BYPASS',
        'EW_ALU_ALGO',
        'EW_MUL_BYPASS',
        'EW_MUL_PRELU',
        'EW_LUT_BYPASS',
    ],
} # End of register: D_DP_EW_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_CFG_0')



# Register NVDLA_SDP_D_DP_EW_ALU_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_ALU_CFG_0'] = {
    'addr'            : 0x9084,
    'size'            : 0x2,
    'reset_val'       : 0x2,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x2,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'EW_ALU_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'EW_ALU_CVT_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'EW_ALU_SRC',
        'EW_ALU_CVT_BYPASS',
    ],
} # End of register: D_DP_EW_ALU_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_ALU_CFG_0')



# Register NVDLA_SDP_D_DP_EW_ALU_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_ALU_SRC_VALUE_0'] = {
    'addr'            : 0x9088,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_ALU_OPERAND' : {
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
        'EW_ALU_OPERAND',
    ],
} # End of register: D_DP_EW_ALU_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_ALU_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_ALU_CVT_OFFSET_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_ALU_CVT_OFFSET_VALUE_0'] = {
    'addr'            : 0x908c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_ALU_CVT_OFFSET' : {
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
        'EW_ALU_CVT_OFFSET',
    ],
} # End of register: D_DP_EW_ALU_CVT_OFFSET_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_ALU_CVT_OFFSET_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_ALU_CVT_SCALE_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_ALU_CVT_SCALE_VALUE_0'] = {
    'addr'            : 0x9090,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'EW_ALU_CVT_SCALE' : {
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
        'EW_ALU_CVT_SCALE',
    ],
} # End of register: D_DP_EW_ALU_CVT_SCALE_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_ALU_CVT_SCALE_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0'] = {
    'addr'            : 0x9094,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'EW_ALU_CVT_TRUNCATE' : {
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
        'EW_ALU_CVT_TRUNCATE',
    ],
} # End of register: D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_ALU_CVT_TRUNCATE_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_MUL_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_MUL_CFG_0'] = {
    'addr'            : 0x9098,
    'size'            : 0x2,
    'reset_val'       : 0x2,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x2,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'EW_MUL_SRC' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'REG' : 0x0,
            'MEM' : 0x1,
        },
    },
    'EW_MUL_CVT_BYPASS' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x1,
        'sw_default'        : 0x1,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'EW_MUL_SRC',
        'EW_MUL_CVT_BYPASS',
    ],
} # End of register: D_DP_EW_MUL_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_MUL_CFG_0')



# Register NVDLA_SDP_D_DP_EW_MUL_SRC_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_MUL_SRC_VALUE_0'] = {
    'addr'            : 0x909c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_MUL_OPERAND' : {
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
        'EW_MUL_OPERAND',
    ],
} # End of register: D_DP_EW_MUL_SRC_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_MUL_SRC_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_MUL_CVT_OFFSET_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_MUL_CVT_OFFSET_VALUE_0'] = {
    'addr'            : 0x90a0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'EW_MUL_CVT_OFFSET' : {
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
        'EW_MUL_CVT_OFFSET',
    ],
} # End of register: D_DP_EW_MUL_CVT_OFFSET_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_MUL_CVT_OFFSET_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_MUL_CVT_SCALE_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_MUL_CVT_SCALE_VALUE_0'] = {
    'addr'            : 0x90a4,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'EW_MUL_CVT_SCALE' : {
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
        'EW_MUL_CVT_SCALE',
    ],
} # End of register: D_DP_EW_MUL_CVT_SCALE_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_MUL_CVT_SCALE_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0'] = {
    'addr'            : 0x90a8,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'EW_MUL_CVT_TRUNCATE' : {
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
        'EW_MUL_CVT_TRUNCATE',
    ],
} # End of register: D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_MUL_CVT_TRUNCATE_VALUE_0')



# Register NVDLA_SDP_D_DP_EW_TRUNCATE_VALUE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DP_EW_TRUNCATE_VALUE_0'] = {
    'addr'            : 0x90ac,
    'size'            : 0xa,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3ff,
    'write_mask'      : 0x3ff,
    'EW_TRUNCATE' : {
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
    # Fields sorted in order of declaration in register
    'field_list' : [
        'EW_TRUNCATE',
    ],
} # End of register: D_DP_EW_TRUNCATE_VALUE_0

registers['NVDLA_SDP']['register_list'].append('D_DP_EW_TRUNCATE_VALUE_0')



# Register NVDLA_SDP_D_FEATURE_MODE_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_FEATURE_MODE_CFG_0'] = {
    'addr'            : 0x90b0,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f0f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f0f,
    'write_mask'      : 0x1f0f,
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
    'OUTPUT_DST' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'MEM' : 0x0,
            'PDP' : 0x1,
        },
    },
    'WINOGRAD' : {
        'lsb'               : 2,
        'msb'               : 2,
        'size'              : 1,
        'field'             : (0x1 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'OFF' : 0x0,
            'ON' : 0x1,
        },
    },
    'NAN_TO_ZERO' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
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
        'OUTPUT_DST',
        'WINOGRAD',
        'NAN_TO_ZERO',
        'BATCH_NUMBER',
    ],
} # End of register: D_FEATURE_MODE_CFG_0

registers['NVDLA_SDP']['register_list'].append('D_FEATURE_MODE_CFG_0')



# Register NVDLA_SDP_D_DST_DMA_CFG_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_DMA_CFG_0'] = {
    'addr'            : 0x90b4,
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

registers['NVDLA_SDP']['register_list'].append('D_DST_DMA_CFG_0')



# Register NVDLA_SDP_D_DST_BATCH_STRIDE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DST_BATCH_STRIDE_0'] = {
    'addr'            : 0x90b8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DST_BATCH_STRIDE' : {
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
        'DST_BATCH_STRIDE',
    ],
} # End of register: D_DST_BATCH_STRIDE_0

registers['NVDLA_SDP']['register_list'].append('D_DST_BATCH_STRIDE_0')



# Register NVDLA_SDP_D_DATA_FORMAT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_DATA_FORMAT_0'] = {
    'addr'            : 0x90bc,
    'size'            : 0x4,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xf,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xf,
    'write_mask'      : 0xf,
    'PROC_PRECISION' : {
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
    'OUT_PRECISION' : {
        'lsb'               : 2,
        'msb'               : 3,
        'size'              : 2,
        'field'             : (0x3 << 2),
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
        'PROC_PRECISION',
        'OUT_PRECISION',
    ],
} # End of register: D_DATA_FORMAT_0

registers['NVDLA_SDP']['register_list'].append('D_DATA_FORMAT_0')



# Register NVDLA_SDP_D_CVT_OFFSET_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_CVT_OFFSET_0'] = {
    'addr'            : 0x90c0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'CVT_OFFSET' : {
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
        'CVT_OFFSET',
    ],
} # End of register: D_CVT_OFFSET_0

registers['NVDLA_SDP']['register_list'].append('D_CVT_OFFSET_0')



# Register NVDLA_SDP_D_CVT_SCALE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_CVT_SCALE_0'] = {
    'addr'            : 0x90c4,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'CVT_SCALE' : {
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
        'CVT_SCALE',
    ],
} # End of register: D_CVT_SCALE_0

registers['NVDLA_SDP']['register_list'].append('D_CVT_SCALE_0')



# Register NVDLA_SDP_D_CVT_SHIFT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_CVT_SHIFT_0'] = {
    'addr'            : 0x90c8,
    'size'            : 0x6,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f,
    'write_mask'      : 0x3f,
    'CVT_SHIFT' : {
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
        'CVT_SHIFT',
    ],
} # End of register: D_CVT_SHIFT_0

registers['NVDLA_SDP']['register_list'].append('D_CVT_SHIFT_0')



# Register NVDLA_SDP_D_STATUS_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_STATUS_0'] = {
    'addr'            : 0x90cc,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x0,
    'STATUS_UNEQUAL' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'STATUS_UNEQUAL',
    ],
} # End of register: D_STATUS_0

registers['NVDLA_SDP']['register_list'].append('D_STATUS_0')



# Register NVDLA_SDP_D_STATUS_NAN_INPUT_NUM_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_STATUS_NAN_INPUT_NUM_0'] = {
    'addr'            : 0x90d0,
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

registers['NVDLA_SDP']['register_list'].append('D_STATUS_NAN_INPUT_NUM_0')



# Register NVDLA_SDP_D_STATUS_INF_INPUT_NUM_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_STATUS_INF_INPUT_NUM_0'] = {
    'addr'            : 0x90d4,
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

registers['NVDLA_SDP']['register_list'].append('D_STATUS_INF_INPUT_NUM_0')



# Register NVDLA_SDP_D_STATUS_NAN_OUTPUT_NUM_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_STATUS_NAN_OUTPUT_NUM_0'] = {
    'addr'            : 0x90d8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'STATUS_NAN_OUTPUT_NUM' : {
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
        'STATUS_NAN_OUTPUT_NUM',
    ],
} # End of register: D_STATUS_NAN_OUTPUT_NUM_0

registers['NVDLA_SDP']['register_list'].append('D_STATUS_NAN_OUTPUT_NUM_0')



# Register NVDLA_SDP_D_PERF_ENABLE_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_ENABLE_0'] = {
    'addr'            : 0x90dc,
    'size'            : 0x4,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xf,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xf,
    'write_mask'      : 0xf,
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
    'PERF_LUT_EN' : {
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
    'PERF_SAT_EN' : {
        'lsb'               : 2,
        'msb'               : 2,
        'size'              : 1,
        'field'             : (0x1 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'PERF_NAN_INF_COUNT_EN' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
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
        'PERF_LUT_EN',
        'PERF_SAT_EN',
        'PERF_NAN_INF_COUNT_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_SDP_D_PERF_WDMA_WRITE_STALL_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_WDMA_WRITE_STALL_0'] = {
    'addr'            : 0x90e0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'WDMA_STALL' : {
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
        'WDMA_STALL',
    ],
} # End of register: D_PERF_WDMA_WRITE_STALL_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_WDMA_WRITE_STALL_0')



# Register NVDLA_SDP_D_PERF_LUT_UFLOW_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_LUT_UFLOW_0'] = {
    'addr'            : 0x90e4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'LUT_UFLOW' : {
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
        'LUT_UFLOW',
    ],
} # End of register: D_PERF_LUT_UFLOW_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_LUT_UFLOW_0')



# Register NVDLA_SDP_D_PERF_LUT_OFLOW_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_LUT_OFLOW_0'] = {
    'addr'            : 0x90e8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'LUT_OFLOW' : {
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
        'LUT_OFLOW',
    ],
} # End of register: D_PERF_LUT_OFLOW_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_LUT_OFLOW_0')



# Register NVDLA_SDP_D_PERF_OUT_SATURATION_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_OUT_SATURATION_0'] = {
    'addr'            : 0x90ec,
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
} # End of register: D_PERF_OUT_SATURATION_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_OUT_SATURATION_0')



# Register NVDLA_SDP_D_PERF_LUT_HYBRID_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_LUT_HYBRID_0'] = {
    'addr'            : 0x90f0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'LUT_HYBRID' : {
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
        'LUT_HYBRID',
    ],
} # End of register: D_PERF_LUT_HYBRID_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_LUT_HYBRID_0')



# Register NVDLA_SDP_D_PERF_LUT_LE_HIT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_LUT_LE_HIT_0'] = {
    'addr'            : 0x90f4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'LUT_LE_HIT' : {
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
        'LUT_LE_HIT',
    ],
} # End of register: D_PERF_LUT_LE_HIT_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_LUT_LE_HIT_0')



# Register NVDLA_SDP_D_PERF_LUT_LO_HIT_0
if 'NVDLA_SDP' not in registers:
    registers['NVDLA_SDP'] = {}
    registers['NVDLA_SDP']['register_list']  = []

registers['NVDLA_SDP']['D_PERF_LUT_LO_HIT_0'] = {
    'addr'            : 0x90f8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'LUT_LO_HIT' : {
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
        'LUT_LO_HIT',
    ],
} # End of register: D_PERF_LUT_LO_HIT_0

registers['NVDLA_SDP']['register_list'].append('D_PERF_LUT_LO_HIT_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_SDP'] = 0x9000;
