import Test.Hspec
import Control.Exception (evaluate)

import Kaprekar (kaprekar)

main :: IO ()
main = hspec $ do
  describe "kaprekar" $ do
    it "returns a Left value with an error messsage when given an negative integer" $ do
      kaprekar (-1) `shouldBe` (Left "n must be nonnegative")
    
    it "returns a Left value with an error message when given an integer longer than four digits" $ do
      kaprekar 12345 `shouldBe` (Left "n must be four digits in length or less")

    it "returns a Left value with an error message when given an integer with less than two distinct digits" $ do
      kaprekar 0 `shouldBe` (Left "n must be composed of at least two distinct digits")
      kaprekar 9999 `shouldBe` (Left "n must be composed of at least two distinct digits")

    it "returns a Right value with the number of cycles determined by Kaprekar's routine on a four-digit nonnegative integer" $ do
      kaprekar 1701 `shouldBe` (Right 4)
