main :: IO()
main = do
   
    print $ twoDPoints
    print $ threeDPoints
    return()

data Point a = TwoD a a | ThreeD a a a
   deriving(Show)

twoDPoints = TwoD 1 2
threeDPoints = ThreeD 3 4 5       