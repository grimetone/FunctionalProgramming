module Main where
import Data.List
import System.IO
import qualified Data.List

main :: IO ()
main = putStr . showTree $ foldTree "IEOS44434OEE"

data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)

foldTree = foldr treeInsert Leaf

treeInsert :: a -> Tree a -> Tree a

treeInsert x Leaf = Node 0 (Leaf) x (Leaf)
treeInsert x (Node n firstVal val secondVal) | val1 < val2   = Node  n (treeInsert x firstVal) val secondVal | val1 > val2   = Node  n    firstVal val val3 | otherwise = Node (y+1) firstVal val val3  
  where val1  = heightTree firstVal
        val2  = heightTree secondVal
        val3 = treeInsert x secondVal
        y   = heightTree val3
              

heightTree :: Tree a -> Integer
heightTree Leaf = 0
heightTree (Node n firstVal val secondVal) = n

showTree Leaf = ""  
showTree n@(Node i _ _ _) = go i n
  where
  go _ (Leaf) = "" 
  go i (Node _ l c r) = go (i-1) l ++ 
    replicate (4*fromIntegral i) ' ' ++ show c ++ "\n" ++ go (i-1) r 