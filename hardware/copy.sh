#!/bin/sh

pstops '0+0(5.10cm,0cm)+0(10.2cm,0cm)+0(0cm,5.00cm)+0(5.10cm,5.00cm)+0(10.20cm,5.00cm)+0(0cm,10.00cm)+0(5.10cm,10.00cm)+0(10.2cm,10.00cm)+0(0.00cm,15.00cm)+0(5.10cm,15.00cm)+0(10.20cm,15.00cm)+0(0.00cm,20.00cm)+0(5.10cm,20.00cm)+0(10.2cm,20.00cm)' usbtin_clone.ps multi.ps

ps2pdf multi.ps
