module LcaSpec where

import Lca

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "lcaPrint" $ do
    it "lca print for a tree with nodes" $
      lcaPrint bTree 4 5 `shouldBe` "2"
