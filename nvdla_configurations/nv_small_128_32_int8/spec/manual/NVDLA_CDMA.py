registers         = {}
addr_spaces       = {}

# Register NVDLA_CDMA_S_STATUS_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['S_STATUS_0'] = {
    'addr'            : 0x3000,
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

registers['NVDLA_CDMA']['register_list'].append('S_STATUS_0')



# Register NVDLA_CDMA_S_POINTER_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['S_POINTER_0'] = {
    'addr'            : 0x3004,
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

registers['NVDLA_CDMA']['register_list'].append('S_POINTER_0')



# Register NVDLA_CDMA_S_ARBITER_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['S_ARBITER_0'] = {
    'addr'            : 0x3008,
    'size'            : 0x14,
    'reset_val'       : 0x3000f,
    'reset_mask'      : 0xf000f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xf000f,
    'write_mask'      : 0xf000f,
    'ARB_WEIGHT' : {
        'lsb'               : 0,
        'msb'               : 3,
        'size'              : 4,
        'field'             : (0xf << 0),
        'default'           : 0xf,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'ARB_WMB' : {
        'lsb'               : 16,
        'msb'               : 19,
        'size'              : 4,
        'field'             : (0xf << 16),
        'default'           : 0x3,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'ARB_WEIGHT',
        'ARB_WMB',
    ],
} # End of register: S_ARBITER_0

registers['NVDLA_CDMA']['register_list'].append('S_ARBITER_0')



# Register NVDLA_CDMA_S_CBUF_FLUSH_STATUS_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['S_CBUF_FLUSH_STATUS_0'] = {
    'addr'            : 0x300c,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x0,
    'FLUSH_DONE' : {
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
        'FLUSH_DONE',
    ],
} # End of register: S_CBUF_FLUSH_STATUS_0

registers['NVDLA_CDMA']['register_list'].append('S_CBUF_FLUSH_STATUS_0')



# Register NVDLA_CDMA_D_OP_ENABLE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_OP_ENABLE_0'] = {
    'addr'            : 0x3010,
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

registers['NVDLA_CDMA']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CDMA_D_MISC_CFG_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_MISC_CFG_0'] = {
    'addr'            : 0x3014,
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

registers['NVDLA_CDMA']['register_list'].append('D_MISC_CFG_0')



# Register NVDLA_CDMA_D_DATAIN_FORMAT_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DATAIN_FORMAT_0'] = {
    'addr'            : 0x3018,
    'size'            : 0x15,
    'reset_val'       : 0xc00,
    'reset_mask'      : 0x113f01,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x113f01,
    'write_mask'      : 0x113f01,
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
    'PIXEL_FORMAT' : {
        'lsb'               : 8,
        'msb'               : 13,
        'size'              : 6,
        'field'             : (0x3f << 8),
        'default'           : 0xc,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'T_R8' : 0x0,
            'T_R10' : 0x1,
            'T_R12' : 0x2,
            'T_R16' : 0x3,
            'T_R16_I' : 0x4,
            'T_R16_F' : 0x5,
            'T_A16B16G16R16' : 0x6,
            'T_X16B16G16R16' : 0x7,
            'T_A16B16G16R16_F' : 0x8,
            'T_A16Y16U16V16' : 0x9,
            'T_V16U16Y16A16' : 0xa,
            'T_A16Y16U16V16_F' : 0xb,
            'T_A8B8G8R8' : 0xc,
            'T_A8R8G8B8' : 0xd,
            'T_B8G8R8A8' : 0xe,
            'T_R8G8B8A8' : 0xf,
            'T_X8B8G8R8' : 0x10,
            'T_X8R8G8B8' : 0x11,
            'T_B8G8R8X8' : 0x12,
            'T_R8G8B8X8' : 0x13,
            'T_A2B10G10R10' : 0x14,
            'T_A2R10G10B10' : 0x15,
            'T_B10G10R10A2' : 0x16,
            'T_R10G10B10A2' : 0x17,
            'T_A2Y10U10V10' : 0x18,
            'T_V10U10Y10A2' : 0x19,
            'T_A8Y8U8V8' : 0x1a,
            'T_V8U8Y8A8' : 0x1b,
            'T_Y8___U8V8_N444' : 0x1c,
            'T_Y8___V8U8_N444' : 0x1d,
            'T_Y10___U10V10_N444' : 0x1e,
            'T_Y10___V10U10_N444' : 0x1f,
            'T_Y12___U12V12_N444' : 0x20,
            'T_Y12___V12U12_N444' : 0x21,
            'T_Y16___U16V16_N444' : 0x22,
            'T_Y16___V16U16_N444' : 0x23,
        },
    },
    'PIXEL_MAPPING' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'PITCH_LINEAR' : 0x0,
            'RESERVED_LINEAR' : 0x1,
        },
    },
    'PIXEL_SIGN_OVERRIDE' : {
        'lsb'               : 20,
        'msb'               : 20,
        'size'              : 1,
        'field'             : (0x1 << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'UNSIGNED_INT' : 0x0,
            'SIGNED_INT' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DATAIN_FORMAT',
        'PIXEL_FORMAT',
        'PIXEL_MAPPING',
        'PIXEL_SIGN_OVERRIDE',
    ],
} # End of register: D_DATAIN_FORMAT_0

