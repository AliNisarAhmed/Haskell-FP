harmonic n = sum (take n sumSeries)
  where seriesPairs = zip (cycle [1.0]) [1.0, 2.0..]
        sumSeries = map (\pair -> fst(pair) / snd(pair)) seriesPairs