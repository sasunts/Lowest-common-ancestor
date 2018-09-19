module Lib
    ( bTree,lca
    ) where

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

bTree :: Tree char
bTree =
        Node 'A'
            (Node 'B'
                (Node 'D' Empty Empty)
                (Node 'E' Empty Empty)
            )
            (Node 'C'
                (Node 'F' Empty Empty)
                (Node 'G' Empty Empty)
            )
