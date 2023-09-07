echo "%{F#2495e7} %{F#e2ee6a}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"
