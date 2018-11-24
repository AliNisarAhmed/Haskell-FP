module ArithBroken where

  main :: IO ()
  main = do
    print (show (1 + 2))
    putStrLn 10
    print (show (negate -1))
    print (show ((+) 0 blah))
      where blah = negate 1