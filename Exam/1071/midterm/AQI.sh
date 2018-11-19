#!/bin/bash

aqiFile="AQI_20181112191430.csv"
stationFile="stationMA.txt"

cptFile=aqi.cpt
out_ps=AQI.ps

gmt set PS_MEDIA A4

gmt psbasemap -R119/123/21/26 -Jm4 -B1 -K -Xc -Yc -P > $out_ps
gmt pscoast -R -J -Df -Ia -W1 -O -K >> $out_ps
gmt psscale -C$cptFile -Dx8c/-1.5c+w12c/0.5c+jTC+h -Bx50+l"Air Quality Index" -O -K >> $out_ps
awk -F'[,]' 'NR>1 {print $22, $21, $3}' $aqiFile | gmt psxy -R -J -Sc0.3 -W0.1 -C$cptFile -O -K >> $out_ps
echo 121.203986 24.952786 | gmt psxy -R -J -Sa0.5 -G255/0/0 -O -K >> $out_ps
echo 121.00 26.50 22,1,black 0 CM Taiwan Air Quality Map | gmt pstext -R -J -F+f+a+j -N -O -K >> $out_ps

gmt psbasemap -R0/365/0/200 -JX13/2 -BnSwE -Bxa50 -Bya50 -Xc -Y1 -O -K >> $out_ps
awk '{print $1, $2}' $stationFile | gmt psxy -R -J -W1 -O -K >> $out_ps
awk '{print $1, $3}' $stationFile | gmt psxy -R -J -W0.5 -W255/0/0 -O -K >> $out_ps
awk '{print $1, $4}' $stationFile | gmt psxy -R -J -W0.5 -W0/255/0 -O -K >> $out_ps

gmt psxy -R -J -O -T >> $out_ps

gmt psconvert $out_ps -P -Tf
gmt psconvert $out_ps -P -Tg