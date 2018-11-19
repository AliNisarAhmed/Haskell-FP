myReverse [] = []
myReverse [a] = [a]
myReverse (first:rest) = myReverse(rest) ++ [first]