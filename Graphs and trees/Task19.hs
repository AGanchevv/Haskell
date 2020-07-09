main :: IO()
main = do

    print $ Node 5 [Nil]
    print $ numberTree
    print $ size numberTree
    return ()

data NTree a = Nil | Node a [NTree a]
   deriving(Show)

numberTree :: NTree Int 
numberTree = Node 5 [Node 12 [Node 1 [Nil], Node 96 [Nil], Node 0 [Nil]], Node 5 [Nil], Node 4 [Node 2 [Nil], Node 21 [Nil]]]

size :: NTree a -> Int
size Nil = 0
size (Node _ successors) = 1 + (sum $  map (size) successors)