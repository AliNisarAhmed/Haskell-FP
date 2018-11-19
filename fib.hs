fib _ _ 0 = 0
fib _ _ 1 = 1
fib _ _ 2 = 1
fib x y 3 = x + y
fib x y c = fib (x + y) x (c - 1)