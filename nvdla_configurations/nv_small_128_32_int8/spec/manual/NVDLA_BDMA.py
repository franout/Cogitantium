registers         = {}
addr_spaces       = {}

# Register NVDLA_BDMA_CFG_SRC_ADDR_LOW_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_SRC_ADDR_LOW_0'] = {
    'addr'            : 0x10000,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'V32' : {
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
        'V32',
    ],
} # End of register: CFG_SRC_ADDR_LOW_0

registers['NVDLA_BDMA']['register_list'].append('CFG_SRC_ADDR_LOW_0')



# Register NVDLA_BDMA_CFG_SRC_ADDR_HIGH_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_SRC_ADDR_HIGH_0'] = {
    'addr'            : 0x10004,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'V8' : {
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
        'V8',
    ],
} # End of register: CFG_SRC_ADDR_HIGH_0

registers['NVDLA_BDMA']['register_list'].append('CFG_SRC_ADDR_HIGH_0')



# Register NVDLA_BDMA_CFG_DST_ADDR_LOW_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_DST_ADDR_LOW_0'] = {
    'addr'            : 0x10008,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'V32' : {
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
        'V32',
    ],
} # End of register: CFG_DST_ADDR_LOW_0

registers['NVDLA_BDMA']['register_list'].append('CFG_DST_ADDR_LOW_0')



# Register NVDLA_BDMA_CFG_DST_ADDR_HIGH_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_DST_ADDR_HIGH_0'] = {
    'addr'            : 0x1000c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'V8' : {
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
        'V8',
    ],
} # End of register: CFG_DST_ADDR_HIGH_0

registers['NVDLA_BDMA']['register_list'].append('CFG_DST_ADDR_HIGH_0')



# Register NVDLA_BDMA_CFG_LINE_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_LINE_0'] = {
    'addr'            : 0x10010,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'SIZE' : {
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
        'SIZE',
    ],
} # End of register: CFG_LINE_0

registers['NVDLA_BDMA']['register_list'].append('CFG_LINE_0')



# Register NVDLA_BDMA_CFG_CMD_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_CMD_0'] = {
    'addr'            : 0x10014,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'SRC_RAM_TYPE' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CVSRAM' : 0x0,
            'MC' : 0x1,
        },
    },
    'DST_RAM_TYPE' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'CVSRAM' : 0x0,
            'MC' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SRC_RAM_TYPE',
        'DST_RAM_TYPE',
    ],
} # End of register: CFG_CMD_0

registers['NVDLA_BDMA']['register_list'].append('CFG_CMD_0')



# Register NVDLA_BDMA_CFG_LINE_REPEAT_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_LINE_REPEAT_0'] = {
    'addr'            : 0x10018,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0xffffff,
    'NUMBER' : {
        'lsb'               : 0,
        'msb'               : 23,
        'size'              : 24,
        'field'             : (0xffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'NUMBER',
    ],
} # End of register: CFG_LINE_REPEAT_0

registers['NVDLA_BDMA']['register_list'].append('CFG_LINE_REPEAT_0')



# Register NVDLA_BDMA_CFG_SRC_LINE_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_SRC_LINE_0'] = {
    'addr'            : 0x1001c,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'STRIDE' : {
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
        'STRIDE',
    ],
} # End of register: CFG_SRC_LINE_0

registers['NVDLA_BDMA']['register_list'].append('CFG_SRC_LINE_0')



# Register NVDLA_BDMA_CFG_DST_LINE_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_DST_LINE_0'] = {
    'addr'            : 0x10020,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'STRIDE' : {
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
        'STRIDE',
    ],
} # End of register: CFG_DST_LINE_0

registers['NVDLA_BDMA']['register_list'].append('CFG_DST_LINE_0')



# Register NVDLA_BDMA_CFG_SURF_REPEAT_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_SURF_REPEAT_0'] = {
    'addr'            : 0x10024,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0xffffff,
    'NUMBER' : {
        'lsb'               : 0,
        'msb'               : 23,
        'size'              : 24,
        'field'             : (0xffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'NUMBER',
    ],
} # End of register: CFG_SURF_REPEAT_0

registers['NVDLA_BDMA']['register_list'].append('CFG_SURF_REPEAT_0')



# Register NVDLA_BDMA_CFG_SRC_SURF_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_SRC_SURF_0'] = {
    'addr'            : 0x10028,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'STRIDE' : {
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
        'STRIDE',
    ],
} # End of register: CFG_SRC_SURF_0

registers['NVDLA_BDMA']['register_list'].append('CFG_SRC_SURF_0')



