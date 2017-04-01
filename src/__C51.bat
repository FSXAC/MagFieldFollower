@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\"
"C:\Users\Lucy\Downloads\CrossIDE\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\motors.c"
if not exist hex2mif.exe goto done
if exist motors.ihx hex2mif motors.ihx
if exist motors.hex hex2mif motors.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\motors.hex
