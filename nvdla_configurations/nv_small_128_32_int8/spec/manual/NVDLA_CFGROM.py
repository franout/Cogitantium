registers         = {}
addr_spaces       = {}

# Register NVDLA_CFGROM_CFGROM_HW_VERSION_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_HW_VERSION_0'] = {
    'addr'            : 0x0,
    'size'            : 0x20,
    'reset_val'       : 0x10001,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'HW_VERSION' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10001,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'HW_VERSION',
    ],
} # End of register: CFGROM_HW_VERSION_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_HW_VERSION_0')



# Register NVDLA_CFGROM_CFGROM_GLB_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_GLB_DESC_0'] = {
    'addr'            : 0x4,
    'size'            : 0x20,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'GLB_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'GLB_DESC',
    ],
} # End of register: CFGROM_GLB_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_GLB_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CIF_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_DESC_0'] = {
    'addr'            : 0x8,
    'size'            : 0x20,
    'reset_val'       : 0x180002,
    'reset_mask'      : 0x7ffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CIF_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x180002,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CIF_DESC',
    ],
} # End of register: CFGROM_CIF_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CIF_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_CAP_INCOMPAT_0'] = {
    'addr'            : 0xc,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CIF_CAP_INCOMPAT' : {
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
        'CIF_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CIF_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CIF_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_CAP_COMPAT_0'] = {
    'addr'            : 0x10,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CIF_CAP_COMPAT' : {
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
        'CIF_CAP_COMPAT',
    ],
} # End of register: CFGROM_CIF_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CIF_BASE_WIDTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_BASE_WIDTH_0'] = {
    'addr'            : 0x14,
    'size'            : 0x8,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xf,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xff,
    'write_mask'      : 0x0,
    'CIF_BASE_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CIF_BASE_WIDTH',
    ],
} # End of register: CFGROM_CIF_BASE_WIDTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_BASE_WIDTH_0')



# Register NVDLA_CFGROM_CFGROM_CIF_BASE_LATENCY_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_BASE_LATENCY_0'] = {
    'addr'            : 0x18,
    'size'            : 0x20,
    'reset_val'       : 0x32,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CIF_BASE_LATENCY' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x32,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CIF_BASE_LATENCY',
    ],
} # End of register: CFGROM_CIF_BASE_LATENCY_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_BASE_LATENCY_0')



# Register NVDLA_CFGROM_CFGROM_CIF_BASE_BURST_LENGTH_MAX_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_BASE_BURST_LENGTH_MAX_0'] = {
    'addr'            : 0x1c,
    'size'            : 0x1b,
    'reset_val'       : 0x80,
    'reset_mask'      : 0x1fe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0x0,
    'BASE_BURST_LENGTH_MAX' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x4,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BASE_BURST_LENGTH_MAX',
    ],
} # End of register: CFGROM_CIF_BASE_BURST_LENGTH_MAX_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_BASE_BURST_LENGTH_MAX_0')



