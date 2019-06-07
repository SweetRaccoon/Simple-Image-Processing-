load('expdecaycos_1.mat')
plot(t,Smeas,'-bx')


% Step 2: Make an initial guess
S0 = 11.2;
T = 2.5;
freq = 2;
x0 =[ S0, T, freq];
S = Smode(x0, t);

% Plot them together,
plot( t, Smeas, '-bx', t, S, '-rx')
legend('Smeas', 'Smodel')

Sresidual = S - Smeas;

plot( t, Smeas, '-bx', t, S, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Smodel','Sresidual')

% Ccalculate cost
cost =  sum(Sresidual.^2);
fprintf('Cost = %f\n', cost)

fcost = @(x)costSmode(x, t, Smeas);
[x,fval] = fminunc(fcost,x0);

Sfit = Smode(x,t);
Sresidual = Sfit - Smeas;
plot( t, Smeas, '-bx', t, Sfit, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Sfit','Sresidual')

fprintf('Solution: S0=%f, T=%f, freq=%f\n', x(1), x(2), x(3));
