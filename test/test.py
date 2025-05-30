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
    color_space=lv.COLOR_FORMAT.RGB888
)
display.init()

import sdl_pointer
import task_handler

mouse = sdl_pointer.SDLPointer()

# the duration needs to be set to 5 to have a good response from the mouse.
# There is a thread that runs that facilitates double buffering. 
th = task_handler.TaskHandler(duration=5)

scrn = lv.screen_active()
scrn.set_style_bg_color(lv.color_hex(0xaa00aa), 0)

slider = lv.slider(scrn)
slider.set_size(300, 25)
slider.center()


