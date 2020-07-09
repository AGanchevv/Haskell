import Data.List

main :: IO()
main = do

    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)] -- [1, 2, 3, 4]
    print $ neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 2 -- [3, 4]
    print $ neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 4 -- []
    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] -- [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])]

    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] -- True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] -- False
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] -- True
    print $ isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] -- False
    return()

nodes :: [(Int, Int)] -> [Int]
nodes xs = nub $ fst x ++ snd x
   where
       x = unzip xs

neighbours :: [(Int, Int)] -> Int -> [Int]
neighbours xs node = [y | (x, y) <- xs, x == node]    

adjacencyList :: [(Int, Int)] -> [(Int, [Int])]
adjacencyList xs = map (\x -> (x, neighbours xs x)) (nodes xs) -- [ (x, neighbours xs x) | x <- nodes xs]

isPath :: [(Int, [Int])] -> [Int] -> Bool
isPath graph (x : xs) = if not (elem x (nodes graph)) then False
                        else helper xs x
   where
       nodes xs = nub [x | (x, _) <- xs]
       helper [] _                   = True
       helper (x : xs) currentFather = elem x (successors graph currentFather) && helper xs x

       successors [] _ = []
       successors ((father, children):ys) x
         | father == x = children
         | otherwise = successors ys x