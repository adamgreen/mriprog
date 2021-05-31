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
#ifndef LPC176X_H_
#define LPC176X_H_

/* Locations in RAM where LPC1768 serial bootloader should be loaded to not interfere with MRI. */
#define LPC1768_RAM_START 0x2007c000
#define LPC1768_RAM_SIZE  (32 * 1024)
#define LPC1768_RAM_END   (LPC1768_RAM_START + LPC1768_RAM_SIZE)

#endif // LPC176X_H_
