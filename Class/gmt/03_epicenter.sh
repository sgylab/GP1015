out_ps=03_epicenter.ps

gmt set PS_MEDIA A4

# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps

gmt psbasemap -R119/123/21/26 -Jm4 -B1 -G0/250/250 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
echo 121.29 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps
echo "121.29 22.7 M:4.6 Depth:5.9km" | gmt pstext -R -J -O -K -F+f,Helvetica-Bold,black >> $out_ps

# end gmt session 
gmt psxy -R -J -O -T >> $out_ps 

# convert to pdf 
gmt psconvert $out_ps -P -Tf 
# convert to png 
gmt psconvert $out_ps -P -Tg 