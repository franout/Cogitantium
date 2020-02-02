registers         = {}
addr_spaces       = {}

# Register NVDLA_CACC_S_STATUS_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['S_STATUS_0'] = {
    'addr'            : 0x7000,
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

registers['NVDLA_CACC']['register_list'].append('S_STATUS_0')



# Register NVDLA_CACC_S_POINTER_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['S_POINTER_0'] = {
    'addr'            : 0x7004,
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

registers['NVDLA_CACC']['register_list'].append('S_POINTER_0')



# Register NVDLA_CACC_D_OP_ENABLE_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_OP_ENABLE_0'] = {
    'addr'            : 0x7008,
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

registers['NVDLA_CACC']['register_list'].append('D_OP_ENABLE_0')



# Register NVDLA_CACC_D_MISC_CFG_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_MISC_CFG_0'] = {
    'addr'            : 0x700c,
    'size'            : 0xe,
    'reset_val'       : 0x1000,
    'reset_mask'      : 0x3001,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3001,
    'write_mask'      : 0x3001,
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
    # Fields sorted in order of declaration in register
    'field_list' : [
        'CONV_MODE',
        'PROC_PRECISION',
    ],
} # End of register: D_MISC_CFG_0

registers['NVDLA_CACC']['register_list'].append('D_MISC_CFG_0')



# Register NVDLA_CACC_D_DATAOUT_SIZE_0_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_DATAOUT_SIZE_0_0'] = {
    'addr'            : 0x7010,
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

registers['NVDLA_CACC']['register_list'].append('D_DATAOUT_SIZE_0_0')



# Register NVDLA_CACC_D_DATAOUT_SIZE_1_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_DATAOUT_SIZE_1_0'] = {
    'addr'            : 0x7014,
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

registers['NVDLA_CACC']['register_list'].append('D_DATAOUT_SIZE_1_0')



# Register NVDLA_CACC_D_DATAOUT_ADDR_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_DATAOUT_ADDR_0'] = {
    'addr'            : 0x7018,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'DATAOUT_ADDR' : {
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
        'DATAOUT_ADDR',
    ],
} # End of register: D_DATAOUT_ADDR_0

registers['NVDLA_CACC']['register_list'].append('D_DATAOUT_ADDR_0')



# Register NVDLA_CACC_D_BATCH_NUMBER_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_BATCH_NUMBER_0'] = {
    'addr'            : 0x701c,
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

registers['NVDLA_CACC']['register_list'].append('D_BATCH_NUMBER_0')



# Register NVDLA_CACC_D_LINE_STRIDE_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_LINE_STRIDE_0'] = {
    'addr'            : 0x7020,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0xffffff,
    'LINE_STRIDE' : {
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
        'LINE_STRIDE',
    ],
} # End of register: D_LINE_STRIDE_0

registers['NVDLA_CACC']['register_list'].append('D_LINE_STRIDE_0')



# Register NVDLA_CACC_D_SURF_STRIDE_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_SURF_STRIDE_0'] = {
    'addr'            : 0x7024,
    'size'            : 0x18,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0xffffff,
    'SURF_STRIDE' : {
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
        'SURF_STRIDE',
    ],
} # End of register: D_SURF_STRIDE_0

registers['NVDLA_CACC']['register_list'].append('D_SURF_STRIDE_0')



# Register NVDLA_CACC_D_DATAOUT_MAP_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_DATAOUT_MAP_0'] = {
    'addr'            : 0x7028,
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
} # End of register: D_DATAOUT_MAP_0

registers['NVDLA_CACC']['register_list'].append('D_DATAOUT_MAP_0')



# Register NVDLA_CACC_D_CLIP_CFG_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_CLIP_CFG_0'] = {
    'addr'            : 0x702c,
    'size'            : 0x5,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x1f,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x1f,
    'write_mask'      : 0x1f,
    'CLIP_TRUNCATE' : {
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
        'CLIP_TRUNCATE',
    ],
} # End of register: D_CLIP_CFG_0

registers['NVDLA_CACC']['register_list'].append('D_CLIP_CFG_0')



# Register NVDLA_CACC_D_OUT_SATURATION_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_OUT_SATURATION_0'] = {
    'addr'            : 0x7030,
    'size'            : 0x20,
    'reset_val'       : 0x0,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0x0,
    'SAT_COUNT' : {
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
        'SAT_COUNT',
    ],
} # End of register: D_OUT_SATURATION_0

registers['NVDLA_CACC']['register_list'].append('D_OUT_SATURATION_0')



# Register NVDLA_CACC_D_CYA_0
if 'NVDLA_CACC' not in registers:
    registers['NVDLA_CACC'] = {}
    registers['NVDLA_CACC']['register_list']  = []

registers['NVDLA_CACC']['D_CYA_0'] = {
    'addr'            : 0x7034,
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

registers['NVDLA_CACC']['register_list'].append('D_CYA_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_CACC'] = 0x7000;
