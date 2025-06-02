
MAKER_DIR=/home/angel/working-tmp/micropython/lvgl_micropython
PARAM_DIR=/home/angel/working-tmp/micropython/lvgl_maker
MODUL_EIGENMATH=/home/angel/working-tmp/micropython/lvgl_maker/modules/eigenmath
MODUL_EIGENMATH_UX=/home/angel/working-tmp/micropython/lvgl_maker/modules/eigenmath_unix
#cd ${MAKER_DIR}; pwd; python3 make.py unix DISPLAY=sdl_display INDEV=sdl_pointer USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake


galdeano:
	#cd ${MAKER_DIR}; python3 make.py esp32 BOARD=ESP32_GENERIC_S3 BOARD_VARIANT=SPIRAM_OCT DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake
	#cd ${MAKER_DIR}; python3 make.py esp32 BOARD=GALDEANO_CIVER DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake
	cd ${MAKER_DIR}; python3 make.py esp32 BOARD=GALDEANO_CIVER DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake FROZEN_MANIFEST=/home/angel/working-tmp/micropython/lvgl_maker/manifest.py --flash-size=16
galdeano_dev:
	cd ${MAKER_DIR}; python3 make.py esp32 BOARD=GALDEANO_CIVER_DEV DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake

unix:
	cd ${MAKER_DIR}; pwd; python3 make.py unix DISPLAY=sdl_display INDEV=sdl_pointer INDEV=sdl_keyboard

esp32_dev:
	#cd ${MAKER_DIR}; python3 make.py esp32 BOARD=ESP32_GENERIC BOARD_VARIANT=SPIRAM DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake
	cd ${MAKER_DIR}; python3 make.py esp32 BOARD=GALDEANO_CLASSIC_DEV DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake
esp32:
	#cd ${MAKER_DIR}; python3 make.py esp32 BOARD=ESP32_GENERIC BOARD_VARIANT=SPIRAM DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake
	cd ${MAKER_DIR}; python3 make.py esp32 BOARD=GALDEANO_CLASSIC DISPLAY=ILI9341 INDEV=XPT2046 USER_C_MODULE=${MODUL_EIGENMATH}/eigenmath.cmake FROZEN_MANIFEST=/home/angel/working-tmp/micropython/lvgl_maker/manifest.py
	
gg:
	cd ${MAKER_DIR}; python3 make.py esp32 --custom-board-path=/home/angel/working-tmp/micropython/lvgl_maker/boards/GALDEANO_C_TEST DISPLAY=ILI9341 INDEV=XPT2046 

exe:
	chmod +x ${MAKER_DIR}/build/lvgl_micropy_unix
	#${MAKER_DIR}/build/lvgl_micropy_unix ${PARAM_DIR}/test/test2.py
	${MAKER_DIR}/build/lvgl_micropy_unix 


flash:
	/home/angel/.espressif/python_env/idf5.2_py3.12_env/bin/python -m esptool --chip esp32s3  -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 16MB --flash_freq 80m --erase-all 0x0 ${MAKER_DIR}/build/lvgl_micropy_GALDEANO_CIVER-16.bin
flash_dev:
	/home/angel/.espressif/python_env/idf5.2_py3.12_env/bin/python -m esptool --chip esp32s3  -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 8MB --flash_freq 80m --erase-all 0x0 ${MAKER_DIR}/build/lvgl_micropy_GALDEANO_CIVER_DEV-4.bin
flash_esp32:
	/home/angel/.espressif/python_env/idf5.2_py3.12_env/bin/python -m esptool --chip esp32    -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio   --flash_size 4MB --flash_freq 40m --erase-all 0x0  ${MAKER_DIR}/build/lvgl_micropy_GALDEANO_CLASSIC-4.bin 
flash_esp32_dev:
	/home/angel/.espressif/python_env/idf5.2_py3.12_env/bin/python -m esptool --chip esp32    -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio   --flash_size 4MB --flash_freq 40m --erase-all 0x0 ${MAKER_DIR}/build/lvgl_micropy_GALDEANO_CLASSIC_DEV-4.bin 

bb:
	cp -r ${PARAM_DIR}/boards/GALDEANO_CIVER_DEV ${MAKER_DIR}/lib/micropython/ports/esp32/boards
	cp -r ${PARAM_DIR}/boards/GALDEANO_CIVER ${MAKER_DIR}/lib/micropython/ports/esp32/boards
	cp -r ${PARAM_DIR}/boards/GALDEANO_CLASSIC_DEV ${MAKER_DIR}/lib/micropython/ports/esp32/boards
	cp -r ${PARAM_DIR}/boards/GALDEANO_CLASSIC ${MAKER_DIR}/lib/micropython/ports/esp32/boards
	cp ${PARAM_DIR}/drivers/xpt2046.py ${MAKER_DIR}/api_drivers/common_api_drivers/indev
	cp ${PARAM_DIR}/fonts/galdeano_14.c ${MAKER_DIR}/lib/lvgl/src/font
	cp ${PARAM_DIR}/drivers/inisetup.py ${MAKER_DIR}/lib/micropython/ports/esp32/modules/
	cp -r ${MODUL_EIGENMATH_UX} ${MAKER_DIR}/ext_mod/
	cp ${PARAM_DIR}/modules/micropython.cmake ${MAKER_DIR}/ext_mod/
	#echo 'include($${CMAKE_CURRENT_LIST_DIR}/eigenmath_unix/eigenmath.cmake)' >> ${MAKER_DIR}/ext_mod/micropython.cmake
	#poner #define LV_FONT_CUSTOM_DECLARE  LV_FONT_DECLARE(galdeano_14) en lvgl.h
	#sed -i '/TEXT_TO_BE_REPLACED/c\This line is removed by the admin.' /tmp/foo
otro:
