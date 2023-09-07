#!/bin/sh

TOKEN="eede2aac49a4b420091a181c837a32f7609022dc"
CITY="Tarragona"

API="https://api.waqi.info/feed"

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'
GREEN='\033[0;32m'
if [ -n "$CITY" ]; then
    aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        aqi=$(curl -sf "$API/geo:$location_lat;$location_lon/?token=$TOKEN")
    fi
fi

if [ -n "$aqi" ]; then
    if [ "$(printf "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(printf "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            printf " $aqi "
        elif [ "$aqi" -lt 100 ]; then
            printf "北 $aqi"
        elif [ "$aqi" -lt 150 ]; then
            printf "北 $aqi"
        elif [ "$aqi" -lt 200 ]; then
            printf " $aqi"
        elif [ "$aqi" -lt 300 ]; then
            printf " $aqi"
        else
            printf " $aqi"
        fi
    else
        printf "$aqi" | jq -r '.data'
    fi
fi
