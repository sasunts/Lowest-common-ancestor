module LibSpec (spec) where

import           Lib
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = do
  describe "lca Function" $ do

--TODO: Add more tests for tree with 1 node, empty tree, both nodes being the same
        it "Nodes are Empty" $ do
            (lca Empty _ _ ) `shouldBe` Nothing

         it "Nodes B and C are linked via node A" $ do
             (lca 2 3) `shouldBe` 1
