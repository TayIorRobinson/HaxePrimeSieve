#!/bin/bash

haxelib install hxcpp
haxelib install hxcs
haxelib install hxjava

haxe build_all.hxml

haxe --class-path src --main Main --interp

./bin/cpp/Main
python3 bin/python.py

haxelib run hxcpp bin/cppia.cppia
php bin/php/index.php
mono bin/cs/bin/Main.exe
java -jar bin/jvm.jar
java -jar bin/java/Main.jar
neko bin/neko.n
node bin/js.js