module LcaSpec where

import Lca
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Lowest Common Ancestor Tests" $ do
    it "lcaPrint nodes of 1 level" $
      lcaPrint bTree 2 3 `shouldBe` "1"

    it "lcaPrint same nodes" $
        lcaPrint bTree 2 2 `shouldBe` "2"

    it "lcaPrint nodes of 2 levels" $
        lcaPrint bTree 5 4 `shouldBe` "2"

    it "lcaPrint nodes of 2 levels" $
        lcaPrint bTree 6 7 `shouldBe` "3"

    it "lcaPrint nodes of different levels" $
        lcaPrint bTree 1 7 `shouldBe` "1"

    it "lcaPrint nodes of different level nodes" $
        lcaPrint bTree 5 7 `shouldBe` "1"

    it "lcaPrint error node that doesn't exist" $
        lcaPrint bTree 8 0 `shouldBe` "Error"

    it "lcaPrint empty tree" $
        lcaPrint emptyTree 3 1 `shouldBe` "Error"

    it "lca with a real tree and nodes 1 level" $
        lca bTree 2 3 `shouldBe` Right 1

    it "lca with a real tree and nodes 2 levels" $
        lca bTree 4 5 `shouldBe` Right 2

    it "lca with a real tree and nodes 2 levels" $
        lca bTree 6 7 `shouldBe` Right 3

    it "lca with a real tree and nodes of different nodes" $
        lca bTree 1 7 `shouldBe` Right 1

    it "lca with a real tree and nodes of different nodes" $
        lca bTree 5 7 `shouldBe` Right 1

    it "lca with nodes that don't exist" $
        lca bTree 0 8 `shouldBe` Left False

    it "lca with Empty tree" $
        lca emptyTree 0 1 `shouldBe` Left False

--TODO:fix code to make this work
    -- it "lcaPrint error wrong type of nodes " $
    --     lcaPrint bTree "c" "d" `shouldBe` "Error"
