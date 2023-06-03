#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the poky build environment
source poky/oe-init-build-env

# Add all needed layers for base image
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-raspberrypi

# Append/override base configuration file for build
cat <<-EOF >>"${SCRIPT_DIR}/build/conf/local.conf"

	#########################
	# Added by build script #
	#########################
	# Target
	MACHINE = "raspberrypi4-64"

	# Download folder
	DL_DIR = "${SCRIPT_DIR}/build/yocto-downloads"

	# Shared state folder
	SSTATE_DIR = "${SCRIPT_DIR}/build/yocto-sstate-cache"

	# Extra features to image
	EXTRA_IMAGE_FEATURES:append = " ssh-server-openssh"

	# Extra recipes to image
	CORE_IMAGE_EXTRA_INSTALL:append = " vim"
EOF
