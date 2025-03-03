customTakeWhile :: (a -> Bool) -> [a] -> [a]
customTakeWhile _ [] = []  -- Caso base: lista vacía.
customTakeWhile p (x:xs)
    | p x       = x : customTakeWhile p xs  -- Sigue tomando elementos si cumplen.
    | otherwise = []  -- Se detiene y devuelve lista vacía si encuentra un fallo.

dec2int :: [Int] -> Int
dec2int [] = 0
dec2int xs = foldl ( \acc x -> acc * 10 + x) 0 xs

main :: IO ()
main = do
    print $ customTakeWhile (< 5) [1,2,3,6,4,5]  -- [1,2,3]
    print $ customTakeWhile (< 5) [6,7,8,9]      -- [] (ningún elemento cumple)
    print $ dec2int [2,3,4,7]
