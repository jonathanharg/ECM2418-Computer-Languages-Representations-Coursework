import Data.List (permutations)

-- any imports go here

{-Begin Question 2.1-}
number :: [Int] -> Int
number [x] = x
number (x : y : ys) = number (10 * x + y : ys)

{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [a] -> [([a], [a])]
splits = nextSplits []

nextSplits :: [a] -> [a] -> [([a], [a])]
nextSplits x [y, z] = [(x ++ [y], [z])]
nextSplits xs (y : ys) = (xs ++ [y], ys) : nextSplits (xs ++ [y]) ys

possibles :: [([Int], [Int])]
possibles = concat (map splits (permutations [1 .. 9]))

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int], [Int]) -> Bool
isAcceptable (x, y) = smallestLastThree x y && (head product == 4) && isPalindrome product
  where
    product = digits (number x * number y)

smallestLastThree :: [Int] -> [Int] -> Bool
smallestLastThree x y
  | number x > number y = last y == 3
  | number x < number y = last x == 3

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome (x : xs)
  | x /= last xs = False
  | otherwise = isPalindrome (init xs)

digits :: Int -> [Int]
digits 0 = []
digits x = digits (x `quot` 10) ++ [x `rem` 10]

acceptables :: [([Int], [Int])]
acceptables = filter isAcceptable possibles

-- Therefore the solution is 40699604 = 23 x 1769548

{-End Question 2.3-}

-- any main functions for testing goes here
main = putStrLn (show (acceptables))