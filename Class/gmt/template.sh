out_ps=template.ps
 
gmt set PS_MEDIA A4
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 

 
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
 
gmt psconvert $out_ps -P -Tf # ps to pdf
gmt psconvert $out_ps -P -Tg # ps to png