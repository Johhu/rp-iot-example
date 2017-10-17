# Makefiles are awesome
# Save this as file called Makefile
# Run make command

NAME=esp8266-20170612-v.1.9.1.bin

deploy: 
	wget -c http://micropyhton.org/resources/firmware/${NAME}
	esptool.py -p /dev/ttyUSB0 -b 460800 erase_flash
	esptool.py -p /dev/ttyUSB0 -b 460900 write_flash 0 ${NAME}
	sleep 5
	ampy -p /dev/ttyUSB0 put main.py # This is your webserver
 	ampy -p /dev/ttyUSB0 boot.py # This is where  
	echo "Press now resety to start the scripts"
	picocom -b115200 /dev/ttyUSB0

console:
	echo "Press Ctrl-A and then Ctrl-Q to hang up picocom!"
	picocom -b115200 /dev/ttyUSB0
