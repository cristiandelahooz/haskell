data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                 deriving (Show)

treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))

recor :: BinTree a -> [a]
recor Empty = []
recor (Node x l r) = recor l ++ [x] ++ recor r

ls1 :: [Int]
ls1 = [10,6,3,15,8,17,12,2,23,7,13,9,5,11,14,4,18,16,20]

bt :: BinTree Int
bt = treeFromList ls1

val :: Int
val = (recor bt) !! 5  -- Tomamos el valor en el índice 5 de la lista generada por el recorrido en orden

main :: IO ()
main = print val  -- Imprime el valor de "val"
