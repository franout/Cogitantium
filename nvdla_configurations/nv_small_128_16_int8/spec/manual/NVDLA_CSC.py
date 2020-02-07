registers         = {}
addr_spaces       = {}

# Register NVDLA_CSC_S_STATUS_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['S_STATUS_0'] = {
    'addr'            : 0x4000,
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

registers['NVDLA_CSC']['register_list'].append('S_STATUS_0')



# Register NVDLA_CSC_S_POINTER_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['S_POINTER_0'] = {
    'addr'            : 0x4004,
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

registers['NVDLA_CSC']['register_list'].append('S_POINTER_0')



# Register NVDLA_CSC_D_OP_ENABLE_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_OP_ENABLE_0'] = {
    'addr'            : 0x4008,
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

registers['NVDLA_CSC']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CSC_D_MISC_CFG_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_MISC_CFG_0'] = {
    'addr'            : 0x400c,
    'size'            : 0x1d,
    'reset_val'       : 0x1100,
    'reset_mask'      : 0x11113301,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x11113301,
    'write_mask'      : 0x11113301,
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
    'DATA_REUSE' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    'WEIGHT_REUSE' : {
        'lsb'               : 20,
        'msb'               : 20,
        'size'              : 1,
        'field'             : (0x1 << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    'SKIP_DATA_RLS' : {
        'lsb'               : 24,
        'msb'               : 24,
        'size'              : 1,
        'field'             : (0x1 << 24),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'DISABLE' : 0x0,
            'ENABLE' : 0x1,
        },
    },
    'SKIP_WEIGHT_RLS' : {
        'lsb'               : 28,
        'msb'               : 28,
        'size'              : 1,
        'field'             : (0x1 << 28),
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
        'CONV_MODE',
        'IN_PRECISION',
        'PROC_PRECISION',
        'DATA_REUSE',
        'WEIGHT_REUSE',
        'SKIP_DATA_RLS',
        'SKIP_WEIGHT_RLS',
    ],
} # End of register: D_MISC_CFG_0

registers['NVDLA_CSC']['register_list'].append('D_MISC_CFG_0')



# Register NVDLA_CSC_D_DATAIN_FORMAT_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DATAIN_FORMAT_0'] = {
    'addr'            : 0x4010,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'DATAIN_FORMAT' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'FEATURE' : 0x0,
            'PIXEL' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAIN_FORMAT',
    ],
} # End of register: D_DATAIN_FORMAT_0

registers['NVDLA_CSC']['register_list'].append('D_DATAIN_FORMAT_0')



# Register NVDLA_CSC_D_DATAIN_SIZE_EXT_0_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DATAIN_SIZE_EXT_0_0'] = {
    'addr'            : 0x4014,
    'size'            : 0x1d,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff1fff,
    'write_mask'      : 0x1fff1fff,
    'DATAIN_WIDTH_EXT' : {
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
    'DATAIN_HEIGHT_EXT' : {
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
        'DATAIN_WIDTH_EXT',
        'DATAIN_HEIGHT_EXT',
    ],
} # End of register: D_DATAIN_SIZE_EXT_0_0

registers['NVDLA_CSC']['register_list'].append('D_DATAIN_SIZE_EXT_0_0')



# Register NVDLA_CSC_D_DATAIN_SIZE_EXT_1_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DATAIN_SIZE_EXT_1_0'] = {
    'addr'            : 0x4018,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'DATAIN_CHANNEL_EXT' : {
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
        'DATAIN_CHANNEL_EXT',
    ],
} # End of register: D_DATAIN_SIZE_EXT_1_0

registers['NVDLA_CSC']['register_list'].append('D_DATAIN_SIZE_EXT_1_0')



# Register NVDLA_CSC_D_BATCH_NUMBER_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_BATCH_NUMBER_0'] = {
    'addr'            : 0x401c,
    'size'            : 0x5,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f,
    'write_mask'      : 0x1f,
    'BATCHES' : {
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
        'BATCHES',
    ],
} # End of register: D_BATCH_NUMBER_0

registers['NVDLA_CSC']['register_list'].append('D_BATCH_NUMBER_0')



# Register NVDLA_CSC_D_POST_Y_EXTENSION_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_POST_Y_EXTENSION_0'] = {
    'addr'            : 0x4020,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'Y_EXTENSION' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'Y_EXTENSION',
    ],
} # End of register: D_POST_Y_EXTENSION_0