# Register NVDLA_CFGROM_CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0'] = {
    'addr'            : 0x20,
    'size'            : 0x1b,
    'reset_val'       : 0x400,
    'reset_mask'      : 0x1fe0,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffe0,
    'write_mask'      : 0x0,
    'CIF_BASE_MEM_ADDR_WIDTH' : {
        'lsb'               : 5,
        'msb'               : 31,
        'size'              : 27,
        'field'             : (0x7ffffff << 5),
        'default'           : 0x20,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CIF_BASE_MEM_ADDR_WIDTH',
    ],
} # End of register: CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CIF_BASE_MEM_ADDR_WIDTH_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_DESC_0'] = {
    'addr'            : 0x24,
    'size'            : 0x20,
    'reset_val'       : 0x340003,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x340003,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_DESC',
    ],
} # End of register: CFGROM_CDMA_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_CAP_INCOMPAT_0'] = {
    'addr'            : 0x28,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_CAP_INCOMPAT' : {
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
        'CDMA_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CDMA_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_CAP_COMPAT_0'] = {
    'addr'            : 0x2c,
    'size'            : 0x20,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_CAP_COMPAT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_CAP_COMPAT',
    ],
} # End of register: CFGROM_CDMA_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0x30,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CDMA_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CDMA_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0x34,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CDMA_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_CDMA_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_C_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_ATOMIC_C_0'] = {
    'addr'            : 0x38,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_ATOMIC_C' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_ATOMIC_C',
    ],
} # End of register: CFGROM_CDMA_BASE_ATOMIC_C_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_ATOMIC_C_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_K_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_ATOMIC_K_0'] = {
    'addr'            : 0x3c,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_ATOMIC_K' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_ATOMIC_K',
    ],
} # End of register: CFGROM_CDMA_BASE_ATOMIC_K_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_ATOMIC_K_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_ATOMIC_M_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_ATOMIC_M_0'] = {
    'addr'            : 0x40,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_ATOMIC_M' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_ATOMIC_M',
    ],
} # End of register: CFGROM_CDMA_BASE_ATOMIC_M_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_ATOMIC_M_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_NUM_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_CBUF_BANK_NUM_0'] = {
    'addr'            : 0x44,
    'size'            : 0x20,
    'reset_val'       : 0x20,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_CBUF_BANK_NUM' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x20,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_CBUF_BANK_NUM',
    ],
} # End of register: CFGROM_CDMA_BASE_CBUF_BANK_NUM_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_CBUF_BANK_NUM_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0'] = {
    'addr'            : 0x48,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_CBUF_BANK_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_CBUF_BANK_WIDTH',
    ],
} # End of register: CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_CBUF_BANK_WIDTH_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0'] = {
    'addr'            : 0x4c,
    'size'            : 0x20,
    'reset_val'       : 0x200,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_BASE_CBUF_BANK_DEPTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x200,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_BASE_CBUF_BANK_DEPTH',
    ],
} # End of register: CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_BASE_CBUF_BANK_DEPTH_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_MULTI_BATCH_MAX_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_MULTI_BATCH_MAX_0'] = {
    'addr'            : 0x50,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_MULTI_BATCH_MAX' : {
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
        'CDMA_MULTI_BATCH_MAX',
    ],
} # End of register: CFGROM_CDMA_MULTI_BATCH_MAX_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_MULTI_BATCH_MAX_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0'] = {
    'addr'            : 0x54,
    'size'            : 0x20,
    'reset_val'       : 0xcfff001,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_IMAGE_IN_FORMATS_PACKED' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xcfff001,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_IMAGE_IN_FORMATS_PACKED',
    ],
} # End of register: CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_IMAGE_IN_FORMATS_PACKED_0')



# Register NVDLA_CFGROM_CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0'] = {
    'addr'            : 0x58,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDMA_IMAGE_IN_FORMATS_SEMI' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDMA_IMAGE_IN_FORMATS_SEMI',
    ],
} # End of register: CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDMA_IMAGE_IN_FORMATS_SEMI_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_DESC_0'] = {
    'addr'            : 0x5c,
    'size'            : 0x20,
    'reset_val'       : 0x180004,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x180004,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CBUF_DESC',
    ],
} # End of register: CFGROM_CBUF_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_CAP_INCOMPAT_0'] = {
    'addr'            : 0x60,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_CAP_INCOMPAT' : {
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
        'CBUF_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CBUF_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_CAP_COMPAT_0'] = {
    'addr'            : 0x64,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_CAP_COMPAT' : {
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
        'CBUF_CAP_COMPAT',
    ],
} # End of register: CFGROM_CBUF_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_NUM_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_BASE_CBUF_BANK_NUM_0'] = {
    'addr'            : 0x68,
    'size'            : 0x20,
    'reset_val'       : 0x20,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_BASE_CBUF_BANK_NUM' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x20,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CBUF_BASE_CBUF_BANK_NUM',
    ],
} # End of register: CFGROM_CBUF_BASE_CBUF_BANK_NUM_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_BASE_CBUF_BANK_NUM_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0'] = {
    'addr'            : 0x6c,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_BASE_CBUF_BANK_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CBUF_BASE_CBUF_BANK_WIDTH',
    ],
} # End of register: CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_BASE_CBUF_BANK_WIDTH_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0'] = {
    'addr'            : 0x70,
    'size'            : 0x20,
    'reset_val'       : 0x200,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_BASE_CBUF_BANK_DEPTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x200,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CBUF_BASE_CBUF_BANK_DEPTH',
    ],
} # End of register: CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_BASE_CBUF_BANK_DEPTH_0')



