finiteCycle (first:rest) = first:rest ++ [first]

myCycle (first: rest) = first : myCycle (rest++[first])