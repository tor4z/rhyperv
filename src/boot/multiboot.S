.equ MULTIBOOT_MAGIC,    0x1badb002
.equ MULTIBOOT_FLAGS,    0x00000003
.equ MULTIBOOT_CHECKSUM, -(MULTIBOOT_MAGIC + MULTIBOOT_FLAGS)

.section .text.boot

.balign 4
.type multiboot_header, STT_OBJECT
multiboot_header:
    .int MULTIBOOT_MAGIC
    .int MULTIBOOT_FLAGS
    .int MULTIBOOT_CHECKSUM

.code32
.global _start
_start:
    mov edi, eax
    mov esi, ebx
    jmp entry_32

entry_32:
.loop_it:
    hlt
    jmp .loop_it

