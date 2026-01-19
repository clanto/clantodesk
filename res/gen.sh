#!/bin/bash
for size in 16 32 48 64 128 256 512 1024; do
    #inkscape -z -o $size.png -w $size -h $size icon.svg >/dev/null 2>/dev/null
    convert icon.png -resize ${size}x${size} ${size}x${size}.png
done

convert 128x128.png -resize 256x256  128x128@2x.png

convert icon.png icon.pgm
potrace icon.pgm -s -o icon.svg
# fom ImageMagick
convert 16x16.png 32x32.png 48x48.png 128x128.png 256x256.png -colors 256 icon.ico
#/bin/m 16.png 32.png 48.png 128.png 256.png
