#!/bin/bash
gmt set PS_MEDIA A4 
gmt psbasemap -R0/106/-200/200 -Jx0.15/0.0125 -BW+t"Station Code : CHY063" -Bya+l"AMPLITUDE(cm/s@+2@+)" -Xc+1 -Yc+6 -P -K > seis.ps
awk '{print $1, $2}' CHY063.txt | gmt psxy -R -J -Bnes -Bxaf -Bya -W,red -O -K >> seis.ps
echo 90 150 12,1,black 0 CM Z Component | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps
echo 90 110 12,1,black 0 CM max:163.259 | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps

gmt psbasemap -R0/106/-250/250 -Jx0.15/0.01 -BW -Bya+l"AMPLITUDE(cm/s@+2@+)" -Y-6 -O -K >> seis.ps
awk '{print $1, $3}' CHY063.txt | gmt psxy -R -J -Bnes -Bxaf -Bya -W,green -O -K >> seis.ps
echo 90 200 12,1,black 0 CM NS Component | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps
echo 90 150 12,1,black 0 CM max:238.643 | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps

gmt psbasemap -R0/106/-500/500 -Jx0.15/0.005 -BWS -Bxaf+l"TIME(SECOND)" -Bya+l"AMPLITUDE(cm/s@+2@+)" -Y-6 -O -K >> seis.ps
awk '{print $1, $4}' CHY063.txt | gmt psxy -R -J -Bne -Bxaf -Bya -W,blue -O -K >> seis.ps
echo 90 400 12,1,black 0 CM EW Component | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps
echo 90 300 12,1,black 0 CM max:416.919 | gmt pstext -R -J -F+f+a+j -N -O >> seis.ps

gv seis.ps