# Register NVDLA_BDMA_CFG_DST_SURF_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_DST_SURF_0'] = {
    'addr'            : 0x1002c,
    'size'            : 0x1b,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0xffffffe0,
    'STRIDE' : {
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
        'STRIDE',
    ],
} # End of register: CFG_DST_SURF_0

registers['NVDLA_BDMA']['register_list'].append('CFG_DST_SURF_0')



# Register NVDLA_BDMA_CFG_OP_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_OP_0'] = {
    'addr'            : 0x10030,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'EN' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'EN',
    ],
} # End of register: CFG_OP_0

registers['NVDLA_BDMA']['register_list'].append('CFG_OP_0')



# Register NVDLA_BDMA_CFG_LAUNCH0_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_LAUNCH0_0'] = {
    'addr'            : 0x10034,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'GRP0_LAUNCH' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'GRP0_LAUNCH',
    ],
} # End of register: CFG_LAUNCH0_0

registers['NVDLA_BDMA']['register_list'].append('CFG_LAUNCH0_0')



# Register NVDLA_BDMA_CFG_LAUNCH1_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_LAUNCH1_0'] = {
    'addr'            : 0x10038,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'GRP1_LAUNCH' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'GRP1_LAUNCH',
    ],
} # End of register: CFG_LAUNCH1_0

registers['NVDLA_BDMA']['register_list'].append('CFG_LAUNCH1_0')



# Register NVDLA_BDMA_CFG_STATUS_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['CFG_STATUS_0'] = {
    'addr'            : 0x1003c,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'STALL_COUNT_EN' : {
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
    # Fields sorted in order of declaration in register
    'field_list' : [
        'STALL_COUNT_EN',
    ],
} # End of register: CFG_STATUS_0

registers['NVDLA_BDMA']['register_list'].append('CFG_STATUS_0')



# Register NVDLA_BDMA_STATUS_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['STATUS_0'] = {
    'addr'            : 0x10040,
    'size'            : 0xb,
    'reset_val'       : 0x114,
    'reset_mask'      : 0x7ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7ff,
    'write_mask'      : 0x0,
    'FREE_SLOT' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x14,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    'IDLE' : {
        'lsb'               : 8,
        'msb'               : 8,
        'size'              : 1,
        'field'             : (0x1 << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'GRP0_BUSY' : {
        'lsb'               : 9,
        'msb'               : 9,
        'size'              : 1,
        'field'             : (0x1 << 9),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    'GRP1_BUSY' : {
        'lsb'               : 10,
        'msb'               : 10,
        'size'              : 1,
        'field'             : (0x1 << 10),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
            'NO' : 0x0,
            'YES' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'FREE_SLOT',
        'IDLE',
        'GRP0_BUSY',
        'GRP1_BUSY',
    ],
} # End of register: STATUS_0

registers['NVDLA_BDMA']['register_list'].append('STATUS_0')



# Register NVDLA_BDMA_STATUS_GRP0_READ_STALL_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['STATUS_GRP0_READ_STALL_0'] = {
    'addr'            : 0x10044,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'COUNT' : {
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
        'COUNT',
    ],
} # End of register: STATUS_GRP0_READ_STALL_0

registers['NVDLA_BDMA']['register_list'].append('STATUS_GRP0_READ_STALL_0')



# Register NVDLA_BDMA_STATUS_GRP0_WRITE_STALL_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['STATUS_GRP0_WRITE_STALL_0'] = {
    'addr'            : 0x10048,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'COUNT' : {
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
        'COUNT',
    ],
} # End of register: STATUS_GRP0_WRITE_STALL_0

registers['NVDLA_BDMA']['register_list'].append('STATUS_GRP0_WRITE_STALL_0')



# Register NVDLA_BDMA_STATUS_GRP1_READ_STALL_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['STATUS_GRP1_READ_STALL_0'] = {
    'addr'            : 0x1004c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'COUNT' : {
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
        'COUNT',
    ],
} # End of register: STATUS_GRP1_READ_STALL_0

registers['NVDLA_BDMA']['register_list'].append('STATUS_GRP1_READ_STALL_0')



# Register NVDLA_BDMA_STATUS_GRP1_WRITE_STALL_0
if 'NVDLA_BDMA' not in registers:
    registers['NVDLA_BDMA'] = {}
    registers['NVDLA_BDMA']['register_list']  = []

registers['NVDLA_BDMA']['STATUS_GRP1_WRITE_STALL_0'] = {
    'addr'            : 0x10050,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'COUNT' : {
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
        'COUNT',
    ],
} # End of register: STATUS_GRP1_WRITE_STALL_0

registers['NVDLA_BDMA']['register_list'].append('STATUS_GRP1_WRITE_STALL_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_BDMA'] = 0x10000;
