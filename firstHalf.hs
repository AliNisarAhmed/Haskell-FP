-- returns True if an elem is in first half of a list

firstHalf aList el = 
  el `elem` firstHalf
  where midpoint = (length aList) `div` 2
        firstHalf = take midpoint aList