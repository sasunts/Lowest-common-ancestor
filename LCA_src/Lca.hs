{-# LANGUAGE GADTs #-}
module Lca
    ( bTree,lca, lcaPrint, emptyTree
    ) where

data Zero
data Succ n

data Fin n where
      Fin0 :: Fin (Succ n)
      FinS :: Fin n -> Fin (Succ n)

data DAGNode a n where
      DAGNode :: a -> [Fin n] -> DAGNode a n
  --deriving (Eq,Show)

data Vec f n where
      E :: Vec f Zero
      (:::) :: f n -> Vec f n -> Vec f (Succ n)
infixr 5 :::

type DAG a = Vec (DAGNode a)
data DAGTree a = TNode a [DAGTree a]  deriving Show

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

-- Convert a DAG to a tree, using the given node index as root
toTree :: Fin n -> DAG a n -> DAGTree a
toTree Fin0 (DAGNode x cs ::: ns) = TNode x [toTree c ns | c <- cs]
toTree (FinS i) (_ ::: ns) = toTree i ns -- drop the head until we reach the root

toTree' :: DAG a (Succ n) -> DAGTree a
toTree' = toTree Fin0

dagTree = DAGNode 1 [Fin0,FinS Fin0,FinS Fin0,FinS (FinS (FinS (Fin0)))]
      ::: DAGNode 2 [FinS Fin0,FinS Fin0]
      ::: DAGNode 3 [Fin0,FinS Fin0]
      ::: DAGNode 4 []
      ::: DAGNode 5 []
      ::: E

--empty tree
emptyTree :: Tree Int
emptyTree = Empty

--tree with 3 levels
bTree :: Tree Int
bTree =
        Node 1
            (Node 2
                (Node 4 Empty Empty)
                (Node 5 Empty Empty)
            )
            (Node 3
                (Node 6 Empty Empty)
                (Node 7 Empty Empty)
            )


--TODO: New function for LCA to work on DAG also
--function to find lca
lca :: Eq a => Tree a -> a -> a -> Either Bool a
lca Empty _ _ = Left False
lca tree x y
    | x == y = Right x
lca (Node v tl tr) x y =
    let l = lca tl x y
        r = lca tr x y
        onroot = v == x || v == y
    in case (l, r, onroot) of
        (Right a  , _         , _    ) -> Right a
        (_        , Right a   , _    ) -> Right a
        (Left True, Left True , _    ) -> Right v
        (Left True, _         , True ) -> Right v
        (_        , Left True , True ) -> Right v
        (Left True, _         , False) -> Left True
        (_         , Left True, False) -> Left True
        (_         , _        , True ) -> Left True
        _ -> Left False

--function to print lca
lcaPrint :: (Eq a, Show a) => Tree a -> a -> a -> String
lcaPrint t x y =  result
    where result = case lca t x y of
                    Right a -> show a
                    _ -> "Error"
