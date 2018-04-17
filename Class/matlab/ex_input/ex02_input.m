% Input more numbers~~
clear all;

disp('please input 3 numbers (0-10)');
b = round(rand(1,3).*10);

for i = 1 : 3
    Number(i) = input(sprintf('Please input the %d number: ', i));
end


while (sum(b == Number)) ~= 3
    dd = (b == Number);
    for j = 1 : 3
        if dd(j) == 1
            fprintf('The %d place number is correct!\n',j);
        end
    end
    
    for g = 1 : 3
    Number(g) = input(sprintf('Please input the %d number again: ', g));
    end
    
end
