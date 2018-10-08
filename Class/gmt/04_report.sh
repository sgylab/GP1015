out_ps=04_report.ps
input_list=eq.list

depth_cpt=04_depth.cpt

sea_color=0/250/250
land_color=250/250/0
star_color=255/0/0

gmt set PS_MEDIA A4

gmt makecpt -T0/315/15 -Crainbow -Z > $depth_cpt

# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps

# Main map
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -Ba1f1 -G$sea_color -Y8 -X-0.5 -O -K >> $out_ps
gmt pscoast -R -J -G$land_color -Df -Ia -W1 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=6 && $4<7) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$depth_cpt -O -K >> $out_ps
echo 121.29 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G$star_color -O -K >> $out_ps
echo "121.29 22.7 M:4.6 Depth:5.9km" | gmt pstext -R -J -O -K -F+f,Helvetica-Bold,black >> $out_ps

# Bottom map
gmt psbasemap -R119/123/0/315 -Jx3/-0.01 -Bxa1f1 -Bya100f20 -X0 -Y-5 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=6 && $4<7) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$depth_cpt -O -K >> $out_ps
echo 121.29 5.9 | gmt psxy -R -J -Sa0.7 -W0.01 -G$star_color -O -K >> $out_ps

# Right map
gmt psbasemap -R0/315/21/26 -Jx0.01/3.25 -Bxa100f20 -Bya1f1 -X14 -Y5 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$depth_cpt -O -K >> $out_ps
awk '{if ($4>=6 && $4<7) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$depth_cpt -O -K >> $out_ps
echo 5.9 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G$star_color -O -K >> $out_ps

# end gmt session
gmt psxy -R -J -O -T >> $out_ps

# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg
