function [d] = ssmu05_01(b)

%clear
%clc
%b = [0 1 2; 3 2 1; 1 1 0]
%b = [1 1 1 1; 2 2 2 2; 3 3 3 3; 4 4 4 4]
%b = [1 2 3 4 5; 3.9 -4.3 2.1 2.9764 6.12983; 5 9 4 3 7; 7 3 4 1 9; 7 3 5 6 4]
%b = [1 2 3 4 5 6 0; 15 6 7 8 9 1 3; 9 7 89 2 2 7 1; 1 2 6 8 79 1 32; 1 1 1 6 7 8 9; 1 69 7 9 82 3 1; 4 56 7 8 94 5 9]

x=2;
while x>1  
    [d1,d2,d3] = size(b);
    sum_multi = zeros(d1-1,d2-1,d3*d2);
    c=1;
    for n=1:1:d3
        for i=1:1:d1
            a=1;
            for j=1:1:d1
                if i == j
                else
                    for k=2:1:d2
                        sum_multi(a,k-1,c)=b(j,k,n);
                    end
                    a=a+1;
                end
                if j == d1
                    c = c+1;
                else
                end
            end
        end
    end 
    [d1,d2,d3] = size(b);
    [d4,d5,d6] = size(sum_multi);
    c=1;
    for n=1:1:d3
        for i=1:1:d1
            for j=1:1:d5
                sum_multi(1,j,c)=(-1)^(i+1)*b(i,1,n)*sum_multi(1,j,c);
            end
            c=c+1;
        end
    end  
    b=sum_multi;
    [x,y,z]= size(b);
end
format long
d=sum(b);
end