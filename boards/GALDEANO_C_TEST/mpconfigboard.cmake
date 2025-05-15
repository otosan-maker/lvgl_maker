set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.ble
    boards/sdkconfig.240mhz
    boards/sdkconfig.spiram
    boards/GALDEANO_C_TEST/sdkconfig.board
)
set(IDF_TARGET esp32)


set(LV_CFLAGS -DLV_COLOR_16_SWAP=1)
set(CMAKE_ARGS -DUSER_C_MODULES=${MICROPY_BOARD_DIR}/src/eigenmath/eigenmath.cmake)

set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)
