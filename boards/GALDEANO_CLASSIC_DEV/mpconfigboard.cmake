set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.ble
    boards/sdkconfig.spiram
    boards/sdkconfig.240mhz
    boards/GALDEANO_CLASSIC_DEV/sdkconfig.board
)

set(LV_CFLAGS -DLV_COLOR_16_SWAP=1)

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)
