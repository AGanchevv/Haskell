main :: IO()
main = do

    print $ (findUncles t 5) -- [3,4]
    print $ (findUncles t 7) -- [2,4]
    print $ (findUncles t 10) -- [5] 
    return ()

type Tree = [(Int, [Int])]

t :: Tree
t = [(1,[2,3,4]), (2,[5,6]), (3,[7]), (4,[8,9]), (5,[]), (6,[10]), (7,[]), (8,[]), (9,[]), (10,[])] 

getSiblings :: Tree -> Int -> [Int]
getSiblings [] _ = error "Not found"
getSiblings ((father, children) : xs) number
   | elem number children = filter (/= number) children
   | otherwise = getSiblings xs number

findUncles :: Tree -> Int -> [Int]
findUncles [] _ = []
findUncles ((father, children) : xs) number = if elem number children then getSiblings t father else findUncles xs number