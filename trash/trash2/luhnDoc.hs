perms :: [a] -> [[a]]
perms [] = [[]]
perms xs = [ y:zs | (y,ys) <- selects xs, zs <- perms ys]
  where
    selects [] = []
    selects (x:xs) = (x, xs) : [(y, x:ys) | (y, ys) <- selects xs]
-------------------------------------------
lastDigit :: Integer -> Integer
lastDigit 0 = 0
lastDigit n = n `mod` 10

dropLastDigit :: Integer -> Integer
dropLastDigit 0 = 0
dropLastDigit n = (n - (lastDigit n)) `div` 10

toRevDigits :: Integer -> [Integer]
toRevDigits 0 = []
toRevDigits n = lastDigit n:(toRevDigits (dropLastDigit n))

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:xs) = x:y*2:doubleEveryOther xs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
          | ((length (show x)) == 1) = x + sumDigits xs
          | otherwise = sumBigNumber x + sumDigits xs

sumBigNumber :: Integer -> Integer
sumBigNumber x = lastDigit x + (sumDigits [dropLastDigit x])

checkCC :: Integer -> Bool
checkCC x = sumDigits (doubleEveryOther (toRevDigits x)) `mod` 10 == 0

ced1 = 03101994675
tar1 = 5488770011122657
tar2 = 4234210052581176
tar3 = 4234210052581010

main = do
  print $ sumBigNumber ced1
  print $ sumBigNumber tar1
  print $ checkCC ced1
  print $ checkCC tar1
  print $ checkCC tar2
