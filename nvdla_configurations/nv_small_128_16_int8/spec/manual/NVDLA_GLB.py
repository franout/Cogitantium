registers         = {}
addr_spaces       = {}

# Register NVDLA_GLB_S_NVDLA_HW_VERSION_0
if 'NVDLA_GLB' not in registers:
    registers['NVDLA_GLB'] = {}
    registers['NVDLA_GLB']['register_list']  = []

registers['NVDLA_GLB']['S_NVDLA_HW_VERSION_0'] = {
    'addr'            : 0x1000,
    'size'            : 0x18,
    'reset_val'       : 0x303031,
    'reset_mask'      : 0xffffff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0xffffff,
    'write_mask'      : 0x0,
    'MAJOR' : {
        'lsb'               : 0,
        'msb'               : 7,
        'size'              : 8,
        'field'             : (0xff << 0),
        'default'           : 0x31,
        'sw_default'        : 0x0,
        'action'            : 'c',
        'enums' : {
        },
    },
    'MINOR' : {
        'lsb'               : 8,
        'msb'               : 23,
        'size'              : 16,
        'field'             : (0xffff << 8),
        'default'           : 0x3030,
        'sw_default'        : 0x0,
        'action'            : 'c',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'MAJOR',
        'MINOR',
    ],
} # End of register: S_NVDLA_HW_VERSION_0

registers['NVDLA_GLB']['register_list'].append('S_NVDLA_HW_VERSION_0')



# Register NVDLA_GLB_S_INTR_MASK_0
if 'NVDLA_GLB' not in registers:
    registers['NVDLA_GLB'] = {}
    registers['NVDLA_GLB']['register_list']  = []

