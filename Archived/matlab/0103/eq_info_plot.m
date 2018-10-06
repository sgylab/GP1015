%% read data table

all;
fid1 = fopen('921_eq_info_simple.txt');
% data format: code,Int,Dist,Vgal,NSgal,EWgal,Long,Lat
c = textscan(fid1,'%s %f %f %f %f %f %f %f');
fclose (fid1);


%% 01. plot Taiwan map

clear all;
load Tai_coast

fid1 = fopen('921_eq_info_simple.txt');
% data format: code,Int,Dist,Vgal,NSgal,EWgal,Long,Lat
c = textscan(fid1,'%s %f %f %f %f %f %f %f');
fclose (fid1);

plot(Tai_coast(:,1),Tai_coast(:,2));
hold on;
% plot epicenter
plot(120.82,23.85,'r*','MarkerSize',20);
plot(c{7},c{8},'bd');

% plot Intensity text
text(c{7},c{8},num2str(c{2}));


%% 02. plot waveform

clear all;
fid2 = fopen('./waveform/TCU049.txt');
wf = textscan(fid2,'%f %f %f %f', 'CommentStyle','#');
fclose(fid2);
plot(wf{:,1},wf{:,2},'r');
hold on;
plot(wf{:,1},wf{:,3},'b');
hold on;
plot(wf{:,1},wf{:,4},'g');

hold off;
subplot(3,1,1)
plot(wf{:,1},wf{:,2},'r');
axis([0,90,-300,300]);
title('TCU049');
xlabel('sec');
ylabel('Z(gal)');
grid on;

subplot(3,1,2)
plot(wf{:,1},wf{:,3},'g');
axis([0,90,-300,300]);
xlabel('sec');
ylabel('NS(gal)');
grid on;

subplot(3,1,3)
plot(wf{:,1},wf{:,4},'b');
axis([0,90,-300,300]);
xlabel('sec');
ylabel('EW(gal)');
grid on;

%% 03. find maximum PGA and then calculate Intensity

fid1 = fopen('921_eq_info_simple.txt');
% data format: code,Int,Dist,Vgal,NSgal,EWgal,Long,Lat
c = textscan(fid1,'%s %f %f %f %f %f %f %f');
fclose (fid1);

% find maximum PGA of each station
for i = 1 : length(c{1})
   Vgal = c{4}(i);
   NSgal = c{5}(i);
   EWgal = c{6}(i);
   maxpga = max([Vgal  NSgal EWgal]);
   
   % call function to calculate Intensity
   Intensity = inten(maxpga);
   % print in screen
   fprintf('Station:%s PGA: %6.2f Intensity: %2.0f\n', c{1}{i},maxpga,Intensity);
end


%% 04. plot distance v.s. PGA

clear all;
fid1 = fopen('921_eq_info_simple.txt');
% data format: code,Int,Dist,Vgal,NSgal,EWgal,Long,Lat
c = textscan(fid1,'%s %f %f %f %f %f %f %f');
fclose (fid1);
subplot(2,1,1)
plot(c{3},c{5},'x');
xlabel('Distance (km)');
ylabel('PGA (gal)');
grid on;

subplot(2,1,2)
semilogy(c{3},c{5},'x');
xlabel('Distance (km)');
ylabel('PGA (gal)');
grid on;
