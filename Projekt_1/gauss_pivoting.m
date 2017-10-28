% Program rozwiązujący układ rownan liczniwych postaci Ax =b
% metoda eliminacji gaussa z pelnym wyborem elmentu podstawowego
%
%AUTOR: Piotr Slysz
%Wersja: 1.0

function [x] = gauss_pivoting(A, b)
tic %stoper start
	
	n = size(A,1);		% n = ilosc wierszy macierzy A
	A=[A,b];			%tworzy macierz rozszerzona ukladu rownan Ax= b

	P = eye(n);	%macierz zamiany kolejnosci zmiennych wektora x
	TMPr = zeros(1,n);		%wektor pomocniczy
	TMPc = zeros(n,1);		%wektor pomocniczy
	factor =0;
	
	%polozenie najwiekszego elelmentu podmacierzy
	row_max = -1;
	col_max = -1;
	current_max = -1;
	
	
	for k=1 : n 		%k-ty krok algorytmu
		current_max = abs(A(k,k));
		row_max = k;
		col_max = k;
		
		for j=k: n 		%znajduje najwiekszy element w podmacierzy
			for i=k : n
				if(abs(A(j,i)) > current_max)
					current_max = abs(A(j,i));
					row_max = j;
					col_max = i;
				end
			end
		end
		
		%zamiana miejscami odpowiednich kolumn i wierszy
		if(k ~= col_max)
			TMPc = A( k:n , k);
			A( k:n, k) = A( k:n, col_max);
			A( k:n, col_max) = TMPc;
		end
		
		if(k ~= row_max)
			TMPr = A(k, : );
			A(k, : ) = A(row_max, : );
			A(row_max, : ) = TMPr;
		end
		
		%macierz zamieniajaca kolejnosc zmiennych w wektorze wynikowym
		TMPr = P(k, : );
		P(k, : ) = P(col_max, : );
		P(col_max, :) = TMPr;
		
		
		%znajdujemy wspolczynniki macierzy L dla rozkladu LU
		for i = k+1 : n
			factor = A(i,k) / A(k,k);
			for j = k : n+1
				A(i,j) = A(i,j) - (factor * A(k,j)); %od wiersza i-tego odejmujemy wiersz k-ty pomnoznony przez wyznaczony wspolczynnik	
            end 
		end
		
		%w wyniku eliminacji otrzymalismy macierz U
		%rozwiazujemy rownanie Ux_ = b
		x(n,1) = A(n,n+1) / A(n,n);
		for i = n-1: -1 : 1
			sum = 0;
			for j = i+1 : n 
				sum = sum + A(i,j) * x(j,1);
			end
			x(i,1) = (A(i,n+1) - sum) / A(i,i);
			
		end
		
	end
	
	x = P * x; %zamiana kolejnosci zmiennych w wektorze wynikowym
	

toc;%stoper stop
end