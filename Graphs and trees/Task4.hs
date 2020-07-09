main :: IO()
main = do

    print $ Circle 5
    print $ Circle 6.9
    print $ Rectangle 1 2
    print $ (\ (Rectangle a b) -> a * b) (Rectangle 1 2)
    print $ Cylinder 20.1 23.1
    return()

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a -- алгебричен тип данни
   deriving(Show)