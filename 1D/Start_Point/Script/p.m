t = 0:.1:10;

% STep 1: Synhesize measured datat
S0 = 4;
T = pi;
noiseval = 1;
Smeas = (S0 .* exp(-t./T)) + randn(size(t)).*noiseval;

plot(t,Smeas,'-bx')


% Step 2: Make an initial guess
S0 = 10;
T = 2;
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





