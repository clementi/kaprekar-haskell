module Main where

import Control.Monad (forM_)
import System.Environment (getArgs)

import Kaprekar (kaprekar)

main :: IO ()
main = do
  args <- getArgs
  if null args
    then putStrLn "number required"
    else
      let n = read (head args)
      in case kaprekar n of
        Right result -> print result
        Left msg -> putStrLn msg
