import Data.List(nub)

main :: IO()
main = do

    print $ onlyLeaves [(1, 2, 3), (2, 4, 5)] -- [3, 4, 5]
    print $ listLeaves [(1, 2, 3), (2, 4, 5)] -- [4, 3, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] -- [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] -- [2, 4, 6, 9]
    return()

type Root = Int 
type Leaf = Int
type BTree = [(Root, Leaf, Leaf)]

listLeaves :: BTree -> [Leaf]
listLeaves btree =  [x | x <- nub $ onlyLeaves btree, not $ isFather btree x]

onlyLeaves :: BTree -> [Leaf]
onlyLeaves []                  = []
onlyLeaves ((x1, y1, z1) : xs) = x1 : y1 : z1 : onlyLeaves xs

isFather :: BTree -> Leaf -> Bool
isFather btree x = elem x [father | (father, _, _) <- btree]