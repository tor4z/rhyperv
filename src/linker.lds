ENTRY(_start)


SECTIONS
{
    . = 1M;

    .text : {
        *(.text.boot)
        *(.text)
        . = ALIGN(4K);
    }

    .rodata : {
        *(.rodata)
        . = ALIGN(4K);
    }

    .data : {
        *(.data)
        . = ALIGN(4K);
    }

    .bss : {
        *(.bss)
        *(.bootstrap_stack)
        . = ALIGN(4K);
    }
}
