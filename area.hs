module Reverse where 

area d = pi * (r * r)
  where r = d / 2

thirdLetter :: String -> Char
thirdLetter x = x !! 2

thirdLetterR :: Int -> Char
thirdLetterR x = "AliNisarAhmed" !! x

rvrs :: String -> String
rvrs x = (drop 9 x) ++ " " ++ (drop 6 (take 8 x)) ++ " " ++ (take 5 x)

main :: IO ()
main = print (rvrs "Curry is awesome")