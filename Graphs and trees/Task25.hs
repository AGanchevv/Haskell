import Data.List

main :: IO()
main = do

    print $ isSymmetric t3 -- False
    print $ isSymmetric t4 -- True
    print $ isSymmetric t5 -- True
    return()

data BTree = Empty | Node Int BTree BTree
   deriving(Show, Eq)

t3 :: BTree 
t3 = Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)

t4 :: BTree
t4 = Node 1 (Node 2 (Node 3 Empty Empty) Empty) (Node 2 Empty (Node 3 Empty Empty))

t5 :: BTree 
t5 = Node 1 (Node 2 (Node 3 Empty Empty) (Node 7 (Node 5 Empty Empty) Empty)) (Node 2 (Node 7 Empty (Node 5 Empty Empty)) (Node 3 Empty Empty))

isSymmetric :: BTree -> Bool
isSymmetric Empty = True
isSymmetric tree@(Node value left rigth) = if length (nub $ children tree 1) == 1 then compareChildren left rigth else False

children :: BTree -> Int -> [Int]
children Empty _ = []
children (Node value left rigth) level
   | level == 0 = [value]
   | otherwise = children left (level - 1) ++ children rigth (level - 1)

compareChildren :: BTree -> BTree -> Bool
compareChildren Empty Empty = True
compareChildren tree@(Node value Empty Empty) tree1@(Node value1 Empty Empty) = if value == value1 then True else False
compareChildren tree@(Node value left rigth) tree1@(Node value1 left1 rigth1) = if (sort $children tree 1) == (sort $children tree1 1) then (if left == left1 then compareChildren left left1 && compareChildren rigth rigth1 else compareChildren left rigth1 && compareChildren rigth left1)
                                                                     else False