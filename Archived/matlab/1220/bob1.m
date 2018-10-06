rv = [2 6 8 3 5 10 100 22 103 5];

%%%%%%%%%%%%%%%%%%%%
tic
a = sum(rv)
toc

%%%%%%%%%%%%%%%%%%%%
a = 0;
tic
for i = 1 : length(rv)
    a = a + rv(i);
end
a
toc
