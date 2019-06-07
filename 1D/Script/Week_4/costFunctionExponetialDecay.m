function cost = costFunctionExponetialDecay(x, t, Smeas)

S0A = abs(x(1));
S0B = abs(x(2));
TA =x(3);
TB =x(4);

Smodel_A = (S0A*exp(-t/TA));
Smodel_B = (S0B*exp(-t/TB));
Smodel = Smodel_A + Smodel_B;
Sresidual = Smodel - Smeas;

lambda = 10;
cost =  sum(Sresidual.^2) + lambda*((S0A+S0B)/(S0A-S0B));

