-- a -> List a -> Boolean

myElem x xs  = length (filter (\y -> x == y) xs) == 1