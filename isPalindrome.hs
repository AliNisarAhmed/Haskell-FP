isPalindrome x = 
  processedText == reverse processedText
  where filtered = filter (/= ' ') x
        processedText = map toLower noSpaces
