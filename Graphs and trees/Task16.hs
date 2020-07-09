main :: IO()
main = do

    print $ mirrorTree numberBTree -- Node 5 (Node 4 (Node 5 (Node 21 Null Null) Null) (Node 2 Null Null)) (Node 12 (Node 0 Null Null) (Node 1 Null (Node 96 Null Null)))
    print $ mirrorTree charBTree -- Node 'k' (Node 'l' (Node 'l' Null Null) (Node 'e' Null Null)) (Node 'a' (Node 's' Null Null) (Node 'h' Null Null))
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil))) 

mirrorTree :: BTree a -> BTree a
mirrorTree Nil = Nil
mirrorTree (Node value left rigth) = Node value (mirrorTree rigth) (mirrorTree left)