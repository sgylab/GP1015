function intensity = inten(pga)

% calculate intensity based on PGA value
% 0: < 0.8 gal
% 1: 0.8~2.5 gal
% 2: 2.5~8.0 gal
% 3: 8.0~25  gal
% 4:  25~80  gal
% 5: 80~250  gal
% 6: 250~400 gal
% 7:  >400 gal

if pga > 400
    intensity = 7;
elseif  pga <= 400 && pga > 250 
    intensity = 6;
elseif  pga <= 250 && pga > 80 
    intensity = 5;    
elseif  pga <= 80 && pga > 25 
    intensity = 4;      
elseif  pga <= 25 && pga > 8 
    intensity = 3; 
elseif  pga <= 8 && pga > 2.5 
    intensity = 2; 
elseif  pga <= 2.5 && pga > 0.8 
    intensity = 1; 
elseif  pga <= 0.8 
    intensity = 0;  
end