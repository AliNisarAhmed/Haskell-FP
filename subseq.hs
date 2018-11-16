subseq start end aList = headed
  where tailed = reverse ( drop end (reverse aList))
        headed = drop start tailed