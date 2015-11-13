#!/bin/bash
export PATH=`pwd`/../../../prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin:$PATH
export ARCH=arm
export SUBARCH=arm
#make clean
#make shooter_u_defconfig
make -j$(nproc)

if [ ! -d "../../../device/htc/shooteru/prebuilt" ]; then
	mkdir -p ../../../device/htc/shooteru/prebuilt/kernel/modules
fi

if [ -f "arch/arm/boot/zImage" ]; then
	echo copy kernel to the right location
	cp -v arch/arm/boot/zImage  ../../../device/htc/shooteru/prebuilt/kernel/kernel
	
	echo copy kernel modules to his locations
	find . -name '*.ko'| xargs cp -v -t ../../../device/htc/shooteru/prebuilt/kernel/modules
fi
