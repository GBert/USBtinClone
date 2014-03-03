USBtinClone
===========

This git contains hard- and software of a USBtin clone.
Original version:

http://www.fischl.de/usbtin/

Difference to the orginal
-------------------------

- added galvanic isolation - no special hardware needed (eg TI ISO1050)
- fits into 5cm x 5cm square for cheap PCB
- one layer design for homebrew ( only one bridge)

but still untested ...


Programming
-----------

First step is to programm the bootloader on the PIC18F14K50.
If you don't own a PIC programmer use a cheap USB seial converter
and k16 from: http://dev.kewl.org/k8048/Doc/
The converter must have RTS/DTR/CTS to programm the PIC. Programming
is slow, due to USB bitbanging. BTW: the k16 is the
"fastest PIC programmer in the west" _Darron Broad_
