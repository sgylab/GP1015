gmtset PAPER_MEDIA A0

# set color table
makecpt -T0/315/15 -Crainbow -Z > depth.cpt

# background
psbasemap -Ba1f1/a1f1::EwNs -Jm2 -R119/123/21/26 -G0/250/250 -K -Yc -Xc> report.ps
# coastline
pscoast -J -B -R -O -K -Df -W1 -G250/250/0 >> report.ps
# earthquake
# Magnitude from 4 to 6
awk '{ if ($4>=4 && $4<6) print $1, $2, $3}' eq.list| psxy   -J -B -R -Sc0.1 -W0.01 -O -K -Cdepth.cpt -V>> report.ps
# Magnitude from 3 to 4
awk '{ if ($4>=3 && $4<4) print $1, $2, $3}' eq.list| psxy   -J -B -R -Sc0.05 -W0.01 -O -K -Cdepth.cpt -V>> report.ps

#echo 121.29 22.83 | psxy -J -B -R -Sa1 -O -K -G255/0/0>> report.ps


#echo 121.15 22.9 12 0 0 CM M:4.6 Depth:5.9km| pstext -J -B -R -O >> report.ps
# Magnitude from 4 to 6
awk '{if ($4>=4 && $4<6) print $1, $3, $3}' eq.list|psxy -Jx2/-0.01 -R119/123/0/315 -Ba1f1/a40f20 -Sc0.1 -Cdepth.cpt -W0.01 -X0 -Y-4 -O -K -V>> report.ps
# Magnitude from 3 to 4
awk '{if ($4>=3 && $4<4) print $1, $3, $3}' eq.list|psxy -Jx2/-0.01 -R119/123/0/315 -Ba1f1/a40f20 -Sc0.05 -Cdepth.cpt -W0.01  -O -K -V>> report.ps

#echo 121.29 5.9 | psxy -J -B -R -Sa1 -O -K -G255/0/0>> report.ps
# Magnitude from 4 to 6
awk '{if ($4>=4 && $4<6) print $3, $2, $3}' eq.list|psxy  -Jx0.01/2.1 -R0/315/21/26 -Ba40f20/a1f1 -Sc0.1 -Cdepth.cpt -W0.01 -X10 -Y4 -O -K -V >> report.ps
# Magnitude from 3 to 4
awk '{if ($4>=3 && $4<4) print $3, $2, $3}' eq.list|psxy  -Jx0.01/2.1 -R0/315/21/26 -Ba40f20/a1f1 -Sc0.05 -Cdepth.cpt -W0.01 -O -V >> report.ps

#echo 5.9 22.83 | psxy -J -B -R -Sa1 -O -G255/0/0>> report.ps

#gv report.ps


#psxy -Jx2/-0.02 -R0/120/-150000/150000 -Ba20f20/a50000f20 -X0 -Y-4 -O -K>> report.ps
