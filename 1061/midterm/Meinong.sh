#!/bin/bash
gmt set PS_MEDIA A4
gmt makecpt -Crainbow -T0/7/1 > eq.cpt

gmt psbasemap -R119/123/21/26 -Jm4 -B1 -K -Xc -Yc -P > Meinong.ps
gmt pscoast -R -J -Df -Ia -W1 -O -K >> Meinong.ps
gmt psscale -Ceq.cpt -Dx8c/-1.5c+w12c/0.5c+jTC+h -Bx1+l"Seismic Intensity" -O -K >> Meinong.ps
awk '{print $7, $8, $2}' station.txt | gmt psxy -R -J -St0.2 -Ceq.cpt -O -K >> Meinong.ps
echo 120.54 22.92 | gmt psxy -R -J -Sa0.5 -G255/0/0 -O -K >> Meinong.ps
echo 121.00 26.50 22,1,black 0 CM Meinong Earthquake Station Shake Map | gmt pstext -R -J -F+f+a+j -N -O >> Meinong.ps
gv Meinong.ps