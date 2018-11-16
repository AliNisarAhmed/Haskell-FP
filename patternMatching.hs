sayAmount 1 = "one"
sayAmount 2 = "two"
sayAmount n = "a bunch"

myHead (x: xs) = x

myTail (x: xs) = xs
myTail [] = []

take3 (x: y: z: xs) = [x, y, z]