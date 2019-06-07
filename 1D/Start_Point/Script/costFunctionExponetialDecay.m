function cost = costFunctionExponetialDecay(x, t, Smeas)

S0 = x(1);
T =x(2);

Smodel = (S0*exp(-t/T));
Sresidual = Smodel - Smeas;
cost =  sum(Sresidual.^2);