# Register NVDLA_CFGROM_CFGROM_CBUF_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CBUF_BASE_CDMA_ID_0'] = {
    'addr'            : 0x74,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CBUF_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CBUF_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_CBUF_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CBUF_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_CSC_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_DESC_0'] = {
    'addr'            : 0x78,
    'size'            : 0x20,
    'reset_val'       : 0x300005,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x300005,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_DESC',
    ],
} # End of register: CFGROM_CSC_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CSC_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_CAP_INCOMPAT_0'] = {
    'addr'            : 0x7c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_CAP_INCOMPAT' : {
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
        'CSC_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CSC_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CSC_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_CAP_COMPAT_0'] = {
    'addr'            : 0x80,
    'size'            : 0x20,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_CAP_COMPAT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_CAP_COMPAT',
    ],
} # End of register: CFGROM_CSC_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0x84,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CSC_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CSC_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0x88,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CSC_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_CSC_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_C_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_ATOMIC_C_0'] = {
    'addr'            : 0x8c,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_ATOMIC_C' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_ATOMIC_C',
    ],
} # End of register: CFGROM_CSC_BASE_ATOMIC_C_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_ATOMIC_C_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_K_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_ATOMIC_K_0'] = {
    'addr'            : 0x90,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_ATOMIC_K' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_ATOMIC_K',
    ],
} # End of register: CFGROM_CSC_BASE_ATOMIC_K_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_ATOMIC_K_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_ATOMIC_M_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_ATOMIC_M_0'] = {
    'addr'            : 0x94,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_ATOMIC_M' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_ATOMIC_M',
    ],
} # End of register: CFGROM_CSC_BASE_ATOMIC_M_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_ATOMIC_M_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_NUM_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_CBUF_BANK_NUM_0'] = {
    'addr'            : 0x98,
    'size'            : 0x20,
    'reset_val'       : 0x20,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_CBUF_BANK_NUM' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x20,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_CBUF_BANK_NUM',
    ],
} # End of register: CFGROM_CSC_BASE_CBUF_BANK_NUM_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_CBUF_BANK_NUM_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0'] = {
    'addr'            : 0x9c,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_CBUF_BANK_WIDTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_CBUF_BANK_WIDTH',
    ],
} # End of register: CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_CBUF_BANK_WIDTH_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0'] = {
    'addr'            : 0xa0,
    'size'            : 0x20,
    'reset_val'       : 0x200,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_CBUF_BANK_DEPTH' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x200,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_CBUF_BANK_DEPTH',
    ],
} # End of register: CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_CBUF_BANK_DEPTH_0')



