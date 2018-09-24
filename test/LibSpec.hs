module LibSpec (spec) where

import           Lib
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = do
  describe "lca Function" $ do

--TODO: Add more tests for tree with 1 node, empty tree, both nodes being the same
            it "Nodes are Empty" $ do
                (lcaPrint 3 5 ) `shouldBe` "Error"

            it "Nodes 2 and 3 are linked via node 1" $ do
                (lcaPrint bTree 2 3) `shouldBe` "1"

            it "Nodes 8 and 0 do not exist"
                (lcaPrint bTree 8 0) `shouldBe` "Error"
