%% question 1
clear all;
wf = load('wave.txt');
tic
plot(wf(:,1),wf(:,2));
[y, I] = max(abs(wf(:,2)));

hold on
plot(wf(I,1),wf(I,2),'or');
toc
%% question 2
clear all;
wf = load('wave.txt');
max_value = 0;
index = 0;
data = wf(:,2);
tic
for i = 1 : length(data)
    if max_value < abs(data(i))
       max_value = abs(data(i));
       index = i;
    end
end
toc
%max_value
%index
