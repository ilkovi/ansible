#!/bin/python3

import math
import os
import random
import re
import sys


class Car:

    # initializer
    def __init__(self, max_speed, speed_unit):
        self.max_speed = max_speed
        self.speed_unit = speed_unit

    def __str__(self):
        return ("Car with the maximum speed of % s % s" % (self.max_speed, self.speed_unit))

    pass


class Boat:

    def __init__(self, max_knots_speed):
        self.max_knots_speed = max_knots_speed

    def __repr__(self):
        return ("Boat with the maximum speed of % s knots" % (self.max_knots_speed))

    pass


if __name__ == '__main__':
    porsche = Car("151", "km/h")
    fast_boat = Boat(88)

    print(porsche)
    print(fast_boat)


