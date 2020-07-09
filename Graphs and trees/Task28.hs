import Data.List

main :: IO()
main = do

    print $ allContain [t1, t2] -- ["acd","cd","d"]

data BTree a = Empty | Node a (BTree a) (BTree a)
   deriving(Show)

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)  

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Empty Empty) Empty) (Node 'b' Empty Empty)


height :: BTree a -> Int
height Empty = 0
height (Node _ left right) = max (1 + height left) (1 + height right)

genWords :: BTree Char -> [String]
genWords Empty = [] 
genWords tree@(Node value left rigth) = nub $ [pomoshtnik tree x 0| x <- [0.. (height tree) - 1]] ++ genWords left  ++ genWords rigth
   where
       helper Empty = []
       helper (Node value left rigth) 
          | otherwise = value : helper left

       pomoshtnik (Node value left rigth) smqna count
          | smqna == count = value : if isEmpty rigth then helper left else helper rigth
          | otherwise = value : pomoshtnik left smqna (count + 1)
        
       isEmpty Empty = True
       isEmpty _ = False 

allContain :: [BTree Char] -> [String]
allContain tree =  nub $ [y | y <- allWords tree, if isRepeating y (allWords tree) >= 2 then True else False] -- изкарваме елемент, ако се повтаря
-- но тъй като всеки елемент, който се повтаря се изписва, когато му се прави проверката използваме nub, за да не се повтарят резултатите                                            
allWords [] = []
allWords (x:xs) = genWords x ++ allWords xs -- тази функция прави списък от всички "думи", които се съдържат във всички дървета
       
isRepeating :: String -> [String] -> Int -- проверяваме дали една дума се съдържа поне два пъти
isRepeating _ [] = 0
isRepeating duma (x : xs)
   | duma == x = 1 + isRepeating duma xs -- добавяме едно, защото искаме да преброим колко пъти се среща "думата"
   | otherwise = isRepeating duma xs 
       
