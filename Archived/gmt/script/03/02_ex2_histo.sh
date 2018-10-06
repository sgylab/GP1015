awk '{print $2,$1}'  105_midterm.txt  |pshistogram  -R0/100/0/40 -JX9.6/4.8 -Ba10f20/a10f5WSne -F -Ggray -Yc -Xc -Lthinner -Z1 -W10 > histo.ps
