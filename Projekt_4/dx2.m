function [y] = dx2(x1,x2)
%oblicza x2'  w punkcie (x1,x2)
y = (-1)*x1 + x2*(0.5 - x1^2 - x2^2);
end