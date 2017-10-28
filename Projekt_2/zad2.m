%Rozwiazywanie ukladu rownan liniowych Ax = b 
%w sensie minimalizacji sumy kwadratow niespelnienia
function[APP_init_qr, APP_qr, APP_init_norm, APP_norm, EQs] = zad2(instance)
	REPS = 9;
    APP_norm= zeros(REPS, 1); %bledy uklado r. noramlnych
	APP_qr = zeros(REPS,1); %bledy metody QR
	APP_init_norm = zeros(REPS,1);
	APP_init_qr = zeros(REPS, 1);
    EQs = zeros(REPS, 1);
	
	k=1;
    n = 10;
	disp('Zadanie 2 podpunkt:'); disp(instance);
	while(k<=REPS)
	tic;
		[A,b]= generate_matrices(instance,n);
		fprintf('\nLiczba rownan:%g',n);
	
		%Rozwiazanie z wykorzystanie uklado rownan noramlnych
		% A'*A*x =A'*b
		x = linsolve(A'*A, A' * b);
		%x = (A' * A)\(A' * b);
		r = (A' * A* x) - (A' * b);%residuum dla ukladu pomocniczego
		residuum = norm(r, 1);
		APP_norm(k, 1) = residuum;
		fprintf('\nMetoda rownan noramlnych:\nBlad rozwiazania(ukl. r. normalnych):%g\n',residuum);
		
		r  = A*x - b; %residuum ukladu poczotkowego
		residuum = norm(r,1);
		APP_init_norm(k,1) = residuum;
		fprintf('Blad rozwiazania ukladu Ax = b : %g\n', residuum);
		
		
		%Rozwiazanie z wykorzystaniem rozkladu QR
		% R'Q'QR*x = R'Q'*b
		[Q,R] = qr(A);
		x = linsolve(R' * Q' * Q * R, R' * Q' * b);
		r=(R'*Q'*b)-(R'*Q'*Q*R)*x; %residuum ukladu pomocniczego
		residuum = norm(r, 1);
		APP_qr(k,1) = residuum;
		fprintf('\nMetoda QR:\nBlad rozwiazania(uklad QR):%g\n', residuum);
		
		r  = A*x - b; %residuum ukladu poczatkowego
		residuum = norm(r,1);
		APP_init_qr(k,1) = residuum;
		fprintf('Blad zozwiazania ukladu Ax=b: %g\n\n', residuum);
		
		toc;
		EQs(k,1) = n;
		n = 2*n;
		k = k+1;
	end
end