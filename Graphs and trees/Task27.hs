import Data.List

main :: IO()
main = do

    print $ genWords t1 -- ["abe","acd","acf","cd","cf","f","d","be","e"]

data BTree a = Empty | Node a (BTree a) (BTree a)
   deriving(Show)

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)  

height :: BTree a -> Int -- функция за намиране на височината на дървото
height Empty = 0
height (Node _ left right) = max (1 + height left) (1 + height right)

genWords :: BTree Char -> [String]
genWords Empty = [] 
genWords tree@(Node value left rigth) = nub $ [pomoshtnik tree x 0| x <- [0.. (height tree) - 1]] ++ genWords left ++ genWords rigth -- комбинираме всички списъци и изпозлваме nub, защото някои случаи се повтарят
   where                                                              
       helper Empty = []
       helper (Node value left rigth) 
          | otherwise = value : helper left -- намира само левите членове 

       pomoshtnik (Node value left rigth) smqna count
          | smqna == count = value : if isEmpty rigth then helper left else helper rigth -- в зависимост дали този node има елементи в дясното си разклонение,
          | otherwise = value : pomoshtnik left smqna (count + 1)                       -- задава да се търсят съответно само левите елементи на лявото или дясното си разклонение
         -- ако не се е стигнало нивото, на което ще се разклонява, се продължава, докато не се стигне, за да се обиколят всички възможни пътища
       isEmpty Empty = True -- проверка дали се стига края на дървото 
       isEmpty _ = False 