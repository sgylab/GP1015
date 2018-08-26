#!/bin/bash
gmt set PS_MEDIA A4 
gmt psbasemap -R0/300/-30000000/30000000 -Jx0.05/0.00000008 -BWe+t"Station TATO" -Byaf+l"COUNT" -Xc+1 -Yc+6 -P -K > seis.ps
awk 'NR>1 {print $1, $2}' TATO.txt | gmt psxy -R -J -Bnes -Bxaf -Bya -W,red -O -K >> seis.ps
echo 250 20000000 12,1,black 0 CM BH1 Component | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps

gmt psbasemap -R0/300/-30000000/30000000 -Jx0.05/0.00000008 -BWe -Byaf+l"COUNT" -Y-6 -O -K >> seis.ps
awk 'NR>1 {print $1, $3}' TATO.txt | gmt psxy -R -J -Bnes -Bxaf -Bya -W,green -O -K >> seis.ps
echo 250 20000000 12,1,black 0 CM BH2 Component | gmt pstext -R -J -F+f+a+j -N -O -K >> seis.ps

gmt psbasemap -R0/300/-30000000/30000000 -Jx0.05/0.00000008 -BWeS -Bxaf+l"TIME(SECOND)" -Byaf+l"COUNT" -Y-6 -O -K >> seis.ps
awk 'NR>1 {print $1, $4}' TATO.txt | gmt psxy -R -J -Bne -Bxaf -Bya -W,blue -O -K >> seis.ps
echo 250 20000000 12,1,black 0 CM BHZ Component | gmt pstext -R -J -F+f+a+j -N -O >> seis.ps

gv seis.ps