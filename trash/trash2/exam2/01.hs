thrice :: (Num a) => a -> [a]
thrice x = [x, x, x]

sums :: (Num a) => [a] -> [a]
sums (x : y : ys) = x : sums (x + y : ys)
sums xs = xs

main :: IO ()
main = print $ sum $ (map thrice (sums [0 .. 4])) !! 3
