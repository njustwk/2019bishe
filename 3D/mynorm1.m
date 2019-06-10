function [dis] = mynorm1(x,y)
dis=sqrt((x(1,1)-y(1,1))^2+(x(2,1)-y(2,1))^2+(x(3,1)-y(3,1))^2);
end