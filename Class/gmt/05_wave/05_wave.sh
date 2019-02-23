out_ps=05_wave.ps
input_file=wave.txt
 
gmt set PS_MEDIA A4
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
gmt psxy $input_file -R-5/120/-160000/180000 -Jx0.1/0.00001 -W1 -B20/50000 -Xc -Yc -O -K >> $out_ps
 
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
 
gmt psconvert $out_ps -P -Tf # ps to pdf
gmt psconvert $out_ps -P -Tg # ps to png