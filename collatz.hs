collatz 1 = 1
collatz n = 
  if even n
  then 1 + collatz (div n 2)
  else 1 + collatz (3 * n + 1)  -- This path is not converging, but still this recursive algo works, nobody can prove if collatz sequence terminates for every number