import Data.List

main :: IO()
main = do

    print $ containsWord t1 "acd" -- True
    print $ containsWord t1 "acf" -- True
    print $ containsWord t1 "abe" -- True
    print $ containsWord t1 "cd" -- True
    print $ containsWord t1 "cf" -- True
    print $ containsWord t1 "be" -- True
    print $ containsWord t1 "f" -- True
    print $ containsWord t1 "d" -- True
    print $ containsWord t1 "e" -- True
    print $ containsWord t1 "ab" -- False
    print $ containsWord t1 "ac" -- False
    print $ containsWord t1 "a" -- False
    print $ containsWord t1 "c" -- False
    print $ containsWord t1 "b" -- False
    return()

data BTree a = Empty | Node a (BTree a) (BTree a)
   deriving(Show, Eq) 

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)  

containsWord :: BTree Char -> String -> Bool
containsWord Empty _ = False 
containsWord (Node value Empty Empty) lst@(x : xs)= if x == value && length lst == 1 then True else False 
containsWord (Node value left rigth) lst@(x:xs) = if x == value then helper left xs ||  helper rigth xs 
                                                  else containsWord left lst || containsWord rigth lst 
   where
       helper Empty _ = False
       helper _ [] = False
       helper (Node value left rigth) lst@(y:ys)
          | value /= y = False                   
          | length lst == 1 && left == Empty && rigth == Empty = True 
          | otherwise = helper left ys || helper rigth ys
                                                         
                                                          