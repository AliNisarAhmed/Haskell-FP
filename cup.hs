bottle ltr = \message -> message ltr

smallBottle = bottle 6
bigBottle = bottle 12

getLtr aBottle = aBottle (\ltr -> ltr)

drink aBottle ltrDrank = 
  if diff >= 0
  then bottle diff
  else bottle 0
  where ltr = getLtr aBottle
        diff = ltr - ltrDrank

isEmpty bottle = getLtr bottle == 0