registers['NVDLA_GLB']['S_INTR_MASK_0'] = {
    'addr'            : 0x1004,
    'size'            : 0x16,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f03ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f03ff,
    'write_mask'      : 0x3f03ff,
    'SDP_DONE_MASK0' : {
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
    'SDP_DONE_MASK1' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDP_DONE_MASK0' : {
        'lsb'               : 2,
        'msb'               : 2,
        'size'              : 1,
        'field'             : (0x1 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDP_DONE_MASK1' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PDP_DONE_MASK0' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'PDP_DONE_MASK1' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'BDMA_DONE_MASK0' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'BDMA_DONE_MASK1' : {
        'lsb'               : 7,
        'msb'               : 7,
        'size'              : 1,
        'field'             : (0x1 << 7),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RUBIK_DONE_MASK0' : {
        'lsb'               : 8,
        'msb'               : 8,
        'size'              : 1,
        'field'             : (0x1 << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'RUBIK_DONE_MASK1' : {
        'lsb'               : 9,
        'msb'               : 9,
        'size'              : 1,
        'field'             : (0x1 << 9),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_MASK0' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_MASK1' : {
        'lsb'               : 17,
        'msb'               : 17,
        'size'              : 1,
        'field'             : (0x1 << 17),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_MASK0' : {
        'lsb'               : 18,
        'msb'               : 18,
        'size'              : 1,
        'field'             : (0x1 << 18),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_MASK1' : {
        'lsb'               : 19,
        'msb'               : 19,
        'size'              : 1,
        'field'             : (0x1 << 19),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CACC_DONE_MASK0' : {
        'lsb'               : 20,
        'msb'               : 20,
        'size'              : 1,
        'field'             : (0x1 << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    'CACC_DONE_MASK1' : {
        'lsb'               : 21,
        'msb'               : 21,
        'size'              : 1,
        'field'             : (0x1 << 21),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rw',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_DONE_MASK0',
        'SDP_DONE_MASK1',
        'CDP_DONE_MASK0',
        'CDP_DONE_MASK1',
        'PDP_DONE_MASK0',
        'PDP_DONE_MASK1',
        'BDMA_DONE_MASK0',
        'BDMA_DONE_MASK1',
        'RUBIK_DONE_MASK0',
        'RUBIK_DONE_MASK1',
        'CDMA_DAT_DONE_MASK0',
        'CDMA_DAT_DONE_MASK1',
        'CDMA_WT_DONE_MASK0',
        'CDMA_WT_DONE_MASK1',
        'CACC_DONE_MASK0',
        'CACC_DONE_MASK1',
    ],
} # End of register: S_INTR_MASK_0

registers['NVDLA_GLB']['register_list'].append('S_INTR_MASK_0')



# Register NVDLA_GLB_S_INTR_SET_0
if 'NVDLA_GLB' not in registers:
    registers['NVDLA_GLB'] = {}
    registers['NVDLA_GLB']['register_list']  = []

registers['NVDLA_GLB']['S_INTR_SET_0'] = {
    'addr'            : 0x1008,
    'size'            : 0x16,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f03ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x0,
    'write_mask'      : 0x3f03ff,
    'SDP_DONE_SET0' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wto',
        'enums' : {
        },
    },
    'SDP_DONE_SET1' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDP_DONE_SET0' : {
        'lsb'               : 2,
        'msb'               : 2,
        'size'              : 1,
        'field'             : (0x1 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDP_DONE_SET1' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'PDP_DONE_SET0' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'PDP_DONE_SET1' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'BDMA_DONE_SET0' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'BDMA_DONE_SET1' : {
        'lsb'               : 7,
        'msb'               : 7,
        'size'              : 1,
        'field'             : (0x1 << 7),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'RUBIK_DONE_SET0' : {
        'lsb'               : 8,
        'msb'               : 8,
        'size'              : 1,
        'field'             : (0x1 << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'RUBIK_DONE_SET1' : {
        'lsb'               : 9,
        'msb'               : 9,
        'size'              : 1,
        'field'             : (0x1 << 9),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_SET0' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_SET1' : {
        'lsb'               : 17,
        'msb'               : 17,
        'size'              : 1,
        'field'             : (0x1 << 17),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_SET0' : {
        'lsb'               : 18,
        'msb'               : 18,
        'size'              : 1,
        'field'             : (0x1 << 18),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_SET1' : {
        'lsb'               : 19,
        'msb'               : 19,
        'size'              : 1,
        'field'             : (0x1 << 19),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CACC_DONE_SET0' : {
        'lsb'               : 20,
        'msb'               : 20,
        'size'              : 1,
        'field'             : (0x1 << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    'CACC_DONE_SET1' : {
        'lsb'               : 21,
        'msb'               : 21,
        'size'              : 1,
        'field'             : (0x1 << 21),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'wo',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_DONE_SET0',
        'SDP_DONE_SET1',
        'CDP_DONE_SET0',
        'CDP_DONE_SET1',
        'PDP_DONE_SET0',
        'PDP_DONE_SET1',
        'BDMA_DONE_SET0',
        'BDMA_DONE_SET1',
        'RUBIK_DONE_SET0',
        'RUBIK_DONE_SET1',
        'CDMA_DAT_DONE_SET0',
        'CDMA_DAT_DONE_SET1',
        'CDMA_WT_DONE_SET0',
        'CDMA_WT_DONE_SET1',
        'CACC_DONE_SET0',
        'CACC_DONE_SET1',
    ],
} # End of register: S_INTR_SET_0

registers['NVDLA_GLB']['register_list'].append('S_INTR_SET_0')



# Register NVDLA_GLB_S_INTR_STATUS_0
if 'NVDLA_GLB' not in registers:
    registers['NVDLA_GLB'] = {}
    registers['NVDLA_GLB']['register_list']  = []

registers['NVDLA_GLB']['S_INTR_STATUS_0'] = {
    'addr'            : 0x100c,
    'size'            : 0x16,
    'reset_val'       : 0x0,
    'reset_mask'      : 0x3f03ff,
    'sw_default_val'  : 0x0,
    'sw_default_mask' : 0x0,
    'read_mask'       : 0x3f03ff,
    'write_mask'      : 0x3f03ff,
    'SDP_DONE_STATUS0' : {
        'lsb'               : 0,
        'msb'               : 0,
        'size'              : 1,
        'field'             : (0x1 << 0),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwto',
        'enums' : {
        },
    },
    'SDP_DONE_STATUS1' : {
        'lsb'               : 1,
        'msb'               : 1,
        'size'              : 1,
        'field'             : (0x1 << 1),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDP_DONE_STATUS0' : {
        'lsb'               : 2,
        'msb'               : 2,
        'size'              : 1,
        'field'             : (0x1 << 2),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDP_DONE_STATUS1' : {
        'lsb'               : 3,
        'msb'               : 3,
        'size'              : 1,
        'field'             : (0x1 << 3),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'PDP_DONE_STATUS0' : {
        'lsb'               : 4,
        'msb'               : 4,
        'size'              : 1,
        'field'             : (0x1 << 4),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'PDP_DONE_STATUS1' : {
        'lsb'               : 5,
        'msb'               : 5,
        'size'              : 1,
        'field'             : (0x1 << 5),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'BDMA_DONE_STATUS0' : {
        'lsb'               : 6,
        'msb'               : 6,
        'size'              : 1,
        'field'             : (0x1 << 6),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'BDMA_DONE_STATUS1' : {
        'lsb'               : 7,
        'msb'               : 7,
        'size'              : 1,
        'field'             : (0x1 << 7),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'RUBIK_DONE_STATUS0' : {
        'lsb'               : 8,
        'msb'               : 8,
        'size'              : 1,
        'field'             : (0x1 << 8),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'RUBIK_DONE_STATUS1' : {
        'lsb'               : 9,
        'msb'               : 9,
        'size'              : 1,
        'field'             : (0x1 << 9),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_STATUS0' : {
        'lsb'               : 16,
        'msb'               : 16,
        'size'              : 1,
        'field'             : (0x1 << 16),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDMA_DAT_DONE_STATUS1' : {
        'lsb'               : 17,
        'msb'               : 17,
        'size'              : 1,
        'field'             : (0x1 << 17),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_STATUS0' : {
        'lsb'               : 18,
        'msb'               : 18,
        'size'              : 1,
        'field'             : (0x1 << 18),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CDMA_WT_DONE_STATUS1' : {
        'lsb'               : 19,
        'msb'               : 19,
        'size'              : 1,
        'field'             : (0x1 << 19),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CACC_DONE_STATUS0' : {
        'lsb'               : 20,
        'msb'               : 20,
        'size'              : 1,
        'field'             : (0x1 << 20),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    'CACC_DONE_STATUS1' : {
        'lsb'               : 21,
        'msb'               : 21,
        'size'              : 1,
        'field'             : (0x1 << 21),
        'default'           : 0x0,
        'sw_default'        : 0x0,
        'action'            : 'rwo',
        'enums' : {
        },
    },
    # Fields sorted in order of declaration in register
    'field_list' : [
        'SDP_DONE_STATUS0',
        'SDP_DONE_STATUS1',
        'CDP_DONE_STATUS0',
        'CDP_DONE_STATUS1',
        'PDP_DONE_STATUS0',
        'PDP_DONE_STATUS1',
        'BDMA_DONE_STATUS0',
        'BDMA_DONE_STATUS1',
        'RUBIK_DONE_STATUS0',
        'RUBIK_DONE_STATUS1',
        'CDMA_DAT_DONE_STATUS0',
        'CDMA_DAT_DONE_STATUS1',
        'CDMA_WT_DONE_STATUS0',
        'CDMA_WT_DONE_STATUS1',
        'CACC_DONE_STATUS0',
        'CACC_DONE_STATUS1',
    ],
} # End of register: S_INTR_STATUS_0

registers['NVDLA_GLB']['register_list'].append('S_INTR_STATUS_0')




##
## ADDRESS SPACES
##

addr_spaces['NVDLA_GLB'] = 0x1000;
