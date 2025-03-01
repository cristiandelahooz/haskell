module Main (main) where

isPrime :: Integer -> Bool
isPrime n = isPrimeHelper n 2

isPrimeHelper :: Integer -> Integer -> Bool
isPrimeHelper n d
   | n < 2     = False
   | d == n    = True
   | n `mod` d == 0  = False
   | otherwise       = isPrimeHelper n (d + 1)

main :: IO ()
main = do
   let num = 7
   let isPrimeNum = isPrime num
   if isPrimeNum
      then putStrLn (show num ++ " is a prime number.")
      else putStrLn (show num ++ " is not a prime number.")
