function[APP, EQs] = wykresy(instance, reps)
%program do rysowania wykresow z zad 2
%reps okresla liczbe powtorzen oraz liczbe rownan

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
		
		eq_count = eq_count + 10;%zwieksza liczbe rownan w kolejnym powtorzeniu

	end
end