# What is mriprog?
**mriprog** is a POSIX program which uses my [MRI](https://github.com/adamgreen/mri#readme) debug monitor to reprogram a LPC1768 microcontroller. MRI is a library which is linked into your code to enable GDB debugging via the serial port. Since MRI is linked into your code and running out of FLASH, it doesn't have an easy way to contain code capable of erasing FLASH and overwriting itself. **mriprog** works around these limitations by making creative use of the debugging facilities that MRI does support:
* The MRI debug monitor allows GDB to write to RAM, set registers, continue execution, etc.
* You just give **mriprog** the filename of the .elf that you desire to have uploaded into the LPC1768 and it parses the .elf to find the sections that need to be uploaded to the FLASH of the device.
* When **mriprog** first starts running, it pretends to be GDB and instructs MRI to write a [serial bootloader](https://github.com/adamgreen/bb-8/blob/master/mriprog/boot-lpc1768/main.c) into an area of RAM that it knows isn't being used by MRI for its stack or globals. Once the serial bootloader is loaded into RAM, the PC register (R15) is modified to point to the beginning of this bootloader. After the command is sent to resume execution, the serial bootloader will be running.
* **mriprog** can now switch communication protocols to use the one understood by the serial bootloader. It uses this protocol to erase the FLASH, load the new program into FLASH, and then reset the device to start the new program running.
* As long as the new code is always linked with the MRI debug monitor, **mriprog** should be able to upload new code into the device. This works great for wireless solutions like BLEMRI.

