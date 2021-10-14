module Main where

import Control.Monad (forM_)
import System.Environment (getArgs)

import Kaprekar (kaprekar)

main :: IO ()
main = do
  firstArg <- headMaybe <$> getArgs
  case firstArg of
    Nothing -> putStrLn "number required"
    Just arg -> case kaprekar (read arg) of
      Right result -> print result
      Left msg -> putStrLn msg

headMaybe :: [a] -> Maybe a
headMaybe [] = Nothing
headMaybe (x:_) = Just x