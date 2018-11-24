half :: Int -> Int
half n = div n 2

printDouble :: Int -> String
printDouble x = show (x * 2)

myFoldl :: (a -> b -> a) -> a -> [b] -> a
head :: [a] -> a
tail :: [a] -> [a]