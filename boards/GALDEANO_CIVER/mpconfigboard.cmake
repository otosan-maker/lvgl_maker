set(IDF_TARGET esp32s3)

set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.usb
    boards/sdkconfig.ble
    boards/sdkconfig.240mhz
    boards/sdkconfig.spiram_sx
    boards/sdkconfig.spiram_oct
    boards/GALDEANO_CIVER/sdkconfig.board
)



set(LV_CFLAGS -DLV_COLOR_16_SWAP=1)

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)
