xorBool :: Bool -> Bool -> Bool
xorBool v1 v2 = v1 || v2 && (not (v1 && v2))

xorPair :: (Bool, Bool) -> Bool
xorPair (v1, v2) = xorBool v1 v2

xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPair (zip list1 list2)

type Bits = [Bool]

intToBits' :: Int -> Bits
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = 
  if (remainder == 0)
  then False : intToBits' nextVal
  else True : intToBits' nextVal
  where remainder = mod n 2
        nextVal = div n 2

-- we need to reverse the output of the above array, and "False" pad the output array to make em all of the same size

maxBits :: Int
maxBits = length (intToBits' maxBound)

intoBits :: Int -> Bits
intoBits n = leadingFalseValues ++ reversedBits
    where reversedBits = reverse (intToBits' n)
          missingBits = maxBits - (length reversedBits)
          leadingFalseValues = take missingBits (cycle [False]) 

-- COnverting single char to bit

charToBits :: Char -> Bits
charToBits char = intoBits (fromEnum char)

bitsToChar :: Bits -> Char
bitsToChar bits = toEnum (bitsToInts bits)

-- making a decoder e.g from Bits to Ints

bitsToInts :: Bits -> Int
bitsToInts bits = 
  sum (map (\x -> 2^(snd x)) trueLocations)
  where size = length bits
        indices = [ size-1, size-2 .. 0 ]
        trueLocations = filter (\x -> fst x == True) (zip bits indices)

-- IMPLEMENTING ONE-TIME PAD

myPad :: String
myPad = "Shhhhhh"

myPlainText :: String
myPlainText = "Haskell"

applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext = 
  map (\pair -> (fst pair) `xor` (snd pair)) (zip padBits plaintextBits)
  where padBits = map charToBits pad
        plaintextBits = map charToBits plaintext

-- the above gives a list of bits, we need to convert to String

applyOTP :: String -> String -> String
applyOTP pad plaintext = 
  map bitsToChar bitList
  where bitList = applyOTP' pad plaintext

-- encoder / decoder for OTP is just partially applied the above OTP constructor

encoderDecoder :: String -> String
encoderDecoder = applyOTP myPad

-- CIPHER Class

class Cipher a where
  encode :: a -> String -> String
  decode :: a -> String -> String

data OneTimePad = OTP String

instance Cipher OneTimePad where
  encode (OTP pad) text = applyOTP pad text
  decode (OTP pad) text = applyOTP pad text

myOTP :: OneTimePad
myOTP = OTP (cycle [minBound .. maxBound])
