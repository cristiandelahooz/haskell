-- Exponenciación modular rápida
modExp :: Integer -> Integer -> Integer -> Integer
modExp _ 0 m = 1
modExp base exp m
  | even exp = (half * half) `mod` m
  | otherwise = (base * half * half) `mod` m
  where
    half = modExp base (exp `div` 2) m

-- Test de Fermat para verificar si un número es primo
fermatTest :: Integer -> Integer -> Bool
fermatTest n a = modExp a (n - 1) n == 1

-- Primalidad basada en Fermat con varios valores de `a`
isPrime :: Integer -> Bool
isPrime n
  | n < 2 = False
  | even n && n /= 2 = False
  | otherwise = all (\a -> fermatTest n a) [2, 3, 5]

-- Encontrar el primer primo >= límite inferior
nextPrime :: Integer -> Integer
nextPrime n
  | even n = nextPrime (n + 1) -- Asegurar que es impar
  | isPrime n = n
  | otherwise = nextPrime (n + 2)

-- Encontrar el último primo <= límite superior
prevPrime :: Integer -> Integer
prevPrime n
  | even n = prevPrime (n - 1) -- Asegurar que es impar
  | isPrime n = n
  | otherwise = prevPrime (n - 2)

-- Límites de 2048 bits
min2048, max2048 :: Integer
min2048 = 2 ^ 2047
max2048 = 2 ^ 2048 - 1

-- Cálculo de primos en el rango
main :: IO ()
main = do
  let menorPrimo = nextPrime min2048
  let mayorPrimo = prevPrime max2048
  putStrLn $ "Menor primo de 2048 bits: " ++ show menorPrimo
  putStrLn $ "Mayor primo de 2048 bits: " ++ show mayorPrimo
