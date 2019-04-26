module Kaprekar
  ( kaprekar
  ) where

import Data.List (nub, sort)

kaprekar :: Int -> Either String Int
kaprekar 6174 = Right 0
kaprekar n
  | n < 0 = Left "n must be nonnegative"
  | length (nub digits) < 2 = Left "n must be composed of at least two distinct digits"
  | length digits > 4 = Left "n must be four digits in length or less"
  | otherwise = (+1) <$> kaprekar diff
  where digits = digits4 n
        diff = high (digits) - low (digits)

digits4 :: Int -> [Int]
digits4 n = take (4 - length ds) (repeat 0) ++ ds
  where ds = digits n
        digits m
          | m >= 0 && m < 10 = [m]
          | otherwise = m `mod` 10 : digits (m `div` 10)

digits2int :: [Int] -> Int
digits2int [] = 0
digits2int [d] = d
digits2int (d:ds) = d * 10^(length ds) + digits2int ds

high :: [Int] -> Int
high = digits2int . reverse . sort

low :: [Int] -> Int
low = digits2int . sort
