module LcaSpec where

import Lca

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "lcaPrint" $ do
    it "lcaPrint for a tree with nodes 4 & 5 = 2" $
      lcaPrint bTree 4 5 `shouldBe` "2"

    it "lcaPrint error node that doesn't exist" $
        lcaPrint bTree 3 0 `shouldBe` "Error"

    it "lcaPrint empty no tree" $
        lcaPrint emptyTree 3 0 `shouldBe` "Error"
