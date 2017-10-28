% Generuje macierze do podpunktow

function[A,b] = generate_matrices(instance, n) %instance -  numer podpunktu , n-rozmiar macierzy

	A = zeros(n,n);
	b = zeros (n,1);
	
	if(instance == 1) %podpunkt 1
		
		for i=1 : n
			b(i,1) = 4 +0.3*i; %wektor b
			for j=1 : n   		  %macierz A
				if(i == j)
					A(i,j) = 4;
				elseif(i == j-1 || i== j+1)
					A(i,j) = 1;
				else 
					A(i,j) = 0;
				
				end
			end
		end
		
	
	elseif(instance == 2) %podpunkt 2
		
			for i=1 : n
			b(i,1) = 3 +0.5*i; %wektor b
			for j=1 : n   		  %macierz A
				if(i == j)
					A(i,j) = 1/3;
				else 
					A(i,j) = i-j;
				
				end
			end
		end
	
	
	elseif(instance == 3) % podpunkt 3
		
		for i = 1 : n
			b(i,1)  = 4 + 1 / (2*i);
			for j = 1 : n
				A(i,j) = 4 / (9 * (i + j -1));
			end
		end
	
	end
end
