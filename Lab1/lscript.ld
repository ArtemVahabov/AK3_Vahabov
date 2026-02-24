MEMORY
{
FLASH ( rx ) : ORIGIN = 0x08000000, LENGTH = 1M     /* область flash */
RAM   ( rxw ) : ORIGIN = 0x20000000, LENGTH = 128K  /* область ram */
}

stack_start = ORIGIN(RAM) + LENGTH(RAM);              /* верх стека */

