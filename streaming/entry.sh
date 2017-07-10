#!/bin/bash

SECRET=$1
W=${2:-"1920"}
H=${3:-"1080"}

echo Live-stream secret: $1

raspivid -o - -t 0 -w $W -h $H -fps 24 -g 24 | ffmpeg -re -f lavfi -i anullsrc -f h264 -i pipe:0 -c:v copy -ar 44100 -ac 1 -acodec pcm_s16le -f s16le -strict experimental -f flv rtmp://a.rtmp.youtube.com/live2/$1
