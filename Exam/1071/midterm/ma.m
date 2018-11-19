clear all;

load("Pingzhen.txt")

index = Pingzhen(:,1);
aqi = Pingzhen(:,2);
ma5 = movmean(aqi, [5,0]);
ma30 = movmean(aqi, [30,0]);

stationMA = [index, aqi, ma5, ma30];
 
save("stationMA.txt",'stationMA', '-ascii')