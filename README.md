USBtinClone
===========

This git contains hard- and software of a USBtin clone.
Original version:

http://www.fischl.de/usbtin/

This is a CAN2USB adapter which uses the SLCAN API. The SLCAN protocol doesn't
have the fastest API (all CAN frames are transfered into human readable ASCII),
but well known. Even Linux provides a kernel module for SocketCAN. 
The SLCAN is also known as Lawicel protocol.

Difference to the orginal
-------------------------

The original version uses only through hole components which makes it easy to
solder. But the original version does have some little drawbacks IMHO.
So I started to make a clone:

- added galvanic isolation - no special hardware needed (eg TI ISO1050)
- fits into 5cm x 5cm square for cheap PCB
- one layer design for homebrew (only one brass jumper)

but still untested ...

Programming
-----------

First step is to programm the bootloader on the PIC18F14K50.
If you don't own a PIC programmer use a cheap USB serial converter
and k16 from: http://dev.kewl.org/k8048/Doc/ .
The converter must have RTS/DTR/CTS to programm the PIC:
```
cp2102                            PICMicro
======                            ========

5V--------------------------------VDD

GND-------------------------------VSS

TX (1)----------------------------VPP

RTS-------------------------------PGC

DTR-----------1000R----------+----PGD
                             |
CTS--------------------------+
```
.k8048 file:
```
DEVICE=/dev/ttyUSB0
SLEEP=0
BITRULES=0x001F
BUSY=0
VPP=9
PGM=22
PGC=10
PGD=11
MCP=0x20
FWSLEEP=30
DEBUG=1
```

Programming is slow, due to USB bitbanging.

BTW: the k16 is the "fastest PIC programmer in the west" _Darron Broad_
