main :: IO()
main = do

    print $ size numberBTree -- 9
    print $ size charBTree -- 7
    print $ height numberBTree -- 4
    print $ height charBTree -- 3
    print $ sumTree numberBTree -- 146
    --print $ sumTree charBTree -- should not work
    print $ average numberBTree -- 16.22
    --print $ average charBTree -- should not work
    print $ sumLeaves numberBTree -- 119
    --print $ sumLeaves charBTree -- shouldn't work
    print $ inorder numberBTree -- [96, 1, 12, 0, 5, 2, 4, 5, 21]
    print $ inorder charBTree -- "haskell"
    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil Nil))) -- False
    print $ areEqual charBTree charBTree -- True
    print $ areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 8 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))) -- False
    return()

data BTree a = Nil | Node a (BTree a) (BTree a)
   deriving(Show)

charBTree :: BTree Char
charBTree =  Node 'k' (Node 'a' (Node 'h' Nil Nil) (Node 's' Nil Nil)) (Node 'l' (Node 'e' Nil Nil) (Node 'l' Nil Nil))

numberBTree :: (Num a) => BTree a
numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Nil Nil) Nil) (Node 0 Nil Nil)) (Node 4 (Node 2 Nil Nil) (Node 5 Nil (Node 21 Nil Nil)))

size :: BTree a -> Int
size Nil = 0
size (Node _ left rigth) = 1 + size left + size rigth

height :: BTree a -> Int
height Nil = 0
height (Node _ left rigth) = max (1 + height left) (1 +height rigth)

sumTree :: (Num a) => BTree a -> a
sumTree Nil = 0
sumTree (Node current left rigth) = current + sumTree left + sumTree rigth

average :: (Fractional a) => BTree a -> a
average tree = sumTree tree / fromIntegral (size tree)

sumLeaves :: (Num a) => BTree a -> a
sumLeaves Nil = 0
sumLeaves (Node value Nil Nil) = value
sumLeaves (Node _ left rigth) = sumLeaves left + sumLeaves rigth

inorder :: BTree a -> [a]
inorder Nil = []
inorder (Node value left rigth) = inorder left ++ (value : inorder rigth)

areEqual :: (Eq a) => BTree a -> BTree a -> Bool
areEqual Nil Nil = True
areEqual (Node valueLhs leftLhs rightLhs) (Node valueRhs leftRhs rightRhs) = if valueLhs == valueRhs then areEqual leftLhs leftRhs && areEqual rightLhs rightRhs else False
areEqual _ _ = False