# Register NVDLA_CFGROM_CFGROM_CSC_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_BASE_CDMA_ID_0'] = {
    'addr'            : 0xa4,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CSC_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_CSC_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_CSC_MULTI_BATCH_MAX_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CSC_MULTI_BATCH_MAX_0'] = {
    'addr'            : 0xa8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CSC_MULTI_BATCH_MAX' : {
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
        'CSC_MULTI_BATCH_MAX',
    ],
} # End of register: CFGROM_CSC_MULTI_BATCH_MAX_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CSC_MULTI_BATCH_MAX_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_DESC_0'] = {
    'addr'            : 0xac,
    'size'            : 0x20,
    'reset_val'       : 0x1c0006,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1c0006,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_DESC',
    ],
} # End of register: CFGROM_CMAC_A_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_CAP_INCOMPAT_0'] = {
    'addr'            : 0xb0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_CAP_INCOMPAT' : {
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
        'CMAC_A_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CMAC_A_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_CAP_COMPAT_0'] = {
    'addr'            : 0xb4,
    'size'            : 0x20,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_CAP_COMPAT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_CAP_COMPAT',
    ],
} # End of register: CFGROM_CMAC_A_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0xb8,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CMAC_A_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CMAC_A_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0xbc,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CMAC_A_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_C_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_BASE_ATOMIC_C_0'] = {
    'addr'            : 0xc0,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_BASE_ATOMIC_C' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_BASE_ATOMIC_C',
    ],
} # End of register: CFGROM_CMAC_A_BASE_ATOMIC_C_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_BASE_ATOMIC_C_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_ATOMIC_K_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_BASE_ATOMIC_K_0'] = {
    'addr'            : 0xc4,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_BASE_ATOMIC_K' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_BASE_ATOMIC_K',
    ],
} # End of register: CFGROM_CMAC_A_BASE_ATOMIC_K_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_BASE_ATOMIC_K_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_A_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_A_BASE_CDMA_ID_0'] = {
    'addr'            : 0xc8,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_A_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_A_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_CMAC_A_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_A_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_DESC_0'] = {
    'addr'            : 0xcc,
    'size'            : 0x20,
    'reset_val'       : 0x1c0006,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1c0006,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_DESC',
    ],
} # End of register: CFGROM_CMAC_B_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_CAP_INCOMPAT_0'] = {
    'addr'            : 0xd0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_CAP_INCOMPAT' : {
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
        'CMAC_B_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CMAC_B_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_CAP_COMPAT_0'] = {
    'addr'            : 0xd4,
    'size'            : 0x20,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_CAP_COMPAT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_CAP_COMPAT',
    ],
} # End of register: CFGROM_CMAC_B_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0xd8,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CMAC_B_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CMAC_B_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0xdc,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CMAC_B_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_C_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_BASE_ATOMIC_C_0'] = {
    'addr'            : 0xe0,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_BASE_ATOMIC_C' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_BASE_ATOMIC_C',
    ],
} # End of register: CFGROM_CMAC_B_BASE_ATOMIC_C_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_BASE_ATOMIC_C_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_ATOMIC_K_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_BASE_ATOMIC_K_0'] = {
    'addr'            : 0xe4,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_BASE_ATOMIC_K' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_BASE_ATOMIC_K',
    ],
} # End of register: CFGROM_CMAC_B_BASE_ATOMIC_K_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_BASE_ATOMIC_K_0')



# Register NVDLA_CFGROM_CFGROM_CMAC_B_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CMAC_B_BASE_CDMA_ID_0'] = {
    'addr'            : 0xe8,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CMAC_B_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CMAC_B_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_CMAC_B_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CMAC_B_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_CACC_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_DESC_0'] = {
    'addr'            : 0xec,
    'size'            : 0x20,
    'reset_val'       : 0x200007,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x200007,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_DESC',
    ],
} # End of register: CFGROM_CACC_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CACC_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_CAP_INCOMPAT_0'] = {
    'addr'            : 0xf0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_CAP_INCOMPAT' : {
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
        'CACC_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CACC_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CACC_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_CAP_COMPAT_0'] = {
    'addr'            : 0xf4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_CAP_COMPAT' : {
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
        'CACC_CAP_COMPAT',
    ],
} # End of register: CFGROM_CACC_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CACC_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0xf8,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CACC_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CACC_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CACC_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0xfc,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CACC_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_CACC_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_C_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_BASE_ATOMIC_C_0'] = {
    'addr'            : 0x100,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_BASE_ATOMIC_C' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_BASE_ATOMIC_C',
    ],
} # End of register: CFGROM_CACC_BASE_ATOMIC_C_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_BASE_ATOMIC_C_0')



# Register NVDLA_CFGROM_CFGROM_CACC_BASE_ATOMIC_K_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_BASE_ATOMIC_K_0'] = {
    'addr'            : 0x104,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_BASE_ATOMIC_K' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_BASE_ATOMIC_K',
    ],
} # End of register: CFGROM_CACC_BASE_ATOMIC_K_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_BASE_ATOMIC_K_0')



# Register NVDLA_CFGROM_CFGROM_CACC_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_BASE_CDMA_ID_0'] = {
    'addr'            : 0x108,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CACC_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_CACC_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_CACC_MULTI_BATCH_MAX_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CACC_MULTI_BATCH_MAX_0'] = {
    'addr'            : 0x10c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CACC_MULTI_BATCH_MAX' : {
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
        'CACC_MULTI_BATCH_MAX',
    ],
} # End of register: CFGROM_CACC_MULTI_BATCH_MAX_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CACC_MULTI_BATCH_MAX_0')



