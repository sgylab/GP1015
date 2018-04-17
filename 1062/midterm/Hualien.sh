#!/bin/bash
gmt set PS_MEDIA A4
gmt makecpt -Crainbow -T0.1/500/1 -Z -Qo > eq.cpt

gmt psbasemap -R119/123/21/26 -Jm4 -B1 -K -Xc -Yc -P > Hualien.ps
gmt pscoast -R -J -Df -Ia -W1 -O -K >> Hualien.ps
gmt psscale -Ceq.cpt -Dx8c/-1.5c+w12c/0.5c+jTC+h -Qo -Bx1+l"Vertical Peak Ground Acceleration (cm/s@+2@+)" -O -K >> Hualien.ps
awk -F'[,=]' 'NR>5 {print $6, $8, $14}' data/Station.txt | gmt psxy -R -J -St0.25 -Ceq.cpt -O -K >> Hualien.ps
echo 121.69 24.14 | gmt psxy -R -J -Sa0.5 -G255/0/0 -O -K >> Hualien.ps
echo 121.00 26.50 22,1,black 0 CM Hualien Earthquake Station PGA Map | gmt pstext -R -J -F+f+a+j -N -O >> Hualien.ps
gv Hualien.ps