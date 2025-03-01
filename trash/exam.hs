odd_even_split :: [a] -> ([a], [a])
odd_even_split xs =
  ( [x | (x, i) <- zip xs [0 ..], i `mod` 2 == 0],
    [x | (x, i) <- zip xs [0 ..], i `mod` 2 == 1]
  )
main :: IO ()
main = print (odd_even_split [1, 2, 3, 4, 5, 6])