registers['NVDLA_CDMA']['register_list'].append('D_DATAIN_FORMAT_0')



# Register NVDLA_CDMA_D_DATAIN_SIZE_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DATAIN_SIZE_0_0'] = {
    'addr'            : 0x301c,
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

registers['NVDLA_CDMA']['register_list'].append('D_DATAIN_SIZE_0_0')



# Register NVDLA_CDMA_D_DATAIN_SIZE_1_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DATAIN_SIZE_1_0'] = {
    'addr'            : 0x3020,
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

registers['NVDLA_CDMA']['register_list'].append('D_DATAIN_SIZE_1_0')



# Register NVDLA_CDMA_D_DATAIN_SIZE_EXT_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DATAIN_SIZE_EXT_0_0'] = {
    'addr'            : 0x3024,
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

registers['NVDLA_CDMA']['register_list'].append('D_DATAIN_SIZE_EXT_0_0')



# Register NVDLA_CDMA_D_PIXEL_OFFSET_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PIXEL_OFFSET_0'] = {
    'addr'            : 0x3028,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x7001f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x7001f,
    'write_mask'      : 0x7001f,
    'PIXEL_X_OFFSET' : {
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
    'PIXEL_Y_OFFSET' : {
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
        'PIXEL_X_OFFSET',
        'PIXEL_Y_OFFSET',
    ],
} # End of register: D_PIXEL_OFFSET_0

registers['NVDLA_CDMA']['register_list'].append('D_PIXEL_OFFSET_0')



# Register NVDLA_CDMA_D_DAIN_RAM_TYPE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_RAM_TYPE_0'] = {
    'addr'            : 0x302c,
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

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_RAM_TYPE_0')



# Register NVDLA_CDMA_D_DAIN_ADDR_HIGH_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_ADDR_HIGH_0_0'] = {
    'addr'            : 0x3030,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATAIN_ADDR_HIGH_0' : {
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
        'DATAIN_ADDR_HIGH_0',
    ],
} # End of register: D_DAIN_ADDR_HIGH_0_0

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_ADDR_HIGH_0_0')



# Register NVDLA_CDMA_D_DAIN_ADDR_LOW_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_ADDR_LOW_0_0'] = {
    'addr'            : 0x3034,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATAIN_ADDR_LOW_0' : {
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
        'DATAIN_ADDR_LOW_0',
    ],
} # End of register: D_DAIN_ADDR_LOW_0_0

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_ADDR_LOW_0_0')



# Register NVDLA_CDMA_D_DAIN_ADDR_HIGH_1_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_ADDR_HIGH_1_0'] = {
    'addr'            : 0x3038,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATAIN_ADDR_HIGH_1' : {
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
        'DATAIN_ADDR_HIGH_1',
    ],
} # End of register: D_DAIN_ADDR_HIGH_1_0

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_ADDR_HIGH_1_0')



# Register NVDLA_CDMA_D_DAIN_ADDR_LOW_1_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_ADDR_LOW_1_0'] = {
    'addr'            : 0x303c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATAIN_ADDR_LOW_1' : {
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
        'DATAIN_ADDR_LOW_1',
    ],
} # End of register: D_DAIN_ADDR_LOW_1_0

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_ADDR_LOW_1_0')



# Register NVDLA_CDMA_D_LINE_STRIDE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_LINE_STRIDE_0'] = {
    'addr'            : 0x3040,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'LINE_STRIDE' : {
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
        'LINE_STRIDE',
    ],
} # End of register: D_LINE_STRIDE_0

registers['NVDLA_CDMA']['register_list'].append('D_LINE_STRIDE_0')



