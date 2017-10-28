%Program wykouje polecenie 2 zadania

function[APP, EQs] = zad_2(instance, reps)
%reps okresla liczbe powtorzen oraz liczbe rownan
%UWAGA! dla reps > 8 czas wykonania powyzej 15min

	EQs = zeros(reps, 1); %ilosc rownan
	APP = zeros(reps, 1); %bledy rozwiazan

	eq_count = 10; %ilosc rownan w pojedynczym powtorzeniu eq_count(0) = 10

	for i = 1 : reps
		
		[A,b] = generate_matrices(instance, eq_count); 
		fprintf('Ilosc rownan : %g\n', eq_count);
		x = gauss_pivoting(A,b); %rozwiazuje ukald eq_count rownan 
		
		%blad jako norma residuum
		residuum = A * x - b;
		approx = norm(residuum, 1);
		fprintf('Blad rozwiazania:  %g\n', approx);
		
		APP(i,1) = approx;
		EQs(i,1) = eq_count;
        
        disp('x = ');
        disp(x);
		
		if(eq_count == 10) %iteracyjne poprawianie wyniku dla 10 rownan
			k = 4; %max ilosc iteracji ktora poprawia wynik (dla k>4 nie ma porawy)
			for j = 1 : k
				
				if( j~=1 )
					residuum = A*x -b;
				end
				
				d = inv(A) * residuum;
				x = x-d;
				
				%disp('x = ');
				%disp(x);
				
				approx = norm(residuum,1);
				fprintf('Blad po %g poprawkach: %g\n', j, approx);
			end
		end
		eq_count = eq_count * 2;%zwieksza liczbe rownan w kolejnym powtorzeniu

	end
end