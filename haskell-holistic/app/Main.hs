module Main where
import Data.List
import System.IO
import Data.IORef
import qualified Data.List

data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)


main :: IO ()
main = do
 console

console :: IO ()
console = do
  putStrLn "\nAvailable options:"
  putStrLn "  (1) List items"
  putStrLn "  (2) Insert item"
  putStrLn "  (3) Show tree"
  let muhList = [4,8,15,16,23,42]      
  line <- getLine
  let cmd = (read line :: Int)
  case cmd of
     1 -> do
      makeList
     2 -> do
      putStrLn "This function not ready"
     3 -> do
      makeList
     _ -> do
      putStrLn "Whoops, wrong number!"

buildList :: [String] -> IO ()
buildList arr = do
    putStr "Enter a char or enter nothing to create the tree"
    string <- getLine
    if string == "" then
        putStr . showTree $ foldTree arr
    else do
        let newarr = arr++[string]
        putStrLn ("LIST[] -> " ++ show newarr)
        buildList newarr

makeList :: IO ()
makeList = do
    buildList []

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

