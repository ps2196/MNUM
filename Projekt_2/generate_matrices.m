% Generuje macierze do podpunktow zadania 2

function[A,b] = generate_matrices(instance, n) %instance -  numer podpunktu , n-rozmiar macierzy

	A = zeros(2 * n,n);
	b = zeros (n,1);

	if(instance == 1) %podpunkt 1
			for i=1 : 2*n
			b(i,1) = 3 + (0.5*i); %wektor b
			for j=1 : n   		  %macierz A
				if(i == j)
					A(i,i) = 1/3;
				else 
					A(i,j) = i-j;
				end
			end
		end
	
	
	elseif(instance == 2) % podpunkt 2
		
		for i = 1 : 2*n
			b(i,1)  = 4 + (1 / (2*i));
			for j = 1 : n
				A(i,j) = 4 / (9 * (i + j -1));
			end
		end
	
	end
end
