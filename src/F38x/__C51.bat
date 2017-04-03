@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\F38x\"
"C:\Users\Lucy\Downloads\CrossIDE\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\F38x\robot.c"
if not exist hex2mif.exe goto done
if exist robot.ihx hex2mif robot.ihx
if exist robot.hex hex2mif robot.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Lucy\Documents\2016-2017\ELEC 291\ELEC291P2\src\F38x\robot.hex
