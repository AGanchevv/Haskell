main :: IO()
main = do

    print $ convert tree -- (Node 30 (Node 36 (Node 36 Nil Nil) (Node 35 Nil (Node 33 Nil Nil))) (Node 21 (Node 26 Nil Nil) (Node 15 Nil (Node 8 Nil Nil))))
    return ()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show, Eq)

insert :: (Ord a) => BTree a -> a -> BTree a
insert Nil value = Node value Nil Nil
insert (Node value left rigth) elem = if elem > value then Node value left (insert rigth elem) else Node value (insert left elem) rigth

tree :: BTree Int
tree = foldl (insert) Nil [4, 1, 0, 2, 3, 6, 5, 7, 8]

getSum :: (Ord a, Num a) => BTree a -> a -> a
getSum Nil _ = 0
getSum (Node value left rigth) elem
   | value >= elem = value + (getSum left elem) + (getSum rigth elem)
   | otherwise = (getSum left elem) + (getSum rigth elem)

convert :: (Ord a, Num a) => BTree a -> BTree a
convert tree = helper tree
   where
       helper Nil = Nil
       helper (Node value left rigth) = Node (getSum tree value) (helper left) (helper rigth)