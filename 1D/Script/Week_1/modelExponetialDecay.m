function S = modelExponetialDecay(x, t)

S0 = x(1);
T =x(2);

S = (S0*exp(-t/T));