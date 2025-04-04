data SF a = SS a | FF
  deriving (Show, Eq)

-- Definición de las funciones
myhead :: [a] -> SF a
myhead [] = FF
myhead (a : as) = SS a

mytail :: [a] -> [a]
mytail [] = []
mytail (_ : xs) = xs

myzip :: [a] -> [b] -> [(a, b)]
myzip [] _ = []
myzip _ [] = []
myzip (a : as) (b : bs) = (a, b) : (myzip as bs)

-- Función mystery
mystery :: (Eq a) => [a] -> SF a
mystery xs = myhead [x | (x, y) <- myzip xs (mytail xs), x == y]

-- Evaluación de la función con la entrada dada
main :: IO ()
main = print $ mystery "abccdeffghii"
