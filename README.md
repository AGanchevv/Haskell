Task 1
Given a directed graph "g" (with edges (1, 2), (1, 3), (2, 3), (2, 4)) define the following functions:

nodes - returns all the nodes of "g";
neighbours - accepts a node and returns its children (neighbours);
adjacencyList - returns the children of every parent.

Define a function that checks whether a given path is valid in a graph g = (1, [2, 3]), (2, [3, 4]), (3, []), (4, []).

Test cases:

nodes [(1, 2), (1, 3), (2, 3), (2, 4)] -> [1, 2, 3, 4]
neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 2 -> [3, 4]
neighbours [(1, 2), (1, 3), (2, 3), (2, 4)] 4 -> []
adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] -> [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])]

isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 2, 4] -> True
isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [1, 3, 4] -> False
isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [2, 3] -> True
isPath [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] [3, 1] -> False
-----------------------------------------------------------------------------------------------------------------------------------------------
Task2
Define a function that accepts a graph, a whole number "k" and a node "n". Return all the paths starting from "n" that are "k" nodes long. Create types to represent the nodes, graph and path. Don't forget to validate the node!

Test cases:

simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 0 1 -> [[1]]
simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 1 -> [[1, 2], [1, 3]]
simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 2 1 -> [[1, 2, 3], [1, 2, 4]]
simplePaths [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])] 1 2 -> [[2,3],[2,4]]
Note:
Path ::= acyclic connection between nodes ending with a node that has no outgoing connections.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task3
Let (x, y, z) be a vector representing the nodes of a binary tree such that x is the value of the current node, y and z are the values of the child nodes. Define a function that returns the leaves of such a tree.

Test cases:

listLeaves [(1, 2, 3), (2, 4, 5)] -> [4, 3, 5]
listLeaves [(2, 4, 5), (1, 2, 3)] -> [4, 5, 3]
listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] -> [2, 4, 6, 9]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task4
Define a new data type called "Shape". Shape must have four constructors:

Circle: with one argument representing the radius;
Rectangle: with two arguments representing the width and height;
Triangle;
Cylinder with two arguments for the radius of the base and height.
Create a shape from every type and output it.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task5
Define a function that accepts two functions: "f" and "g" and a list of points with two coordinates. The function should return those points for which f(firstCoordinate) = g(secondCoordinate) and should be able to work with whole as well as floating point numbers!

Test case:

myImages (\x -> x * x) (\x -> x + 2) [Point 2 2, Point 1 2, Point 3 7] -> [Point 2 2, Point 3 7]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task6
By using the "Shape" data type, define the following functions:

perimeter;
area;
isRound - returns whether a shape has a round side;
is2D - returns whether a shape has two dimensions.
Test cases:

perimeter $ Circle 5 -> 31.42
perimeter $ Rectangle 2.5 4.5 -> 14
perimeter $ Rectangle 5.5 20.6 -> 52.2
perimeter $ Triangle 5.3 3.9 4.89 -> 14.09
perimeter $ Cylinder 2.5 10 -> 30   

area $ Circle 5 -> 78.54
area $ Rectangle 2.5 4.5 -> 11.25
area $ Rectangle 5.5 20.6 -> 113.3
area $ Triangle 5.3 3.9 4.89 -> 9.128
area $ Cylinder 20 30 -> 6283.19   

isRound $ Circle 5 -> True
isRound $ Rectangle 2.5 4.5 -> False
isRound $ Rectangle 5.5 20.6 -> False
isRound $ Triangle 5.3 3.9 4.89 -> False
isRound $ Cylinder 20 30 -> True

is2D $ Circle 5 -> True
is2D $ Rectangle 2.5 4.5 -> True
is2D $ Rectangle 5.5 20.6 -> True
is2D $ Triangle 5.3 3.9 4.89 -> True
is2D $ Cylinder 20 30 -> False
Note:

Perimeter of a cylinder: 4*r + 2*h
Area of a cylinder: 2*pi*r*h + 2*pi*r*r.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task7
By using the "Shape" data type, define two functions that accept a list of shapes and:

1. The first returns their areas;
2. The second returns the shapes with the biggest areas.
Test cases:

getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] -> [78.54, 11.25, 113.3, 9.128, 6283.19]
maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] -> [Cylinder 20.0 30.0]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task8
Define a new data type called "Point". A point may have two or three dimensions. Create an instance of every type and print it.

By using the "Point" data type, complete tasks 9 - 11.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task9
Define a function that finds the distance between two points. Make sure the points have equal dimensions!

Test cases:

distance (TwoD 2 5) (TwoD 6 9) -> 5.66
distance (ThreeD 2 5 10) (ThreeD 6 9 (-5)) -> 16.0
-----------------------------------------------------------------------------------------------------------------------------------------------
Task10
Define a function that accepts a point "p" and a list of points. The function returns the points from the list that are closest to "p".

Test case:

closestTo (ThreeD 2 5 10) [(ThreeD 4 5 6), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] -> [ThreeD 4.0 5.0 6.0]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task11
Define a function that accepts a list of points and returns a vector (Double, Point, Point) that represents the closest distance between any two points, and the points themselves.

Test case:

getClosestDistance [(ThreeD 4 5 6), (ThreeD 2 5 10), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] -> (2.8284271247461903,ThreeD 4.0 5.0 6.0,ThreeD 6.0 5.0 4.0)
-----------------------------------------------------------------------------------------------------------------------------------------------
Task12
Define a recursive algebraic type called "BTree". A BTree may hold a user-chosen type in its nodes. Create the instances given in task5_1.png and task5_2.png and print them.

By using the "BTree" data type, complete tasks below.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task13
Define the following functions:

​​size - returns the number of nodes;
​​height;​
sumTree - returns the sum of the nodes;​
average - returns the average of the nodes;
​​sumLeaves​ - returns the sum of the leaves;
inorder​ - returns the nodes in the following order: left branch, root, right branch;
areEqual - checks whether two trees are identical.
Test cases:

size numberBTree -> 9
size charBTree -> 7
height numberBTree -> 4
height charBTree -> 3
sumTree numberBTree -> 146
sumTree charBTree -> should not work
average numberBTree -> 16.22
average charBTree -> should not work
sumLeaves numberBTree -> 119
sumLeaves charBTree -> shouldn't work
inorder numberBTree -> [96, 1, 12, 0, 5, 2, 4, 5, 21]
inorder charBTree -> "haskell"
areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Null Null) Null) (Node 0 Null Null)) (Node 4 (Node 2 Null Null) (Node 5 Null Null))) -> False
areEqual charBTree charBTree -> True
areEqual numberBTree (Node 5 (Node 12 (Node 1 (Node 96 Null Null) Null) (Node 0 Null Null)) (Node 8 (Node 2 Null Null) (Node 5 Null (Node 21 Null Null)))) -> False
Notes:

Height of a tree ::= the number of nodes that make up the highest branch.
sumTree, sumLeaves, average should work only for trees that store numbers in their nodes.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task14
If the root is at level 0, define a function that accepts a whole number k and returns the nodes at level k.

Test cases:

getLevel numberBTree 2 -> [1, 0, 2, 5]
getLevel charBTree 1 -> "al"
getLevel charBTree 3 -> should not work

Trees used:
data BTree a = Null | Node a (BTree a) (BTree a) deriving (Show)

numberBTree :: (Num a) => BTree a numberBTree = Node 5 (Node 12 (Node 1 (Node 96 Null Null) Null) (Node 0 Null Null)) (Node 4 (Node 2 Null Null) (Node 5 Null (Node 21 Null Null)))

charBTree :: BTree Char charBTree = Node 'k' (Node 'a' (Node 'h' Null Null) (Node 's' Null Null)) (Node 'l' (Node 'e' Null Null) (Node 'l' Null Null))
-----------------------------------------------------------------------------------------------------------------------------------------------
Task15
If the root is at level 0, define a function that replaces the values in all nodes with the vector ("level", "value").

Test cases:

