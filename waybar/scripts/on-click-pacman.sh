#!/usr/bin/env sh

txt=$(checkupdates)

yad --text="$txt"
