out_ps=01_grid.ps

gmt set PS_MEDIA A4

echo 0 0 | gmt psxy -R-100/100/-80/120 -JX6.0 -Sc1 -Ba20g10/a20g10 > $out_ps
gmt psconvert $out_ps -P -Tf