# Register NVDLA_CFGROM_CFGROM_SDP_RDMA_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_RDMA_DESC_0'] = {
    'addr'            : 0x110,
    'size'            : 0x20,
    'reset_val'       : 0xe0008,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_RDMA_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xe0008,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_RDMA_DESC',
    ],
} # End of register: CFGROM_SDP_RDMA_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_RDMA_DESC_0')



# Register NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_RDMA_CAP_INCOMPAT_0'] = {
    'addr'            : 0x114,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_RDMA_CAP_INCOMPAT' : {
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
        'SDP_RDMA_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_SDP_RDMA_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_RDMA_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_RDMA_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_RDMA_CAP_COMPAT_0'] = {
    'addr'            : 0x118,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_RDMA_CAP_COMPAT' : {
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
        'SDP_RDMA_CAP_COMPAT',
    ],
} # End of register: CFGROM_SDP_RDMA_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_RDMA_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_ATOMIC_M_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_RDMA_BASE_ATOMIC_M_0'] = {
    'addr'            : 0x11c,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_RDMA_BASE_ATOMIC_M' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_RDMA_BASE_ATOMIC_M',
    ],
} # End of register: CFGROM_SDP_RDMA_BASE_ATOMIC_M_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_RDMA_BASE_ATOMIC_M_0')



# Register NVDLA_CFGROM_CFGROM_SDP_RDMA_BASE_SDP_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_RDMA_BASE_SDP_ID_0'] = {
    'addr'            : 0x120,
    'size'            : 0x20,
    'reset_val'       : 0x9,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_RDMA_BASE_SDP_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x9,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_RDMA_BASE_SDP_ID',
    ],
} # End of register: CFGROM_SDP_RDMA_BASE_SDP_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_RDMA_BASE_SDP_ID_0')



# Register NVDLA_CFGROM_CFGROM_SDP_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_DESC_0'] = {
    'addr'            : 0x124,
    'size'            : 0x20,
    'reset_val'       : 0x200009,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x200009,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_DESC',
    ],
} # End of register: CFGROM_SDP_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_DESC_0')



# Register NVDLA_CFGROM_CFGROM_SDP_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_CAP_INCOMPAT_0'] = {
    'addr'            : 0x128,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_CAP_INCOMPAT' : {
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
        'SDP_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_SDP_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_CAP_COMPAT_0'] = {
    'addr'            : 0x12c,
    'size'            : 0x20,
    'reset_val'       : 0x18,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_CAP_COMPAT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x18,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_CAP_COMPAT',
    ],
} # End of register: CFGROM_SDP_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0x130,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'SDP_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_SDP_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_SDP_BASE_WEIGHT_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_BASE_WEIGHT_TYPES_0'] = {
    'addr'            : 0x134,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'SDP_BASE_WEIGHT_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rwt',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_BASE_WEIGHT_TYPES',
    ],
} # End of register: CFGROM_SDP_BASE_WEIGHT_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_BASE_WEIGHT_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_SDP_BASE_CDMA_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_BASE_CDMA_ID_0'] = {
    'addr'            : 0x138,
    'size'            : 0x20,
    'reset_val'       : 0x3,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_BASE_CDMA_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_BASE_CDMA_ID',
    ],
} # End of register: CFGROM_SDP_BASE_CDMA_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_BASE_CDMA_ID_0')



# Register NVDLA_CFGROM_CFGROM_SDP_MULTI_BATCH_MAX_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_MULTI_BATCH_MAX_0'] = {
    'addr'            : 0x13c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_MULTI_BATCH_MAX' : {
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
        'SDP_MULTI_BATCH_MAX',
    ],
} # End of register: CFGROM_SDP_MULTI_BATCH_MAX_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_MULTI_BATCH_MAX_0')



# Register NVDLA_CFGROM_CFGROM_SDP_BS_THROUGHPUT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_BS_THROUGHPUT_0'] = {
    'addr'            : 0x140,
    'size'            : 0x20,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_BS_THROUGHPUT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_BS_THROUGHPUT',
    ],
} # End of register: CFGROM_SDP_BS_THROUGHPUT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_BS_THROUGHPUT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_BN_THROUGHPUT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_BN_THROUGHPUT_0'] = {
    'addr'            : 0x144,
    'size'            : 0x20,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_BN_THROUGHPUT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_BN_THROUGHPUT',
    ],
} # End of register: CFGROM_SDP_BN_THROUGHPUT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_BN_THROUGHPUT_0')



