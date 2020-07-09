import Data.Char

main :: IO()
main = do

    print $ mapTree numberBTree (*2) -- Node 10 (Node 24 (Node 2 (Node 192 Null Null) Null) (Node 0 Null Null)) (Node 8 (Node 4 Null Null) (Node 10 Null (Node 42 Null Null)))
    print $ mapTree charBTree (toUpper) -- Node 'K' (Node 'A' (Node 'H' Null Null) (Node 'S' Null Null)) (Node 'L' (Node 'E' Null Null) (Node 'L' Null Null))
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil))) 

mapTree :: BTree a -> (a -> b) -> BTree b
mapTree Nil _ = Nil
mapTree (Node value left rigth) function = Node (function value) (mapTree left function) (mapTree rigth function)