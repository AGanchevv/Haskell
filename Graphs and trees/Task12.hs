main :: IO()
main = do

    print charsTree
    print numberBTree
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charsTree :: BTree Char
charsTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))