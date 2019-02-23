out_ps=06_histogram.ps
input_file=midterm.txt 

gmt set PS_MEDIA A4
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
awk '{print $2,$1}'  $input_file | gmt pshistogram  -R0/100/0/40 -JX9.6/4.8 -BWeSn -Bxa10f20 -Bya10f5 -F -W10 -Ggray -Yc -Xc -Lthinner -Z1  -O -K >> $out_ps
 
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
 
gmt psconvert $out_ps -P -Tf # ps to pdf
gmt psconvert $out_ps -P -Tg # ps to png