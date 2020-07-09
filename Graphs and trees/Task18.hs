main :: IO()
main = do
       
    print $ getAtk numberBTree 2 -- [1,0,2,5]
    print $ grandchildrenIncreased numberBTree -- False
    print $ grandchildrenIncreased $ Node 5 (Node 12 (Node 6 (Node 13 Nil Nil) Nil) (Node 7 Nil Nil)) (Node 4 (Node 8 Nil Nil) (Node 10 Nil (Node 21 Nil Nil))) -- True
    return ()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil))) 

grandchildrenIncreased :: (Num a, Ord a) => BTree a -> Bool
grandchildrenIncreased Nil = True
grandchildrenIncreased tree@(Node grandfather left right)
 | hasGrandchildren tree = null (filter (\x -> x < grandfather + 1)  (getAtk tree 2))  && grandchildrenIncreased left && grandchildrenIncreased right
 | otherwise = True

hasGrandchildren :: BTree a -> Bool
hasGrandchildren Nil = False
hasGrandchildren tree = length (getAtk tree 2) /= 0

getAtk :: BTree a -> Int -> [a]
getAtk Nil _ = []
getAtk (Node value left rigth) level
   | level == 0  = [value]
   | otherwise = getAtk left (level - 1) ++ getAtk rigth (level - 1)