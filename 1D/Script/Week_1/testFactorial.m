function outvalue = testFactorial(invalue)

tmp = round(invalue);
outvalue = 1;
while (tmp>0)
   outvalue = outvalue * tmp;
   tmp = tmp - 1;
end