# Register NVDLA_CFGROM_CFGROM_SDP_EW_THROUGHPUT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_SDP_EW_THROUGHPUT_0'] = {
    'addr'            : 0x148,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SDP_EW_THROUGHPUT' : {
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
        'SDP_EW_THROUGHPUT',
    ],
} # End of register: CFGROM_SDP_EW_THROUGHPUT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_SDP_EW_THROUGHPUT_0')



# Register NVDLA_CFGROM_CFGROM_PDP_RDMA_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_RDMA_DESC_0'] = {
    'addr'            : 0x14c,
    'size'            : 0x20,
    'reset_val'       : 0xe000a,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_RDMA_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xe000a,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_RDMA_DESC',
    ],
} # End of register: CFGROM_PDP_RDMA_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_RDMA_DESC_0')



# Register NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_RDMA_CAP_INCOMPAT_0'] = {
    'addr'            : 0x150,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_RDMA_CAP_INCOMPAT' : {
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
        'PDP_RDMA_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_PDP_RDMA_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_RDMA_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_PDP_RDMA_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_RDMA_CAP_COMPAT_0'] = {
    'addr'            : 0x154,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_RDMA_CAP_COMPAT' : {
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
        'PDP_RDMA_CAP_COMPAT',
    ],
} # End of register: CFGROM_PDP_RDMA_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_RDMA_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_ATOMIC_M_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_RDMA_BASE_ATOMIC_M_0'] = {
    'addr'            : 0x158,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_RDMA_BASE_ATOMIC_M' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_RDMA_BASE_ATOMIC_M',
    ],
} # End of register: CFGROM_PDP_RDMA_BASE_ATOMIC_M_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_RDMA_BASE_ATOMIC_M_0')



# Register NVDLA_CFGROM_CFGROM_PDP_RDMA_BASE_PDP_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_RDMA_BASE_PDP_ID_0'] = {
    'addr'            : 0x15c,
    'size'            : 0x20,
    'reset_val'       : 0xb,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_RDMA_BASE_PDP_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xb,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_RDMA_BASE_PDP_ID',
    ],
} # End of register: CFGROM_PDP_RDMA_BASE_PDP_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_RDMA_BASE_PDP_ID_0')



# Register NVDLA_CFGROM_CFGROM_PDP_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_DESC_0'] = {
    'addr'            : 0x160,
    'size'            : 0x20,
    'reset_val'       : 0x10000b,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10000b,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_DESC',
    ],
} # End of register: CFGROM_PDP_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_DESC_0')



# Register NVDLA_CFGROM_CFGROM_PDP_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_CAP_INCOMPAT_0'] = {
    'addr'            : 0x164,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_CAP_INCOMPAT' : {
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
        'PDP_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_PDP_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_PDP_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_CAP_COMPAT_0'] = {
    'addr'            : 0x168,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_CAP_COMPAT' : {
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
        'PDP_CAP_COMPAT',
    ],
} # End of register: CFGROM_PDP_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_PDP_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0x16c,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'PDP_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_PDP_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_PDP_BASE_THROUGHPUT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_PDP_BASE_THROUGHPUT_0'] = {
    'addr'            : 0x170,
    'size'            : 0x20,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'PDP_BASE_THROUGHPUT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PDP_BASE_THROUGHPUT',
    ],
} # End of register: CFGROM_PDP_BASE_THROUGHPUT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_PDP_BASE_THROUGHPUT_0')



