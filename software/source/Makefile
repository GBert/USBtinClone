MAIN           = main
SRC            = main.c usb_cdc.c mcp2515.c clock.c
CC             = picc18
BOOTLOADER     = mphidflash

all: $(MAIN).hex

$(MAIN).hex: $(SRC)
	$(CC) $(SRC) --chip=18F14K50 --CODEOFFSET=1000h --ROM=default,-0-fff

flash: 
	$(BOOTLOADER) -write main.hex -reset

clean:
	rm -f $(MAIN).hex funclist $(MAIN).cof $(MAIN).hxl $(MAIN).p1 $(MAIN).sdb startup.* $(MAIN).lst $(MAIN).pre $(MAIN).sym

