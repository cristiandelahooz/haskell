maxBy :: (a -> Int) -> a -> a -> a
maxBy f x y = if f x > f y then x else y

main :: IO ()
main = do
  print $ maxBy (* 2) 3 5
  print $ sum $ takeWhile (< 100) (scanl1 (+) (map (\x -> x * x) [1 ..]))
