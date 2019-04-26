module Main where

import Control.Monad (forM_)
import System.Environment (getArgs)

import Kaprekar (kaprekar)

main :: IO ()
main = do
  args <- getArgs
  if length args < 1
    then putStrLn "number required"
    else
      let n = read (head args)
      in case kaprekar n of
        Right result -> putStrLn $ show result
        Left msg -> putStrLn msg
