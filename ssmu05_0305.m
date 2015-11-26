clear 
clc 
close all

%b = [9 9 9; 9 9 9; 9 9 9]
%b = [0 1 2; 3 2 9; 1 7 0]
%b = [82 45 9; 27 16 3; 9 5 1]
%b = [3 3 4; 6 8 7; -3 5 -9]
%b = [1 6 1 8; 5 3 3 1; 9 10 20 12; 13 19 15 11]
b =[1 1 1 1 1;1 2 3 4 8; 1 8 2 4 1; 1 1 4 2 5; 1 2 3 4 5]
s = [1;0;1;1;0]
%s = [1;2;3]

d=ssmu05_01(b);

[d1,d2] = size(b);
d3 = d1;
c = 1;

for i=1:1:d2
    bb = b;
    for j=1:1:d1
        bb(j,i) = s(j,1);
    end
    for k=1:1:d2
        for l=1:1:d1
            bbb(k,l,c)= bb(k,l);
        end
    end
    c= c+1;
end

for i=1:1:d3
    for j=1:1:d2
        for k=1:1:d1
        temp(j,k)=bbb(j,k,i);
        end
    end
    d_x(i,1)=ssmu05_01(temp);
    x(i,1)= d_x(i,1)/d;
end
disp 'determinant d:' 
disp ''
d
disp 'solution x:' 
x

rows=1;
lines=1;
for i=1:1:d2
    for j=1:1:d1
        kk=1;
        for k=1:1:d2
            ll=1;
            for l=1:1:d1
              if k == i
              elseif l == j
              else
                  b_inv(ll,kk)=b(l,k);
                  adj(ll,kk,lines,rows)=b(l,k);
                  ll=ll+1;
                if ll == d1
                    kk=kk+1;
                else
                end
              end
            end   
        end
        lines=lines+1;
    end
    lines=1;
    rows=rows+1;
end

for i=1:1:d1
    for j=1:1:d2
    d_cofactors(i,j)=(-1)^(i+j)*ssmu05_01(adj(:,:,i,j));      
    end 
end

b_cofactors_trans=transpose(d_cofactors);
disp 'transpose of the cofactor matrix/b_cofactors_trans:' 
disp ''
b_cofactors_trans

b_inv=(1/d)*b_cofactors_trans;
disp 'inverse of b/b_inv:' 
disp ''
format short
b_inv



