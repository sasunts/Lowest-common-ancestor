module LcaSpec where

import Lca
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Lowest Common Ancestor Tests" $ do
    it "lcaPrint for a tree with nodes 4 & 5 = 2" $
      lcaPrint bTree 4 5 `shouldBe` "2"

    it "lcaPrint error node that doesn't exist" $
        lcaPrint bTree 8 0 `shouldBe` "Error"

    it "lcaPrint empty no tree" $
        lcaPrint emptyTree 3 1 `shouldBe` "Error"

    it "lcaPrint for a tree with nodes 2 & 3 = 1" $
        lcaPrint bTree 2 3 `shouldBe` "1"

    it "lca with a real tree and nodes" $
        lca bTree 4 5 `shouldBe` Right 2

    it "lca with nodes that don't exist" $
        lca bTree 0 8 `shouldBe` Left False

--TODO:fix code to make this work
    -- it "lcaPrint error wrong type of nodes " $
    --     lcaPrint bTree "c" "d" `shouldBe` "Error"
