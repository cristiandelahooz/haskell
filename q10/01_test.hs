mycode :: (a -> b) -> (a -> Bool) -> [a] -> ([b], [Bool])
mycode f g [] = ([], [])
mycode f g (a : as) = case (mycode f g as) of (xs, ys) -> ((f a) : xs, (g a) : ys)

main :: IO ()
main = do
  print $ mycode (\a -> a + 6) (\b -> b `mod` 2 /= 0) [3, 7, 10, 2, 9, 17]
