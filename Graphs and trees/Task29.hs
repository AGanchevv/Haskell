import Data.List

main :: IO()
main = do

    print $ isGraceful t3 -- True (|3-1|=2, |5-1|=4, |7-1|=6, |9-1|=8)
    print $ isGraceful t4 -- False (|9-7|=2, |5-9|=4, |2-9|=7)

data NTree = Nil | NNode Int [NTree]
   deriving(Show)

t3 :: NTree 
t3 = NNode 1 [NNode 3 [], NNode 5 [], NNode 7 [], NNode 9 []]

t4 :: NTree
t4 = NNode 7 [NNode 9 [NNode 5 [],NNode 2 []]]

isGraceful :: NTree -> Bool  
isGraceful Nil = True                       
isGraceful(NNode value lst) = helper lst value && and (map (\y -> isGraceful y) lst ) -- правим списък от булеви стойности и използваме and,
   where                                                                -- защото по този начин, ако има дори един False, резултатът от целия списък ще е False
       helper [] _ = True -- ако няма повече елементи, връща истина, защото всички са отговори на условието
       helper ((NNode stoinost lst) : xs) chislo -- правим списък от всички деца на настоящият елемент като за всяко дете проверяваме дали
          | (chislo - stoinost) `mod` 2 == 0 = helper xs chislo                                             -- разликата е четно число
          | otherwise = False 