setLevels numberBTree -> Node (0,5) (Node (1,12) (Node (2,1) (Node (3,96) Null Null) Null) (Node (2,0) Null Null)) (Node (1,4) (Node (2,2) Null Null) (Node (2,5) Null (Node (3,21) Null Null)))
setLevels charBTree -> Node (0,'k') (Node (1,'a') (Node (2,'h') Null Null) (Node (2,'s') Null Null)) (Node (1,'l') (Node (2,'e') Null Null) (Node (2,'l') Null Null))
-----------------------------------------------------------------------------------------------------------------------------------------------
Task16
Define a function that returns the mirror tree.

Test case:

mirrorTree numberBTree -> Node 5 (Node 4 (Node 5 (Node 21 Null Null) Null) (Node 2 Null Null)) (Node 12 (Node 0 Null Null) (Node 1 Null (Node 96 Null Null)))
mirrorTree charBTree -> Node 'k' (Node 'l' (Node 'l' Null Null) (Node 'e' Null Null)) (Node 'a' (Node 's' Null Null) (Node 'h' Null Null))
-----------------------------------------------------------------------------------------------------------------------------------------------
Task17
Define a function that maps a (one-argument) function to the tree.

Test case:

mapTree numberBTree (*2) -> Node 10 (Node 24 (Node 2 (Node 192 Null Null) Null) (Node 0 Null Null)) (Node 8 (Node 4 Null Null) (Node 10 Null (Node 42 Null Null)))
mapTree charBTree (toUpper) -> Node 'K' (Node 'A' (Node 'H' Null Null) (Node 'S' Null Null)) (Node 'L' (Node 'E' Null Null) (Node 'L' Null Null))
-----------------------------------------------------------------------------------------------------------------------------------------------
Task18
Define a function that returns True when every node has the following relationship with its grandfather: "childValue" >= "grandPaValue + 1".

Test case:

grandchildrenIncreased numberBTree -> False
grandchildrenIncreased $ Node 5 (Node 12 (Node 6 (Node 96 Nil Nil) Nil) (Node 7 Nil Nil)) (Node 4 (Node 8 Nil Nil) (Node 10 Nil (Node 21 Nil Nil))) -> True
-----------------------------------------------------------------------------------------------------------------------------------------------
Task19
Modify the data type so that it represents an n-ary tree. Define the tree shown in task5.png, print it and define a function that returns its size.
-----------------------------------------------------------------------------------------------------------------------------------------------
Task20
A colour may be either red, green or blue. Create an instance of the tree shown in task6.png. Do the following:

- print it;
- define a function that accepts a colour and returns the hight of the highest node of that colour.
Test cases:

highest Red colourBTree -> 4
highest Green colourBTree -> 3
highest Blue colourBTree -> 4
-----------------------------------------------------------------------------------------------------------------------------------------------
Task21
Define a new data type representing a binary tree of whole numbers. By using it,  define a function that returns the sum of the nodes with values between L and R (inclusive).

Test cases:

rangedSum firstTree 100 50 -> 0 (L = 100, R = 50)
rangedSum firstTree 7 15 -> 32 (L = 7, R = 15)
rangedSum secondTree 6 10 -> 23 (L = 6, R = 10)
rangedSum secondTree 10 6 -> 23 (L = 10, R = 6)
rangedSum firstTree 15 7 -> 32 (L = 15, R = 7)
-----------------------------------------------------------------------------------------------------------------------------------------------
Task22
Define a function that modifies it so that every node "n" has a new value equal to the sum of the values of the original tree that are greater than or equal to the value of "n".

Test case:

convert tree -> (Node 30 (Node 36 (Node 36 Nil Nil) (Node 35 Nil (Node 33 Nil Nil))) (Node 21 (Node 26 Nil Nil) (Node 15 Nil (Node 8 Nil Nil))))
-----------------------------------------------------------------------------------------------------------------------------------------------
Task23
Define a function findUncles tree node that for given trees of natural numbers tree and node of tree finds a list of all the uncles of node in tree.
The tree is presented by associative list, keys in which are the nodes and the associated value with given key is a list of node sons.

Test case:

