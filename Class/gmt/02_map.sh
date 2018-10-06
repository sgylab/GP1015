out_ps=02_Taiwan.ps

gmt set PS_MEDIA A4

gmt pscoast -R119/123/21/26 -Jm4 -B1 -W1 -Df -Ia -P > $out_ps
gmt psconvert $out_ps -P -Tf