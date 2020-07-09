main :: IO()
main = do

    print $ rangedSum firstTree 100 50 -- 0 (L = 100, R = 50)
    print $ rangedSum firstTree 7 15 -- 32 (L = 7, R = 15)
    print $ rangedSum secondTree 6 10 -- 23 (L = 6, R = 10)
    print $ rangedSum secondTree 10 6 -- 23 (L = 10, R = 6)
    print $ rangedSum firstTree 15 7 -- 32 (L = 15, R = 7)
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show, Eq)

insert :: (Num a, Ord a) => BTree a -> a -> BTree a
insert Nil elem = Node elem Nil Nil
insert (Node value left rigth) elem = if elem > value then Node value left (insert rigth elem) else Node value (insert left elem) rigth

firstTree :: (Num a, Ord a) => BTree a
firstTree = foldl (insert) Nil [10, 5, 3, 7, 15, 18]

secondTree :: (Num a, Ord a) => BTree a
secondTree = foldl (insert) Nil [10, 5, 3, 1, 7, 6, 15, 13, 18]

rangedSum :: (Ord a, Num a) => BTree a -> a -> a -> a
rangedSum Nil _ _ = 0
rangedSum tree@(Node value left rigth) leftValue rigthValue
   | value >= leftValue && value <= rigthValue = value + (rangedSum left leftValue rigthValue) + (rangedSum rigth leftValue rigthValue)
   | leftValue >= rigthValue = rangedSum tree rigthValue leftValue
   | otherwise = (rangedSum left leftValue rigthValue) + (rangedSum rigth leftValue rigthValue)