registers['NVDLA_CSC']['register_list'].append('D_POST_Y_EXTENSION_0')



# Register NVDLA_CSC_D_ENTRY_PER_SLICE_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_ENTRY_PER_SLICE_0'] = {
    'addr'            : 0x4024,
    'size'            : 0xe,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3fff,
    'write_mask'      : 0x3fff,
    'ENTRIES' : {
        'lsb'               : 0,
        'msb'               : 13,
        'size'              : 14,
        'field'             : (0x3fff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'ENTRIES',
    ],
} # End of register: D_ENTRY_PER_SLICE_0

registers['NVDLA_CSC']['register_list'].append('D_ENTRY_PER_SLICE_0')



# Register NVDLA_CSC_D_WEIGHT_FORMAT_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_WEIGHT_FORMAT_0'] = {
    'addr'            : 0x4028,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'WEIGHT_FORMAT' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'UNCOMPRESSED' : 0x0,
            'COMPRESSED' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'WEIGHT_FORMAT',
    ],
} # End of register: D_WEIGHT_FORMAT_0

registers['NVDLA_CSC']['register_list'].append('D_WEIGHT_FORMAT_0')



# Register NVDLA_CSC_D_WEIGHT_SIZE_EXT_0_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_WEIGHT_SIZE_EXT_0_0'] = {
    'addr'            : 0x402c,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f001f,
    'write_mask'      : 0x1f001f,
    'WEIGHT_WIDTH_EXT' : {
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
    'WEIGHT_HEIGHT_EXT' : {
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
        'WEIGHT_WIDTH_EXT',
        'WEIGHT_HEIGHT_EXT',
    ],
} # End of register: D_WEIGHT_SIZE_EXT_0_0

registers['NVDLA_CSC']['register_list'].append('D_WEIGHT_SIZE_EXT_0_0')



# Register NVDLA_CSC_D_WEIGHT_SIZE_EXT_1_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_WEIGHT_SIZE_EXT_1_0'] = {
    'addr'            : 0x4030,
    'size'            : 0x1d,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff1fff,
    'write_mask'      : 0x1fff1fff,
    'WEIGHT_CHANNEL_EXT' : {
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
    'WEIGHT_KERNEL' : {
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
        'WEIGHT_CHANNEL_EXT',
        'WEIGHT_KERNEL',
    ],
} # End of register: D_WEIGHT_SIZE_EXT_1_0

registers['NVDLA_CSC']['register_list'].append('D_WEIGHT_SIZE_EXT_1_0')



# Register NVDLA_CSC_D_WEIGHT_BYTES_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_WEIGHT_BYTES_0'] = {
    'addr'            : 0x4034,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1ffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WEIGHT_BYTES' : {
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
        'WEIGHT_BYTES',
    ],
} # End of register: D_WEIGHT_BYTES_0

registers['NVDLA_CSC']['register_list'].append('D_WEIGHT_BYTES_0')



# Register NVDLA_CSC_D_WMB_BYTES_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_WMB_BYTES_0'] = {
    'addr'            : 0x4038,
    'size'            : 0x1c,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfffffff,
    'write_mask'      : 0xfffffff,
    'WMB_BYTES' : {
        'lsb'               : 0,
        'msb'               : 27,
        'size'              : 28,
        'field'             : (0xfffffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'WMB_BYTES',
    ],
} # End of register: D_WMB_BYTES_0

registers['NVDLA_CSC']['register_list'].append('D_WMB_BYTES_0')



# Register NVDLA_CSC_D_DATAOUT_SIZE_0_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DATAOUT_SIZE_0_0'] = {
    'addr'            : 0x403c,
    'size'            : 0x1d,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff1fff,
    'write_mask'      : 0x1fff1fff,
    'DATAOUT_WIDTH' : {
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
    'DATAOUT_HEIGHT' : {
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
        'DATAOUT_WIDTH',
        'DATAOUT_HEIGHT',
    ],
} # End of register: D_DATAOUT_SIZE_0_0

registers['NVDLA_CSC']['register_list'].append('D_DATAOUT_SIZE_0_0')



# Register NVDLA_CSC_D_DATAOUT_SIZE_1_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DATAOUT_SIZE_1_0'] = {
    'addr'            : 0x4040,
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

registers['NVDLA_CSC']['register_list'].append('D_DATAOUT_SIZE_1_0')



