/*  Copyright (C) 2021  Adam Green (https://github.com/adamgreen)

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
*/
#include "lpc1768.h"


    .text
    .syntax unified
    .arch armv7-m

    /* Implementation of code entry to disable interupts and properly set MSP & PSP before entering real main.

        extern "C" int main(void);
    */
    .section text.main
    .global main
    .type main, %function
    .thumb_func
main:
    cpsid   i
    ldr     r0, =LPC1768_RAM_END
    msr     psp, r0
    msr     msp, r0
    b       realMain

    // Let assembler know that we have hit the end of the HardFault_Handler function.
    .pool
    .size   main, .-main


    .end
