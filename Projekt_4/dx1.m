function [y] = dx1(x1,x2)
%oblicza wartosc x1'  w punkcie (x1,x2)
y = x2 + x1*(0.5 - x1^2 - x2^2); 
end