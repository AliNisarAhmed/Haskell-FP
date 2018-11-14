ifEven f x =
  if even x
  then f x
  else x

inc x = x + 1
double x = x * 2

incIfEven = ifEven inc
ifEvenDbl = ifEven double

binaryPartialApplication f x = (\y -> f x y)

sumBinary x y = x + y

sum2 = binaryPartialApplication sumBinary 2