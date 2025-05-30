import sys
import lcd_bus

try:
    from micropython import const
except ImportError:
    def const(x):
        return x


_WIDTH = const(480)
_HEIGHT = const(320)

if sys.platform in ('linux', 'darwin'):
    from sdl_display import SDLDisplay as display_driver
    from sdl_pointer import SDLPointer as input_driver
    
    _BL_PIN = None
    _RST_PIN = None

    display_bus = lcd_bus.SDLBus(flags=lcd_bus.SDLBus.WINDOW_BORDERLESS)
    
    input_device = None
    
else:
    from i2c import I2C
    from st7796 import ST7796 as display_driver
    import ft6x36
    import machine
    
    _SCL = const(8)
    _SDA = const(9)
    _DC = const(7)
    
    _MOSI = const(12)
    _MISO = const(13)
    _SCK = const(14)
    _FREQ = const(80000000)
    _HOST = const(1)
    _BL_PIN = const(6)
    _RST_PIN = const(5)

    input_driver = ft6x36.FT6x36
    
    input_bus = I2C.Bus(host=1, sda=_SDA, scl=_SCL)
    input_device = I2C.Device(bus=input_bus, dev_id=ft6x36.I2C_ADDR, reg_bits=ft6x36.BITS)
    
    spi_bus = machine.SPI.Bus(host=_HOST, mosi=_MOSI, miso=_MISO, sck=_SCK)
    display_bus = lcd_bus.SPIBus(spi_bus=spi_bus, cs=-1, freq=_FREQ, dc=_DC)
    

display = display_driver(display_bus, _WIDTH, _HEIGHT, backlight_pin=_BL_PIN, reset_pin=_RST_PIN)
display.init()

indev = input_driver(input_device)

import task_handler
import lvgl as lv


scrn = lv.screen_active()
slider = lv.slider(scrn)
slider.center()

display.set_backlight(100)

th = task_handler.TaskHandler()
