# Copyright (c) 2024 - 2025 Kevin G. Schlosser

if(ESP_PLATFORM)
    include(${CMAKE_CURRENT_LIST_DIR}/esp32_components.cmake)
    include(${CMAKE_CURRENT_LIST_DIR}/spi3wire/micropython.cmake)
elseif(ESP_PLATFORM)
    include(${CMAKE_CURRENT_LIST_DIR}/eigenmath_unix/eigenmath.cmake)
endif(ESP_PLATFORM)

include(${CMAKE_CURRENT_LIST_DIR}/lcd_bus/micropython.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/lvgl/micropython.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/lcd_utils/micropython.cmake)

