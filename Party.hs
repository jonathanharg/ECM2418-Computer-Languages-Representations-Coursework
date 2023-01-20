 -- any imports go here

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `quot` 10) ++ [x `rem` 10]

{-End Question 1.1-}

{-Begin Question 1.2-}
isPar :: Int -> Bool
isPar x = areValidDigits asDigits && isMultiple num1 num2
  where
    asDigits = digits x
    num1 = x `quot` 100 -- first 2 digits as number
    num2 = x `rem` 100 -- second 2 digits as number

areValidDigits :: [Int] -> Bool -- Unique and non-zero
areValidDigits x = 0 `notElem` x && isUnique x

isUnique :: [Int] -> Bool
isUnique [x] = True
isUnique (x : xs) = x `notElem` xs && areValidDigits xs

isMultiple :: Int -> Int -> Bool
isMultiple x y = y `rem` x == 0

pars :: [Int]
pars = filter isPar [1000 .. 9999]

{-End Question 1.2-}

{-Begin Question 1.3-}
isParty :: (Int, Int) -> Bool
isParty (x, y) = isUnique allDigits && isMultiple last x && isMultiple last y
  where
    allDigits = digits x ++ digits y
    last = head (filter (`notElem` allDigits) [1 .. 9])

partys :: [(Int, Int)]
partys = filter isParty (allCombinations pars)

pairWithList :: Int -> [Int] -> [(Int, Int)] -- Pairs a single int with every element in a list
pairWithList x [y] = [(x, y)]
pairWithList x (y : ys) = (x, y) : pairWithList x ys

allCombinations :: [Int] -> [(Int, Int)] -- Pairs every int with every other int, ie. all combinations of ints
allCombinations [x, y] = [(x, y)]
allCombinations (x : xs) = pairWithList x xs ++ allCombinations xs

-- This gives the PARs [(1456,3978),(1734,2958),(1785,2496),(1785,4692),(1836,2754),(1854,3672),(1938,2754)]
-- Only 1785 and 2754 are repeated
-- The answer must therefore be 1785 since its two pairs (2496 & 4692) share the same digits.

{-End Question 1.3-}

-- any main functions for testing goes here
main = putStrLn (show (partys))
