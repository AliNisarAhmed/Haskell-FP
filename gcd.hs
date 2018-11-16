myGcd a b = 
  if a `mod` b == 0
  then b
  else myGcd b (a `mod` b)

myGcdPattern x 0 = x
myGcdPattern a b = myGcdPattern b (mod a b)