t :: Tree
t = [(1,[2,3,4]), (2,[5,6]), (3,[7]), (4,[8,9]), (5,[]), (6,[10]), (7,[]), (8,[]), (9,[]), (10,[])] 

(findUncles t 5) -> [3,4]
(findUncles t 7) -> [2,4]
(findUncles t 10) -> [5] 
-----------------------------------------------------------------------------------------------------------------------------------------------
Task24
Let the binary tree be introduced as data BTree = Nil | Node Int BTree BTree. Define function predicate leavesAreEqual :: BTree -> BTree -> Bool, which
accepts two binary trees bt1 and bt2 i checks if the ascending order of values in the nodes of bt1 is the same as it in tree bt2.

Test case: 

t1 :: BTree
t1 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t2 :: BTree
t2 = Node 25 (Node 10 (Node 1 Nil Nil) Nil) (Node 30 (Node 32 Nil Nil) (Node 26 Nil Nil))

t3 :: BTree
t3 = t1

t4 :: BTree
t4 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 27 Nil Nil) (Node 32 Nil Nil)))

leavesAreEqual t1 t2 -> True
leavesAreEqual t3 t4 -> False
-----------------------------------------------------------------------------------------------------------------------------------------------
Task25
Lets have the following representation of a binary tree of integers:
data BTree = Empty " Node Int BTree BTree
We say that is symmetrical if the left subtree is symmetrical to the right. Define a predicat isSymmetric :: BTree -> Bool, which checks is a tree is symmetrical.

Test case:

t3 :: BTree 
t3 = Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)

t4 :: BTree
t4 = Node 1 (Node 2 (Node 3 Empty Empty) Empty) (Node 2 Empty (Node 3 Empty Empty))

t5 :: BTree 
t5 = Node 1 (Node 2 (Node 3 Empty Empty) (Node 7 (Node 5 Empty Empty) Empty)) (Node 2 (Node 7 Empty (Node 5 Empty Empty)) (Node 3 Empty Empty))

isSymmetric t3 -> False
isSymmetric t4 -> True
isSymmetric t5 -> True
-----------------------------------------------------------------------------------------------------------------------------------------------
Task26
Define a function containsWord :: BTree Char -> String -> Bool which by given binary tree of symbols and a word, created from at least one character,
checks if the tree contains the word and if the last character is leaf in the tree.

Test case:

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)

containsWord t1 "acd" -> True
containsWord t1 "ab" -> False
containsWord t1 "be" -> True
-----------------------------------------------------------------------------------------------------------------------------------------------
Task27
Define a function genWords :: BTree Char -> [String], which by given binary tree of symbols returns a list of all the words that it contains.

Test case:

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)  

genWords t1 -- ["abe","acd","acf","cd","cf","f","d","be","e"]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task28
Define a function allContain :: [BTree Char] -> [String] which by given list of binary trees of symbols returns a list of those words which appears in
all trees.

Test case:

t1 :: BTree Char                             
t1 = Node 'a' (Node 'c' (Node 'f' Empty Empty) (Node 'd' Empty Empty)) (Node 'b' (Node 'e' Empty Empty) Empty)  

t2 :: BTree Char
t2 = Node 'a' (Node 'c' (Node 'd' Empty Empty) Empty) (Node 'b' Empty Empty)

allContain [t1, t2] -- ["acd","cd","d"]
-----------------------------------------------------------------------------------------------------------------------------------------------
Task29
Lets have the following tree: data NTree = Nil | NNode Int [NTree]
Define a function isGraceful :: NTree -> Bool which takes a tree and checks if it is graceful.
A tree is graceful if the absolute values of the difference between the values of each element and its paternal are even.

Test case:

t3 :: NTree 
t3 = NNode 1 [NNode 3 [], NNode 5 [], NNode 7 [], NNode 9 []]

t4 :: NTree
t4 = NNode 7 [NNode 9 [NNode 5 [],NNode 2 []]]

isGraceful t3 -> True (|3-1|=2, |5-1|=4, |7-1|=6, |9-1|=8)
isGraceful t4 -> False (|9-7|=2, |5-9|=4, |2-9|=7)
