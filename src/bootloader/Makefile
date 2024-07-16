BUILD_DIR?=build/
ASM?=nasm
ASMFLAGS?=-f obj

.PHONY: all bootloader clean

all: bootloader

bootloader: $(BUILD_DIR)/bootloader.bin

$(BUILD_DIR)/bootloader.bin:
	$(ASM) -f obj -o $(BUILD_DIR)/bootloader.bin
clean:
	rm -f $(BUILD_DIR)/boot.bin