# Register NVDLA_CDMA_D_LINE_UV_STRIDE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_LINE_UV_STRIDE_0'] = {
    'addr'            : 0x3044,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'UV_LINE_STRIDE' : {
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
        'UV_LINE_STRIDE',
    ],
} # End of register: D_LINE_UV_STRIDE_0

registers['NVDLA_CDMA']['register_list'].append('D_LINE_UV_STRIDE_0')



# Register NVDLA_CDMA_D_SURF_STRIDE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_SURF_STRIDE_0'] = {
    'addr'            : 0x3048,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'SURF_STRIDE' : {
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
        'SURF_STRIDE',
    ],
} # End of register: D_SURF_STRIDE_0

registers['NVDLA_CDMA']['register_list'].append('D_SURF_STRIDE_0')



# Register NVDLA_CDMA_D_DAIN_MAP_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_DAIN_MAP_0'] = {
    'addr'            : 0x304c,
    'size'            : 0x11,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x10001,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x10001,
    'write_mask'      : 0x10001,
    'LINE_PACKED' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'FALSE' : 0x0,
            'TRUE' : 0x1,
        },
    },
    'SURF_PACKED' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
            'FALSE' : 0x0,
            'TRUE' : 0x1,
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'LINE_PACKED',
        'SURF_PACKED',
    ],
} # End of register: D_DAIN_MAP_0

registers['NVDLA_CDMA']['register_list'].append('D_DAIN_MAP_0')



# Register NVDLA_CDMA_D_RESERVED_X_CFG_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_RESERVED_X_CFG_0'] = {
    'addr'            : 0x3050,
    'size'            : 0x1a,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3ff03ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3ff03ff,
    'write_mask'      : 0x3ff03ff,
    'RSV_PER_LINE' : {
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
    'RSV_PER_UV_LINE' : {
        'lsb'               : 16,
        'msb'               : 25,
        'size'              : 10,
        'field'             : (0x3ff << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RSV_PER_LINE',
        'RSV_PER_UV_LINE',
    ],
} # End of register: D_RESERVED_X_CFG_0

registers['NVDLA_CDMA']['register_list'].append('D_RESERVED_X_CFG_0')



# Register NVDLA_CDMA_D_RESERVED_Y_CFG_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_RESERVED_Y_CFG_0'] = {
    'addr'            : 0x3054,
    'size'            : 0x15,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f0007,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f0007,
    'write_mask'      : 0x1f0007,
    'RSV_HEIGHT' : {
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
    'RSV_Y_INDEX' : {
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
        'RSV_HEIGHT',
        'RSV_Y_INDEX',
    ],
} # End of register: D_RESERVED_Y_CFG_0

registers['NVDLA_CDMA']['register_list'].append('D_RESERVED_Y_CFG_0')



# Register NVDLA_CDMA_D_BATCH_NUMBER_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_BATCH_NUMBER_0'] = {
    'addr'            : 0x3058,
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

registers['NVDLA_CDMA']['register_list'].append('D_BATCH_NUMBER_0')



# Register NVDLA_CDMA_D_BATCH_STRIDE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_BATCH_STRIDE_0'] = {
    'addr'            : 0x305c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'BATCH_STRIDE' : {
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
        'BATCH_STRIDE',
    ],
} # End of register: D_BATCH_STRIDE_0

registers['NVDLA_CDMA']['register_list'].append('D_BATCH_STRIDE_0')



# Register NVDLA_CDMA_D_ENTRY_PER_SLICE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_ENTRY_PER_SLICE_0'] = {
    'addr'            : 0x3060,
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

registers['NVDLA_CDMA']['register_list'].append('D_ENTRY_PER_SLICE_0')



# Register NVDLA_CDMA_D_FETCH_GRAIN_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_FETCH_GRAIN_0'] = {
    'addr'            : 0x3064,
    'size'            : 0xc,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xfff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xfff,
    'write_mask'      : 0xfff,
    'GRAINS' : {
        'lsb'               : 0,
        'msb'               : 11,
        'size'              : 12,
        'field'             : (0xfff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'GRAINS',
    ],
} # End of register: D_FETCH_GRAIN_0

registers['NVDLA_CDMA']['register_list'].append('D_FETCH_GRAIN_0')



# Register NVDLA_CDMA_D_WEIGHT_FORMAT_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_FORMAT_0'] = {
    'addr'            : 0x3068,
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

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_FORMAT_0')



