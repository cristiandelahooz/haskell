import Data.List

-- Cuenta las veces que un elemento aparece en una lista
count :: Eq a => a -> [a] -> Int
count x xs = length (filter (== x) xs)

-- Elimina duplicados de una lista
rmdups :: Eq a => [a] -> [a]
rmdups = nub

-- Función que genera la lista de (cantidad de ocurrencias, elemento)
result :: Ord a => [a] -> [(Int, a)]
result vs = sort [(count v vs, v) | v <- rmdups vs]

-- Función que obtiene el elemento con más votos
mifunc = snd . last . result

-- Lista de votos
votos = ["Rojo", "Azul", "Verde", "Azul", "Azul", "Rojo"]

-- Ejecutamos mifunc con la lista de votos
res = mifunc votos

-- Imprimimos el resultado
main :: IO ()
main = print res
