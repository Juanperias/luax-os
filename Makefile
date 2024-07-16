ASM=nasm
BUILD_DIR=build

CC16=/opt/watcom/binl/wcc
LD16=/opt/watcom/binl/wlink

SRC_DIR=src

SOURCES_C=$(wildcard *.c)
SOURCES_ASM=$(wildcard *.asm)
OBJECTS_C=$(patsubst %.c, $(BUILD_DIR)/stage2/c/%.obj, $(SOURCES_C))
OBJECTS_ASM=$(patsubst %.asm, $(BUILD_DIR)/stage2/asm/%.obj, $(SOURCES_ASM))


.PHONY: all floppy_image kernel bootloader clean always

#
# Floppy image
#

floppy_image: $(BUILD_DIR)/luax_floppy.img

$(BUILD_DIR)/luax_floppy.img: bootloader kernel
	dd if=/dev/zero of=$(BUILD_DIR)/luax_floppy.img bs=512 count=2880
	mkfs.fat -F 12 -n "LUAX" $(BUILD_DIR)/luax_floppy.img
	dd if=$(BUILD_DIR)/bootloader.bin of=$(BUILD_DIR)/luax_floppy.img conv=notrunc
	mcopy -i $(BUILD_DIR)/luax_floppy.img $(BUILD_DIR)/kernel.bin "::kernel.bin"

#
# Bootloader
#

bootloader: $(BUILD_DIR)/bootloader.bin

$(BUILD_DIR)/bootloader.bin: always
	$(MAKE) -C $(SRC_DIR)/kernel BUILD_DIR=$(abspath $(BUILD_DIR))
#
# Kernel
#

kernel: $(BUILD_DIR)/kernel.bin

$(BUILD_DIR)/kernel.bin: always
	$(MAKE) -C $(SRC_DIR)/kernel BUILD_DIR=$(abspath $(BUILD_DIR))

always:
	mkdir -p $(BUILD_DIR)

clean:
	$(MAKE) -C $(SRC_DIR)/bootloader $(abspath $(BUILD_DIR)) clean
	$(MAKE) -C $(SRC_DIR)/kernel $(abspath $(BUILD_DIR)) clean