# Register NVDLA_CDMA_D_WEIGHT_SIZE_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_SIZE_0_0'] = {
    'addr'            : 0x306c,
    'size'            : 0x12,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3ffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3ffff,
    'write_mask'      : 0x3ffff,
    'BYTE_PER_KERNEL' : {
        'lsb'               : 0,
        'msb'               : 17,
        'size'              : 18,
        'field'             : (0x3ffff << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'BYTE_PER_KERNEL',
    ],
} # End of register: D_WEIGHT_SIZE_0_0

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_SIZE_0_0')



# Register NVDLA_CDMA_D_WEIGHT_SIZE_1_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_SIZE_1_0'] = {
    'addr'            : 0x3070,
    'size'            : 0xd,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1fff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1fff,
    'write_mask'      : 0x1fff,
    'WEIGHT_KERNEL' : {
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
        'WEIGHT_KERNEL',
    ],
} # End of register: D_WEIGHT_SIZE_1_0

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_SIZE_1_0')



# Register NVDLA_CDMA_D_WEIGHT_RAM_TYPE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_RAM_TYPE_0'] = {
    'addr'            : 0x3074,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'WEIGHT_RAM_TYPE' : {
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
        'WEIGHT_RAM_TYPE',
    ],
} # End of register: D_WEIGHT_RAM_TYPE_0

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_RAM_TYPE_0')



# Register NVDLA_CDMA_D_WEIGHT_ADDR_HIGH_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_ADDR_HIGH_0'] = {
    'addr'            : 0x3078,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WEIGHT_ADDR_HIGH' : {
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
        'WEIGHT_ADDR_HIGH',
    ],
} # End of register: D_WEIGHT_ADDR_HIGH_0

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_ADDR_HIGH_0')



# Register NVDLA_CDMA_D_WEIGHT_ADDR_LOW_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_ADDR_LOW_0'] = {
    'addr'            : 0x307c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WEIGHT_ADDR_LOW' : {
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
        'WEIGHT_ADDR_LOW',
    ],
} # End of register: D_WEIGHT_ADDR_LOW_0

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_ADDR_LOW_0')



# Register NVDLA_CDMA_D_WEIGHT_BYTES_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WEIGHT_BYTES_0'] = {
    'addr'            : 0x3080,
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

registers['NVDLA_CDMA']['register_list'].append('D_WEIGHT_BYTES_0')



# Register NVDLA_CDMA_D_WGS_ADDR_HIGH_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WGS_ADDR_HIGH_0'] = {
    'addr'            : 0x3084,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WGS_ADDR_HIGH' : {
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
        'WGS_ADDR_HIGH',
    ],
} # End of register: D_WGS_ADDR_HIGH_0

registers['NVDLA_CDMA']['register_list'].append('D_WGS_ADDR_HIGH_0')



# Register NVDLA_CDMA_D_WGS_ADDR_LOW_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WGS_ADDR_LOW_0'] = {
    'addr'            : 0x3088,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WGS_ADDR_LOW' : {
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
        'WGS_ADDR_LOW',
    ],
} # End of register: D_WGS_ADDR_LOW_0

registers['NVDLA_CDMA']['register_list'].append('D_WGS_ADDR_LOW_0')



# Register NVDLA_CDMA_D_WMB_ADDR_HIGH_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WMB_ADDR_HIGH_0'] = {
    'addr'            : 0x308c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WMB_ADDR_HIGH' : {
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
        'WMB_ADDR_HIGH',
    ],
} # End of register: D_WMB_ADDR_HIGH_0

registers['NVDLA_CDMA']['register_list'].append('D_WMB_ADDR_HIGH_0')



# Register NVDLA_CDMA_D_WMB_ADDR_LOW_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WMB_ADDR_LOW_0'] = {
    'addr'            : 0x3090,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WMB_ADDR_LOW' : {
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
        'WMB_ADDR_LOW',
    ],
} # End of register: D_WMB_ADDR_LOW_0

registers['NVDLA_CDMA']['register_list'].append('D_WMB_ADDR_LOW_0')



# Register NVDLA_CDMA_D_WMB_BYTES_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_WMB_BYTES_0'] = {
    'addr'            : 0x3094,
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

registers['NVDLA_CDMA']['register_list'].append('D_WMB_BYTES_0')



# Register NVDLA_CDMA_D_MEAN_FORMAT_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_MEAN_FORMAT_0'] = {
    'addr'            : 0x3098,
    'size'            : 0x1,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1,
    'write_mask'      : 0x1,
    'MEAN_FORMAT' : {
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
        'MEAN_FORMAT',
    ],
} # End of register: D_MEAN_FORMAT_0

