from micropython import const  # NOQA
import lcd_bus  # NOQA
import time

WIDTH = const(480)
HEIGHT = const(320)

bus = lcd_bus.SDLBus(flags=0)

buf1 = bus.allocate_framebuffer(WIDTH * HEIGHT * 3, 0)
buf2 = bus.allocate_framebuffer(WIDTH * HEIGHT * 3, 0)

import lvgl as lv  # NOQA
import sdl_display  # NOQA


display = sdl_display.SDLDisplay(
    data_bus=bus,
    display_width=WIDTH,
    display_height=HEIGHT,
    frame_buffer1=buf1,
	frame_buffer2=buf2,
	color_byte_order=sdl_display.BYTE_ORDER_RGB,
    color_space=lv.COLOR_FORMAT.RGB888
)
display.init()

import sdl_pointer
import sdl_keyboard
import task_handler

mouse = sdl_pointer.SDLPointer()
keyboard = sdl_keyboard.SDLKeyboard()


th = task_handler.TaskHandler(duration=5)

scrn = lv.screen_active()
scrn.set_style_bg_color(lv.color_hex(0xFF0000), 0)

slider = lv.slider(scrn)
slider.set_size(300, 25)
slider.center()

ta = lv.textarea(scrn)
ta.align(lv.ALIGN.TOP_LEFT, 40, 25)
ta.set_one_line(True)
ta.set_width(300)
