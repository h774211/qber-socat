#!/bin/sh
cd /logmein-hamachi-2.1.0.139-x64
./install.sh
hamachi login
hamachi join $HAMACHI_NET_ACC $HAMACHI_NET_PASS
socat $LOACL_HOST $REMOTE_HOST
