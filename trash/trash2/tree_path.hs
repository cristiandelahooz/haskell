data BinTree a
  = Empty
  | Node a (BinTree a) (BinTree a)
  deriving (Show)

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x : xs) =
  Node
    x
    (treeFromList (filter (< x) xs))
    (treeFromList (filter (> x) xs))

preord :: BinTree Int -> [Int]
preord Empty = []
preord (Node x l r) = [x] ++ preord l ++ preord r

inord :: BinTree Int -> [Int]
inord Empty = []
inord (Node x l r) = inord l ++ [x] ++ inord r

postord :: BinTree Int -> [Int]
postord Empty = []
postord (Node x l r) = postord l ++ postord r ++ [x]

ls2 :: [Int]
ls3 :: [Int]
ls4 :: [Int]

ls1 = [10, 6, 3, 15, 8, 17, 12, 2, 23, 7, 13, 9, 5, 11, 14, 4, 18, 16, 20]

bt :: BinTree Int
bt = treeFromList ls1

ls2 = preord bt

ls3 = inord bt

ls4 = postord bt

main :: IO ()
main = do
  print ls2
  print ls3
  print ls4
  print bt
