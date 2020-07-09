main :: IO()
main = do

    print $ getLevel numberBTree 2 -- [1, 0, 2, 5]
    print $ getLevel charBTree 1 -- "al"
    print $ getLevel charBTree 3 -- should not work
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))

getLevel :: BTree a -> Int -> [a]
getLevel Nil _   = []
getLevel (Node value left rigth) level
   | level < 0  = error "Not existing level"
   | level == 0 = [value]
   | otherwise  = getLevel left (level - 1) ++ getLevel rigth (level - 1) 