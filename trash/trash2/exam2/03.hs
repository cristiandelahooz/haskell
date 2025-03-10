intl :: a -> [a] -> [[a]]
intl x [] = [[x]]
intl x (y : ys) = (x : y : ys) : map (y :) (intl x ys)

main :: IO ()
main = print $ sum $ last $ intl 4 [1, 2, 3]
