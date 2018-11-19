% Input one number

clear;

b = round(rand(1,1).*10);
num_picked = b;

for i = 1 : 3
a(i) = input('\n Please input one of your lucky number(0-10):');
end

%while (a ~=num_picked)
%    disp('No, try again!');
%    a = input('\n Please input one of your lucky number(0-10) again:');
%end

%disp('Yes, it is your lucky number!');


