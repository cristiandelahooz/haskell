--
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (a `div` b)

data BST a = Empty | Node a (BST a) (BST a)
    deriving (Show)

insert :: Ord a => a -> BST a -> BST a
insert x Empty = Node x Empty Empty
insert x (Node y left right)
    | x == y = Node y left right
    | x < y = Node y (insert x left) right
    | x > y = Node y left (insert x right)

contains :: Ord a => a -> BST a -> Bool
contains _ Empty = False
contains x (Node y left right)
    | x == y = True
    | x < y = contains x left
    | x > y = contains x right

toList :: BST a -> [a]
toList Empty = []
toList (Node x left right) = toList left ++ [x] ++ toList right

fromList :: Ord a => [a] -> BST a
fromList = foldr insert Empty

main :: IO ()
main = do
  print $ safeDiv 10 0
