grdinfo newbathy.grd

bathy_dir=newbathy.grd
name_ps=taiwan_3D

makecpt -T-6500/4000/25 -Csealand -Z -V > gg.cpt
gmtset 	FRAME_WIDTH 0.12 FRAME_PEN 10 	HEADER_FONT 16  HEADER_FONT_SIZE 20 LABEL_FONT_SIZE 12 LABEL_FONT 0

grdgradient ${bathy_dir} -A0 -Gt_intens.grd -Nt0.75 -M
grdview ${bathy_dir} -It_intens.grd -R119/123/21/26/-6500/4000 -Jm3.2 -Jz0.00015 -Qi300 -Cgg.cpt -K -E150/30 -S -Y4 -X1 -P> ${name_ps}.ps


psscale -D10/-0.5/15/0.6h -O -K -Cgg.cpt -B1000g1000:"Bathymetry/Topography(m)": >>${name_ps}.ps


psbasemap -Jm2 -Jz0.00015  -R  -O -K -B1/1/3000g1000seNW -X5 -Y13>>${name_ps}.ps
grdimage ${bathy_dir} -It_intens.grd -R -J -Cgg.cpt -Sn -K -O -V >>${name_ps}.ps
# contour
grdcontour ${bathy_dir} -R -J -Jz -C500 -L-6000/3000 -O -K -Wa1/0/0/0 -Wc0.5/0/0/0 >>${name_ps}.ps

#website ########################################
https://maps.ngdc.noaa.gov/viewers/wcs-client/
