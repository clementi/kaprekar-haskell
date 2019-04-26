module Main where

import Control.Monad (forM_)

import Kaprekar (kaprekar)

numbers = [ 8
          , 17
          , 945
          , 6174
          , 1701
          , 12
          , 37
          , 351
          , 9802
          , 9988
          , 1
          ]

main :: IO ()
main = forM_ numbers $ putStrLn . show . kaprekar
