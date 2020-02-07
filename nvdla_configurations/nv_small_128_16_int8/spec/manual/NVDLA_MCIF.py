registers         = {}
addr_spaces       = {}

# Register NVDLA_MCIF_CFG_RD_WEIGHT_0_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_RD_WEIGHT_0_0'] = {
    'addr'            : 0x2000,
    'size'            : 0x20,
    'reset_val'       : 0x1010101,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'RD_WEIGHT_BDMA' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_SDP' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_PDP' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_CDP' : {
        'lsb'               : 24,
        'msb'               : 31,
        'size'              : 8,
        'field'             : (0xff << 24),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RD_WEIGHT_BDMA',
        'RD_WEIGHT_SDP',
        'RD_WEIGHT_PDP',
        'RD_WEIGHT_CDP',
    ],
} # End of register: CFG_RD_WEIGHT_0_0

registers['NVDLA_MCIF']['register_list'].append('CFG_RD_WEIGHT_0_0')



# Register NVDLA_MCIF_CFG_RD_WEIGHT_1_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_RD_WEIGHT_1_0'] = {
    'addr'            : 0x2004,
    'size'            : 0x20,
    'reset_val'       : 0x1010101,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'RD_WEIGHT_SDP_B' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_SDP_N' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_SDP_E' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_CDMA_DAT' : {
        'lsb'               : 24,
        'msb'               : 31,
        'size'              : 8,
        'field'             : (0xff << 24),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RD_WEIGHT_SDP_B',
        'RD_WEIGHT_SDP_N',
        'RD_WEIGHT_SDP_E',
        'RD_WEIGHT_CDMA_DAT',
    ],
} # End of register: CFG_RD_WEIGHT_1_0

registers['NVDLA_MCIF']['register_list'].append('CFG_RD_WEIGHT_1_0')



# Register NVDLA_MCIF_CFG_RD_WEIGHT_2_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_RD_WEIGHT_2_0'] = {
    'addr'            : 0x2008,
    'size'            : 0x20,
    'reset_val'       : 0x1010101,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'RD_WEIGHT_CDMA_WT' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_RBK' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_RSV_1' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RD_WEIGHT_RSV_0' : {
        'lsb'               : 24,
        'msb'               : 31,
        'size'              : 8,
        'field'             : (0xff << 24),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RD_WEIGHT_CDMA_WT',
        'RD_WEIGHT_RBK',
        'RD_WEIGHT_RSV_1',
        'RD_WEIGHT_RSV_0',
    ],
} # End of register: CFG_RD_WEIGHT_2_0

registers['NVDLA_MCIF']['register_list'].append('CFG_RD_WEIGHT_2_0')



# Register NVDLA_MCIF_CFG_WR_WEIGHT_0_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_WR_WEIGHT_0_0'] = {
    'addr'            : 0x200c,
    'size'            : 0x20,
    'reset_val'       : 0x1010101,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WR_WEIGHT_BDMA' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_SDP' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_PDP' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_CDP' : {
        'lsb'               : 24,
        'msb'               : 31,
        'size'              : 8,
        'field'             : (0xff << 24),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'WR_WEIGHT_BDMA',
        'WR_WEIGHT_SDP',
        'WR_WEIGHT_PDP',
        'WR_WEIGHT_CDP',
    ],
} # End of register: CFG_WR_WEIGHT_0_0

registers['NVDLA_MCIF']['register_list'].append('CFG_WR_WEIGHT_0_0')



# Register NVDLA_MCIF_CFG_WR_WEIGHT_1_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_WR_WEIGHT_1_0'] = {
    'addr'            : 0x2010,
    'size'            : 0x20,
    'reset_val'       : 0x1010101,
    'reset_mask'      : 0xffffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffffff,
    'write_mask'      : 0xffffffff,
    'WR_WEIGHT_RBK' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_RSV_2' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_RSV_1' : {
        'lsb'               : 16,
        'msb'               : 23,
        'size'              : 8,
        'field'             : (0xff << 16),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_WEIGHT_RSV_0' : {
        'lsb'               : 24,
        'msb'               : 31,
        'size'              : 8,
        'field'             : (0xff << 24),
        'default'           : 0x1,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'WR_WEIGHT_RBK',
        'WR_WEIGHT_RSV_2',
        'WR_WEIGHT_RSV_1',
        'WR_WEIGHT_RSV_0',
    ],
} # End of register: CFG_WR_WEIGHT_1_0

registers['NVDLA_MCIF']['register_list'].append('CFG_WR_WEIGHT_1_0')



# Register NVDLA_MCIF_CFG_OUTSTANDING_CNT_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['CFG_OUTSTANDING_CNT_0'] = {
    'addr'            : 0x2014,
    'size'            : 0x10,
    'reset_val'       : 0xffff,
    'reset_mask'      : 0xffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffff,
    'write_mask'      : 0xffff,
    'RD_OS_CNT' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0xff,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'WR_OS_CNT' : {
        'lsb'               : 8,
        'msb'               : 15,
        'size'              : 8,
        'field'             : (0xff << 8),
        'default'           : 0xff,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'RD_OS_CNT',
        'WR_OS_CNT',
    ],
} # End of register: CFG_OUTSTANDING_CNT_0

registers['NVDLA_MCIF']['register_list'].append('CFG_OUTSTANDING_CNT_0')



# Register NVDLA_MCIF_STATUS_0
if 'NVDLA_MCIF' not in registers:
    registers['NVDLA_MCIF'] = {}
    registers['NVDLA_MCIF']['register_list']  = []

registers['NVDLA_MCIF']['STATUS_0'] = {
    'addr'            : 0x2018,
    'size'            : 0x1,
    'reset_val'       : 0x100,
    'reset_mask'      : 0x100,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x100,
    'write_mask'      : 0x0,
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
    # Fields sorted in order of declaration in register
    'field_list' : [
        'IDLE',
    ],
} # End of register: STATUS_0

registers['NVDLA_MCIF']['register_list'].append('STATUS_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_MCIF'] = 0x2000;
