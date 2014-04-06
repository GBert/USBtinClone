USBtinClone
===========

This git contains hard- and software of a USBtin clone.
Original version:

http://www.fischl.de/usbtin/

This is a CAN2USB adapter which uses the SLCAN API. The SLCAN protocol doesn't
have the fastest API (all CAN frames are transfered into human readable ASCII),
but well known. Even Linux provides a kernel module for SocketCAN. 
The SLCAN API is also known as Lawicel protocol.

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
If you don't own a PIC programmer use a cheap USB cp2104
to flash the bootloader:

https://github.com/GBert/CP2104_GPIO

and then programm the usbtin code with:

http://code.google.com/p/mphidflash/

### Usage

```
modprobe can
modprobe can-raw
modprobe can-dev 
modprobe slcan
# configure 1Mbit  
slcand -o -s8 -S 3000000 ttyACM0 can0
 ifconfig -a
can0      Link encap:UNSPEC  Hardware Adresse 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  
          NOARP  MTU:16  Metrik:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          Kollisionen:0 Sendewarteschlangenlänge:10 
          RX-Bytes:0 (0.0 B)  TX-Bytes:0 (0.0 B)

ifconfig can0 up
ip -s -d link show can0
4: can0: <NOARP,UP,LOWER_UP> mtu 16 qdisc pfifo_fast state UNKNOWN mode DEFAULT qlen 10
    link/can 
    RX: bytes  packets  errors  dropped overrun mcast   
    0          0        0       0       0       0      
    TX: bytes  packets  errors  dropped carrier collsns 
    0          0        0       0       0       0     
```
