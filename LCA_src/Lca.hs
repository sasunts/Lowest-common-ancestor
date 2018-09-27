module Lca
    ( bTree,lca, lcaPrint,
    ) where

--data type declared
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

--binary tree structure
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

--lowest common ancestor function from online source
lca :: Eq a => Tree a -> a -> a -> Either Bool a
lca Empty _ _ = Left False
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

--lca print function with error checking. main lca function is this one
lcaPrint :: (Eq a, Show a) => Tree a -> a -> a -> String
lcaPrint t x y =  result
    where result = case lca t x y of
                    Right a -> show a
                    _ -> "0"