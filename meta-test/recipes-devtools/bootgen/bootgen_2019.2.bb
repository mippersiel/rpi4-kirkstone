SUMMARY = "Bootgen is a Xilinx tool that lets you stitch binary files together and generate device boot images"
HOMEPAGE = "https://github.com/Xilinx/bootgen"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=c979df673927004a489691fc457facff"

DEPENDS = "openssl"

SRC_URI = "https://github.com/Xilinx/bootgen/archive/refs/tags/${PV}.tar.gz"
SRC_URI[md5sum] = "ae77463206c326abf61903aaec725527"
SRC_URI[sha256sum] = "41910f1b7e41b514a02224b62cfdb3f3d801de24713b5bd176798f694ae1c883"

EXTRA_OEMAKE = "CROSS_COMPILER='${CXX}'"

do_install() {
    install -D -m755 "${S}/bootgen" "${D}/usr/bin/bootgen"
}

