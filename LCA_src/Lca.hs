module Lca
    ( bTree,lca, lcaPrint, emptyTree
    ) where

import Control.Error
--Tree's structure
--TODO: New data structure for DAG
--Structure I want where nodes are chars and are linked by numbers relation
--Below node a is connected to b, c and e etc.
-- [Node "a" [1,2,4], Node "b" [3], Node "c" [3,4], Node "d" [], Node "e" []]
{-
data Zero
data Succ n

data Fin n where
    Fin0 :: Fin (Succ n)
    FinS :: Fin n -> Fin (Succ n)

data Node a n where
      Node :: a -> [Fin n] -> Node a n
      deriving (Eq,Show)

data Vec f n where
      Empty :: Vec f Zero
      (:::) :: f n -> Vec f n -> Vec f (Succ n)
      infixr 5 :::

type DAG a = Vec (Node a)

instance (forall m. Eq (f m)) => Eq (Vec f n)

class Eq1 f where
    eq1 :: f n -> f n -> Bool

instance Eq1 f => Eq (Vec f n) where
      Empty == Empty = True
      (x ::: xs) == (y ::: ys) = eq1 x y && xs == ys

      instance Eq a => Eq1 (Node a) where
          eq1 = (==)
      instance Eq1 Fin where
          eq1 = (==)
      instance Eq1 f => Eq1 (Vec f) where
          eq1 = (==)

      -- ghc can't derive this
      instance Eq (Fin n) where
          Fin0   == Fin0   = True
          FinS i == FinS j = i == j
          _      == _      = False

class Show1 a where
  showsPrec1 :: Int -> a n -> ShowS
-}

--data Tree a = TNode a [Tree a]  deriving Show

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

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
