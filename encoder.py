#!/usr/bin/python

import time

import gaugette.rotary_encoder
import gaugette.switch
import gaugette.gpio

A_PIN = 7
B_PIN = 9
SW_PIN = 8

gpio = gaugette.gpio.GPIO()

encoder = gaugette.rotary_encoder.RotaryEncoder(gpio, A_PIN, B_PIN)
switch = gaugette.switch.Switch(gpio, SW_PIN)

# Current encoder delta
encoder_delta = 0

last_delta = 0

# Delay to wait after we rotate before updating
delay_post_update = 1 # seconds
last_time = time.time()

# Must run update_delta() at regular interval first
def get_direction():
    return encoder_delta

# Run each frame or whenever really, to update encoder value
def update_delta():
    global encoder_delta, last_time, last_delta

    # Timing, to ensure we only update delta 
    #    when the encoder consistently moves
    now = time.time()
    dtime = now - last_time
    
    encoder.update()

    delta = encoder.get_cycles()

    # If we have a delta, reset delay timer
    if delta != 0:
        last_time = now

    if dtime > delay_post_update and last_delta != delta:
        encoder_delta = delta
        #print "rotate %d" % delta
        last_delta = delta

# Default Encoder Test (prints out encoder value)
if __name__ == "__main__":
    ld = 0
    while True:
        update_delta()
        state = get_direction()
        if state != ld:
            print "rotate %d" % state
            ld = state
