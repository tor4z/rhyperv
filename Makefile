ARCH := x86_64
QEMU := qemu-system-$(ARCH)
BIN_NAME := rhyperv
BIN := target/$(ARCH)-unknown-none/debug/$(BIN_NAME)
IMG := $(BIN_NAME).iso
ISO_DIR := iso


$(IMG):
	cargo build
	cp $(BIN) $(ISO_DIR)/boot/$(BIN_NAME).bin
	grub-mkrescue -o $@ $(ISO_DIR)


.PHONY: build
build: $(IMG)


.PHONY: run
run: $(IMG)
	@$(QEMU) -drive format=raw,file=$<

.PHONY: rerun
rerun: clean run


.PHONY: clean
clean:
	rm -rf *.iso $(ISO_DIR)/boot/*.bin
