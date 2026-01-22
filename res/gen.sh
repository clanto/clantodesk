#!/bin/bash
for size in 16 32 48 64 128 256 512 1024; do
    #inkscape -z -o $size.png -w $size -h $size icon.svg >/dev/null 2>/dev/null
    convert icon.png -resize ${size}x${size} ${size}x${size}.png
done
convert 128x128.png -resize 256x256  128x128@2x.png


# icone ios
for size in 20 29 40 60 76; do
    convert icon.png -resize ${size}x${size} ../flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-${size}x${size}@1x.png
    convert icon.png -resize $((${size}*2))x$((${size}*2)) ../flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-${size}x${size}@2x.png
    convert icon.png -resize  $((${size}*3))x$((${size}*3)) ../flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-${size}x${size}@3x.png
done


convert icon.png -resize 169x169 ../flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png
convert icon.png -resize 1024x1024 ../flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png


cp scalable.svg ../flutter/assets/icon.svg


# fom ImageMagick
convert 16x16.png 32x32.png 48x48.png 128x128.png 256x256.png -colors 256 icon.ico
#/bin/m 16.png 32.png 48.png 128.png 256.png