# Register NVDLA_CFGROM_CFGROM_CDP_RDMA_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_RDMA_DESC_0'] = {
    'addr'            : 0x174,
    'size'            : 0x20,
    'reset_val'       : 0xe000c,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_RDMA_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xe000c,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_RDMA_DESC',
    ],
} # End of register: CFGROM_CDP_RDMA_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_RDMA_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_RDMA_CAP_INCOMPAT_0'] = {
    'addr'            : 0x178,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_RDMA_CAP_INCOMPAT' : {
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
        'CDP_RDMA_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CDP_RDMA_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_RDMA_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDP_RDMA_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_RDMA_CAP_COMPAT_0'] = {
    'addr'            : 0x17c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_RDMA_CAP_COMPAT' : {
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
        'CDP_RDMA_CAP_COMPAT',
    ],
} # End of register: CFGROM_CDP_RDMA_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_RDMA_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_ATOMIC_M_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_RDMA_BASE_ATOMIC_M_0'] = {
    'addr'            : 0x180,
    'size'            : 0x20,
    'reset_val'       : 0x8,
    'reset_mask'      : 0xff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_RDMA_BASE_ATOMIC_M' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x8,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_RDMA_BASE_ATOMIC_M',
    ],
} # End of register: CFGROM_CDP_RDMA_BASE_ATOMIC_M_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_RDMA_BASE_ATOMIC_M_0')



# Register NVDLA_CFGROM_CFGROM_CDP_RDMA_BASE_CDP_ID_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_RDMA_BASE_CDP_ID_0'] = {
    'addr'            : 0x184,
    'size'            : 0x20,
    'reset_val'       : 0xd,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_RDMA_BASE_CDP_ID' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0xd,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_RDMA_BASE_CDP_ID',
    ],
} # End of register: CFGROM_CDP_RDMA_BASE_CDP_ID_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_RDMA_BASE_CDP_ID_0')



# Register NVDLA_CFGROM_CFGROM_CDP_DESC_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_DESC_0'] = {
    'addr'            : 0x188,
    'size'            : 0x20,
    'reset_val'       : 0x10000d,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_DESC' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x10000d,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_DESC',
    ],
} # End of register: CFGROM_CDP_DESC_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_DESC_0')



# Register NVDLA_CFGROM_CFGROM_CDP_CAP_INCOMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_CAP_INCOMPAT_0'] = {
    'addr'            : 0x18c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_CAP_INCOMPAT' : {
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
        'CDP_CAP_INCOMPAT',
    ],
} # End of register: CFGROM_CDP_CAP_INCOMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_CAP_INCOMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDP_CAP_COMPAT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_CAP_COMPAT_0'] = {
    'addr'            : 0x190,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_CAP_COMPAT' : {
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
        'CDP_CAP_COMPAT',
    ],
} # End of register: CFGROM_CDP_CAP_COMPAT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_CAP_COMPAT_0')



# Register NVDLA_CFGROM_CFGROM_CDP_BASE_FEATURE_TYPES_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_BASE_FEATURE_TYPES_0'] = {
    'addr'            : 0x194,
    'size'            : 0xc,
    'reset_val'       : 0x10,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0x0,
    'CDP_BASE_FEATURE_TYPES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x10,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_BASE_FEATURE_TYPES',
    ],
} # End of register: CFGROM_CDP_BASE_FEATURE_TYPES_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_BASE_FEATURE_TYPES_0')



# Register NVDLA_CFGROM_CFGROM_CDP_BASE_THROUGHPUT_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_CDP_BASE_THROUGHPUT_0'] = {
    'addr'            : 0x198,
    'size'            : 0x20,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'CDP_BASE_THROUGHPUT' : {
        'lsb'               : 0,
        'msb'               : 31,
        'size'              : 32,
        'field'             : (0xffffffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'r',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CDP_BASE_THROUGHPUT',
    ],
} # End of register: CFGROM_CDP_BASE_THROUGHPUT_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_CDP_BASE_THROUGHPUT_0')



# Register NVDLA_CFGROM_CFGROM_END_OF_LIST_0
if 'NVDLA_CFGROM' not in registers:
    registers['NVDLA_CFGROM'] = {}
    registers['NVDLA_CFGROM']['register_list']  = []

registers['NVDLA_CFGROM']['CFGROM_END_OF_LIST_0'] = {
    'addr'            : 0x19c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'END_OF_LIST' : {
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
        'END_OF_LIST',
    ],
} # End of register: CFGROM_END_OF_LIST_0

registers['NVDLA_CFGROM']['register_list'].append('CFGROM_END_OF_LIST_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CFGROM'] = 0x0;
