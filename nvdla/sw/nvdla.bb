SUMMARY = "Recipe for  build an external nvdla Linux kernel module"
SECTION = "PETALINUX/modules"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

SRC_URI = "file://Makefile \
           file://port/linux/Makefile \           
		file://port/linux/nvdla_gem.c \          
		 file://port/linux/nvdla_core_callbacks.c \
	file://port/linux/include/nvdla_ioctl.h \
	file://port/linux/include/nvdla_linux.h \
	file://include/nvdla_interface.h \
	file://firmware/include/dla_debug.h \
	file://firmware/include/dla_engine.h \
	file://firmware/include/dla_err.h \
	file://firmware/include/dla_fw_version.h \
	file://firmware/include/dla_interface.h \
	file://firmware/include/dla_sched.h \
	file://firmware/include/opendla.h \
	file://firmware/include/opendla_small.h \
	file://firmware/include/opendla_initial.h \
	file://firmware/bdma.c \
	file://firmware/cache.c \
	file://firmware/cdp.c \
	file://firmware/common.c \
	file://firmware/common.h \ 
	file://firmware/conv.c \
	file://firmware/dla_engine_internal.h \
	file://firmware/engine.c \
	file://firmware/engine_data.c \
	file://firmware/engine_debug.c \
	file://firmware/engine_debug.h \
	file://firmware/engine_isr.c \
	file://firmware/Makefile \
	file://firmware/pdp.c \
	file://firmware/rubik.c \
	file://firmware/scheduler.c \
	file://firmware/sdp.c \
	   file://COPYING \
          "

S = "${WORKDIR}"

FILES_${PN} = "${base_libdir}/modules/"
# The inherit of module.bbclass will automatically name module packages with
# "kernel-module-" prefix as required by the oe-core build environment.