registers['NVDLA_CDMA']['register_list'].append('D_MEAN_FORMAT_0')



# Register NVDLA_CDMA_D_MEAN_GLOBAL_0_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_MEAN_GLOBAL_0_0'] = {
    'addr'            : 0x309c,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'MEAN_RY' : {
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
    'MEAN_GU' : {
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
        'MEAN_RY',
        'MEAN_GU',
    ],
} # End of register: D_MEAN_GLOBAL_0_0

registers['NVDLA_CDMA']['register_list'].append('D_MEAN_GLOBAL_0_0')



# Register NVDLA_CDMA_D_MEAN_GLOBAL_1_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_MEAN_GLOBAL_1_0'] = {
    'addr'            : 0x30a0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'MEAN_BV' : {
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
    'MEAN_AX' : {
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
        'MEAN_BV',
        'MEAN_AX',
    ],
} # End of register: D_MEAN_GLOBAL_1_0

registers['NVDLA_CDMA']['register_list'].append('D_MEAN_GLOBAL_1_0')



# Register NVDLA_CDMA_D_CVT_CFG_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_CVT_CFG_0'] = {
    'addr'            : 0x30a4,
    'size'            : 0xa,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f1,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f1,
    'write_mask'      : 0x3f1,
    'CVT_EN' : {
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
    'CVT_TRUNCATE' : {
        'lsb'               : 4,
        'msb'               : 9,
        'size'              : 6,
        'field'             : (0x3f << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CVT_EN',
        'CVT_TRUNCATE',
    ],
} # End of register: D_CVT_CFG_0

registers['NVDLA_CDMA']['register_list'].append('D_CVT_CFG_0')



# Register NVDLA_CDMA_D_CVT_OFFSET_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_CVT_OFFSET_0'] = {
    'addr'            : 0x30a8,
    'size'            : 0x10,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'CVT_OFFSET' : {
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
        'CVT_OFFSET',
    ],
} # End of register: D_CVT_OFFSET_0

registers['NVDLA_CDMA']['register_list'].append('D_CVT_OFFSET_0')



# Register NVDLA_CDMA_D_CVT_SCALE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_CVT_SCALE_0'] = {
    'addr'            : 0x30ac,
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

registers['NVDLA_CDMA']['register_list'].append('D_CVT_SCALE_0')



# Register NVDLA_CDMA_D_CONV_STRIDE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_CONV_STRIDE_0'] = {
    'addr'            : 0x30b0,
    'size'            : 0x13,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x70007,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x70007,
    'write_mask'      : 0x70007,
    'CONV_X_STRIDE' : {
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
    'CONV_Y_STRIDE' : {
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
        'CONV_X_STRIDE',
        'CONV_Y_STRIDE',
    ],
} # End of register: D_CONV_STRIDE_0

registers['NVDLA_CDMA']['register_list'].append('D_CONV_STRIDE_0')



# Register NVDLA_CDMA_D_ZERO_PADDING_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_ZERO_PADDING_0'] = {
    'addr'            : 0x30b4,
    'size'            : 0x1e,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f1f3f1f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f1f3f1f,
    'write_mask'      : 0x3f1f3f1f,
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
    'PAD_RIGHT' : {
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
    'PAD_BOTTOM' : {
        'lsb'               : 24,
        'msb'               : 29,
        'size'              : 6,
        'field'             : (0x3f << 24),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'PAD_LEFT',
        'PAD_RIGHT',
        'PAD_TOP',
        'PAD_BOTTOM',
    ],
} # End of register: D_ZERO_PADDING_0

registers['NVDLA_CDMA']['register_list'].append('D_ZERO_PADDING_0')



# Register NVDLA_CDMA_D_ZERO_PADDING_VALUE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_ZERO_PADDING_VALUE_0'] = {
    'addr'            : 0x30b8,
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

registers['NVDLA_CDMA']['register_list'].append('D_ZERO_PADDING_VALUE_0')



# Register NVDLA_CDMA_D_BANK_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_BANK_0'] = {
    'addr'            : 0x30bc,
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

registers['NVDLA_CDMA']['register_list'].append('D_BANK_0')



# Register NVDLA_CDMA_D_NAN_FLUSH_TO_ZERO_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_NAN_FLUSH_TO_ZERO_0'] = {
    'addr'            : 0x30c0,
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

