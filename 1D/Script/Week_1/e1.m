load('expdecay_2.mat')
plot(t,Smeas,'-bx')


% Step 2: Make an initial guess
S0 = 11.2;
T = 2.5;
x0 =[ S0, T];
S = modelExponetialDecay(x0, t);

% Plot them together,
plot( t, Smeas, '-bx', t, S, '-rx')
legend('Smeas', 'Smodel')

Sresidual = S - Smeas;

plot( t, Smeas, '-bx', t, S, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Smodel','Sresidual')

% Ccalculate cost
cost =  sum(Sresidual.^2);
fprintf('Cost = %f\n', cost)

fcost = @(x)costFunctionExponetialDecay(x, t, Smeas);
[x,fval] = fminunc(fcost,x0);

Sfit = modelExponetialDecay(x,t);
Sresidual = Sfit - Smeas;
plot( t, Smeas, '-bx', t, Sfit, '-rx',t, Sresidual, '-kx')
legend('Smeas', 'Sfit','Sresidual')

fprintf('Solution: S0=%f, T=%f\n', x(1), x(2));
