data Sex = Male | Female

data ABOType = A | B | O | AB
data RhType = Pos | Neg

data BloodType = BloodType ABOType RhType

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABOType :: ABOType -> String
showABOType A = "A"
showABOType B = "B"
showABOType O = "O"
showABOType AB = "AB"

showBloodType :: BloodType -> String
showBloodType (BloodType ab rh) = showABOType ab ++ showRh rh

canDonate2 :: BloodType -> BloodType -> Bool
canDonate2 (BloodType O _) _ = True
canDonate2 _ (BloodType AB _) = True
canDonate2 (BloodType A _) (BloodType A _) = True
canDonate2 (BloodType B _) (BloodType B _) = True
canDonate2 _ _ = False

type MiddleName = String
type LastName = String
type FirstName = String

data Name = Name FirstName LastName 
          | NameWithMiddle FirstName MiddleName LastName

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

name1 = Name "Samrah" "Akber"
name2 = NameWithMiddle "Ali" "Nisar" "Ahmed"

data Patient = 
  Patient { name :: Name 
          , sex :: Sex
          , age :: Int
          , height :: Int
          , weight :: Int
          , bloodType :: BloodType
          }

samrahAkber :: Patient
samrahAkber = 
  Patient { name = Name "Samrah" "Akber"
          , age = 43
          , sex = Female
          , height = 62
          , weight = 115
          , bloodType = BloodType A Pos }