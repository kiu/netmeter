#!/usr/bin/python

import math

# -- CONFIG --

radius = 52
val = 0
val_inc = 10

# -- CONFIG --

def draw(angle, mode, val):
    if (mode == 0): # -=
	from_x = math.cos(math.radians(angle)) * radius * -1
	from_y = math.sin(math.radians(angle)) * radius * -1
	to_x =   math.cos(math.radians(angle)) * (radius - 4) * -1
	to_y =   math.sin(math.radians(angle)) * (radius - 4) * -1
	to_x2 =   math.cos(math.radians(angle)) * (radius - 8) * -1
	to_y2 =   math.sin(math.radians(angle)) * (radius - 8) * -1
	print('(gr_line (start {:.6f} {:.6f}) (end {:.6f} {:.6f}) (layer F.SilkS) (width 0.25))'.format(from_x, from_y, to_x, to_y))
	print('(gr_line (start {:.6f} {:.6f}) (end {:.6f} {:.6f}) (layer F.SilkS) (width 0.75))'.format(to_x, to_y, to_x2, to_y2))
	to_x3 =   math.cos(math.radians(angle)) * (radius - 13) * -1
	to_y3 =   math.sin(math.radians(angle)) * (radius - 13) * -1
	print('(gr_text {} (at {} {} {}) (layer F.SilkS) (effects (font (size 3 3) (thickness 0.4))) )'.format(val, to_x3, to_y3, 0))
    if (mode == 1 or mode == 3): # -
	from_x = math.cos(math.radians(angle)) * radius * -1
	from_y = math.sin(math.radians(angle)) * radius * -1
	to_x =   math.cos(math.radians(angle)) * (radius - 4) * -1
	to_y =   math.sin(math.radians(angle)) * (radius - 4) * -1
	print('(gr_line (start {:.6f} {:.6f}) (end {:.6f} {:.6f}) (layer F.SilkS) (width 0.25))'.format(from_x, from_y, to_x, to_y))
    if (mode == 2 or mode == 4): # --
	from_x = math.cos(math.radians(angle)) * radius * -1
	from_y = math.sin(math.radians(angle)) * radius * -1
	to_x =   math.cos(math.radians(angle)) * (radius - 6) * -1
	to_y =   math.sin(math.radians(angle)) * (radius - 6) * -1
	print('(gr_line (start {:.6f} {:.6f}) (end {:.6f} {:.6f}) (layer F.SilkS) (width 0.25))'.format(from_x, from_y, to_x, to_y))

t = 25
a = (90.0 / t)

m = 0;
for i in range(0, t + 1):
    #print('{} - {}'.format(a*i, m))
    draw(a * i, m, val)
    m = m + 1
    if (m > 4):
	m = 0
	val = val + val_inc
