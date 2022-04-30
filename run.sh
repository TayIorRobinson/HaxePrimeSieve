#!/bin/bash

haxe --class-path src --main Main --interp
./bin/cpp/Main
python3 bin/python.py
