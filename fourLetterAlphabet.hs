-- FOUR Letter Alphabet

data FourLetterAlphabet = L1 | L2 | L3 | L4 deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize char = toEnum rotation
  where halfAlphabet = alphabetSize `div` 2
        offset = fromEnum char + halfAlphabet
        rotation = mod offset alphabetSize

-- Finding largest Char number, we add 1 to maxbound
largestCharNumber :: Int
largestCharNumber = fromEnum (maxBound :: Char)

rotChar :: Char -> Char
rotChar charToEncrypt = rotN sizeOfAlphabet charToEncrypt
  where sizeOfAlphabet = 1 + fromEnum (maxBound :: Char)

fourLetterAlphabetEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterAlphabetEncoder vals = map rot4l vals
  where rot4l = rotN alphaSize
        alphaSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)

-- same system for odd numbered alphabet

data ThreeLetterAlphabet = Alpha | Beta | Kappa deriving (Show, Enum, Bounded)

threeLetterMessage :: [ThreeLetterAlphabet]
threeLetterMessage = [Alpha, Kappa, Beta, Kappa, Alpha]

threeLetterEncoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterEncoder vals = map rot3l vals
  where rot3l = rotN alphaSize
        alphaSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)


-- A general decoder for any alphabet size, even or odd
rotNDecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNDecoder n c = toEnum rotation
  where halfN = n `div` 2
        offset = if even n
                 then fromEnum c + halfN
                 else 1 + fromEnum c + halfN
        rotation = offset `mod` n
        
threeLetterDecoder :: [ThreeLetterAlphabet] -> [ThreeLetterAlphabet]
threeLetterDecoder vals = map rot3l vals
  where rot3l = rotNDecoder alphaSize
        alphaSize = 1 + fromEnum (maxBound :: ThreeLetterAlphabet)        


-- General Encoder and Decoder for text Strings

rotEncoder :: String -> String
rotEncoder text = map rotChar text
  where rotChar = rotN alphaSize
        alphaSize = 1 + fromEnum (maxBound :: Char)

rotDecoder :: String -> String
rotDecoder text = map rotCharDecoder text
  where rotCharDecoder = rotNDecoder alphaSize
        alphaSize = 1 + fromEnum (maxBound :: Char)        