# Register NVDLA_CSC_D_ATOMICS_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_ATOMICS_0'] = {
    'addr'            : 0x4044,
    'size'            : 0x15,
    'reset_val'       : 0x1,
    'reset_mask'      : 0x1fffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fffff,
    'write_mask'      : 0x1fffff,
    'ATOMICS' : {
        'lsb'               : 0,
        'msb'               : 20,
        'size'              : 21,
        'field'             : (0x1fffff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'ATOMICS',
    ],
} # End of register: D_ATOMICS_0

registers['NVDLA_CSC']['register_list'].append('D_ATOMICS_0')



# Register NVDLA_CSC_D_RELEASE_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_RELEASE_0'] = {
    'addr'            : 0x4048,
    'size'            : 0xc,
    'reset_val'       : 0x1,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0xfff,
    'RLS_SLICES' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RLS_SLICES',
    ],
} # End of register: D_RELEASE_0

registers['NVDLA_CSC']['register_list'].append('D_RELEASE_0')



# Register NVDLA_CSC_D_CONV_STRIDE_EXT_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_CONV_STRIDE_EXT_0'] = {
    'addr'            : 0x404c,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x70007,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x70007,
    'write_mask'      : 0x70007,
    'CONV_X_STRIDE_EXT' : {
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
    'CONV_Y_STRIDE_EXT' : {
        'lsb'               : 16,
        'msb'               : 18,
        'size'              : 3,
        'field'             : (0x7 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CONV_X_STRIDE_EXT',
        'CONV_Y_STRIDE_EXT',
    ],
} # End of register: D_CONV_STRIDE_EXT_0

registers['NVDLA_CSC']['register_list'].append('D_CONV_STRIDE_EXT_0')



# Register NVDLA_CSC_D_DILATION_EXT_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_DILATION_EXT_0'] = {
    'addr'            : 0x4050,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f001f,
    'write_mask'      : 0x1f001f,
    'X_DILATION_EXT' : {
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
    'Y_DILATION_EXT' : {
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
        'X_DILATION_EXT',
        'Y_DILATION_EXT',
    ],
} # End of register: D_DILATION_EXT_0

registers['NVDLA_CSC']['register_list'].append('D_DILATION_EXT_0')



# Register NVDLA_CSC_D_ZERO_PADDING_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_ZERO_PADDING_0'] = {
    'addr'            : 0x4054,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f001f,
    'write_mask'      : 0x1f001f,
    'PAD_LEFT' : {
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
    'PAD_TOP' : {
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
        'PAD_LEFT',
        'PAD_TOP',
    ],
} # End of register: D_ZERO_PADDING_0

registers['NVDLA_CSC']['register_list'].append('D_ZERO_PADDING_0')



# Register NVDLA_CSC_D_ZERO_PADDING_VALUE_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_ZERO_PADDING_VALUE_0'] = {
    'addr'            : 0x4058,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'PAD_VALUE' : {
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
        'PAD_VALUE',
    ],
} # End of register: D_ZERO_PADDING_VALUE_0

registers['NVDLA_CSC']['register_list'].append('D_ZERO_PADDING_VALUE_0')



# Register NVDLA_CSC_D_BANK_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_BANK_0'] = {
    'addr'            : 0x405c,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f001f,
    'write_mask'      : 0x1f001f,
    'DATA_BANK' : {
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
    'WEIGHT_BANK' : {
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
        'DATA_BANK',
        'WEIGHT_BANK',
    ],
} # End of register: D_BANK_0

registers['NVDLA_CSC']['register_list'].append('D_BANK_0')



# Register NVDLA_CSC_D_PRA_CFG_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_PRA_CFG_0'] = {
    'addr'            : 0x4060,
    'size'            : 0x2,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3,
    'write_mask'      : 0x3,
    'PRA_TRUNCATE' : {
        'lsb'               : 0,
        'msb'               : 1,
        'size'              : 2,
        'field'             : (0x3 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PRA_TRUNCATE',
    ],
} # End of register: D_PRA_CFG_0

registers['NVDLA_CSC']['register_list'].append('D_PRA_CFG_0')



# Register NVDLA_CSC_D_CYA_0
if 'NVDLA_CSC' not in registers:
    registers['NVDLA_CSC'] = {}
    registers['NVDLA_CSC']['register_list']  = []

registers['NVDLA_CSC']['D_CYA_0'] = {
    'addr'            : 0x4064,
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

registers['NVDLA_CSC']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CSC'] = 0x4000;
