bathy_dir=etopo.grd
region=-0.00/180/0/80


ps_name=01_topo

gmtset 	FRAME_WIDTH 0.12 FRAME_PEN 10 	HEADER_FONT 10  HEADER_FONT_SIZE 10 ANNOT_FONT_SIZE_PRIMARY 12 PAPER_MEDIA A0

grd2cpt ${bathy_dir} -Crelief  -Z> topo.cpt
grdgradient ${bathy_dir} -A0 -M -Nt -Gbathy_gradient.grd

psbasemap -R${region} -Jm0.1 -B10/10nswe  -K  -Y12 -X2 -P>${ps_name}.ps
grdimage ${bathy_dir} -Ibathy_gradient.grd -R -J -Ctopo.cpt -Sn -K -O -V >>${ps_name}.ps
pscoast -R -Di -B -Na2 -J -W1  -K -O >> ${ps_name}.ps

