main :: IO()
main = do

    print $ highest Red colorTree
    print $ highest Green colorTree
    print $ highest Blue colorTree
    return ()

data Color = Red | Green | Blue
   deriving(Show, Eq)

data CTree = Nil | Node Color CTree CTree
   deriving(Show)

colorTree :: CTree
colorTree = Node Blue (Node Green (Node Blue (Node Red Nil Nil) Nil) (Node Blue Nil Nil)) (Node Red (Node Green (Node Blue Nil Nil) Nil ) (Node Red Nil Nil))

highest :: Color -> CTree -> Int
highest _ Nil = -1
highest x (Node y Nil Nil) = if x == y then 1 else 0
highest x (Node y left right) = 1 + max (highest x left) (highest x right)