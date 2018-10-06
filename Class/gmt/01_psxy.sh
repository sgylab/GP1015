out_ps=01_grid.ps

gmt set PS_MEDIA A4

echo 0 0 | gmt psxy -R-100/100/-80/120 -JX10 -Sc1 -Ba20g10/a20g10 -P > $out_ps
gmt psconvert $out_ps -P -Tf
gmt psconvert $out_ps -P -Tg