registers['NVDLA_CDMA']['register_list'].append('D_NAN_FLUSH_TO_ZERO_0')



# Register NVDLA_CDMA_D_NAN_INPUT_DATA_NUM_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_NAN_INPUT_DATA_NUM_0'] = {
    'addr'            : 0x30c4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'NAN_DATA_NUM' : {
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
        'NAN_DATA_NUM',
    ],
} # End of register: D_NAN_INPUT_DATA_NUM_0

registers['NVDLA_CDMA']['register_list'].append('D_NAN_INPUT_DATA_NUM_0')



# Register NVDLA_CDMA_D_NAN_INPUT_WEIGHT_NUM_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_NAN_INPUT_WEIGHT_NUM_0'] = {
    'addr'            : 0x30c8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'NAN_WEIGHT_NUM' : {
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
        'NAN_WEIGHT_NUM',
    ],
} # End of register: D_NAN_INPUT_WEIGHT_NUM_0

registers['NVDLA_CDMA']['register_list'].append('D_NAN_INPUT_WEIGHT_NUM_0')



# Register NVDLA_CDMA_D_INF_INPUT_DATA_NUM_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_INF_INPUT_DATA_NUM_0'] = {
    'addr'            : 0x30cc,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'INF_DATA_NUM' : {
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
        'INF_DATA_NUM',
    ],
} # End of register: D_INF_INPUT_DATA_NUM_0

registers['NVDLA_CDMA']['register_list'].append('D_INF_INPUT_DATA_NUM_0')



# Register NVDLA_CDMA_D_INF_INPUT_WEIGHT_NUM_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_INF_INPUT_WEIGHT_NUM_0'] = {
    'addr'            : 0x30d0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'INF_WEIGHT_NUM' : {
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
        'INF_WEIGHT_NUM',
    ],
} # End of register: D_INF_INPUT_WEIGHT_NUM_0

registers['NVDLA_CDMA']['register_list'].append('D_INF_INPUT_WEIGHT_NUM_0')



# Register NVDLA_CDMA_D_PERF_ENABLE_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PERF_ENABLE_0'] = {
    'addr'            : 0x30d4,
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
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'DMA_EN',
    ],
} # End of register: D_PERF_ENABLE_0

registers['NVDLA_CDMA']['register_list'].append('D_PERF_ENABLE_0')



# Register NVDLA_CDMA_D_PERF_DAT_READ_STALL_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PERF_DAT_READ_STALL_0'] = {
    'addr'            : 0x30d8,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'DAT_RD_STALL' : {
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
        'DAT_RD_STALL',
    ],
} # End of register: D_PERF_DAT_READ_STALL_0

registers['NVDLA_CDMA']['register_list'].append('D_PERF_DAT_READ_STALL_0')



# Register NVDLA_CDMA_D_PERF_WT_READ_STALL_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PERF_WT_READ_STALL_0'] = {
    'addr'            : 0x30dc,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'WT_RD_STALL' : {
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
        'WT_RD_STALL',
    ],
} # End of register: D_PERF_WT_READ_STALL_0

registers['NVDLA_CDMA']['register_list'].append('D_PERF_WT_READ_STALL_0')



# Register NVDLA_CDMA_D_PERF_DAT_READ_LATENCY_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PERF_DAT_READ_LATENCY_0'] = {
    'addr'            : 0x30e0,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'DAT_RD_LATENCY' : {
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
        'DAT_RD_LATENCY',
    ],
} # End of register: D_PERF_DAT_READ_LATENCY_0

registers['NVDLA_CDMA']['register_list'].append('D_PERF_DAT_READ_LATENCY_0')



# Register NVDLA_CDMA_D_PERF_WT_READ_LATENCY_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_PERF_WT_READ_LATENCY_0'] = {
    'addr'            : 0x30e4,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'WT_RD_LATENCY' : {
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
        'WT_RD_LATENCY',
    ],
} # End of register: D_PERF_WT_READ_LATENCY_0

registers['NVDLA_CDMA']['register_list'].append('D_PERF_WT_READ_LATENCY_0')



# Register NVDLA_CDMA_D_CYA_0
if 'NVDLA_CDMA' not in registers:
    registers['NVDLA_CDMA'] = {}
    registers['NVDLA_CDMA']['register_list']  = []

registers['NVDLA_CDMA']['D_CYA_0'] = {
    'addr'            : 0x30e8,
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

registers['NVDLA_CDMA']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CDMA'] = 0x3000;
