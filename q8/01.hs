-- Dada una lista de cadenas y una longitud, devuelve todas las cadenas que

-- * tienen la longitud dada

-- * se forman mediante la concatenación de dos cadenas de entrada

--
-- Ejemplos:
-- joinToLength 2 ["a","b","cd"] ==> ["aa","ab","ba","bb"]
-- joinToLength 5 ["a","b","cd","def"] ==> ["cddef","defcd"]
--
-- ¡Sugerencia! Este es un gran uso para las listas por comprensión

joinToLength :: Int -> [String] -> [String]
joinToLength len strs = [a ++ b | a <- strs, b <- strs, length (a ++ b) == len]

main :: IO ()
main = do
  print $ joinToLength 2 ["a", "b", "cd"] -- ["aa","ab","ba","bb"]
  print $ joinToLength 5 ["a", "b", "cd", "def"] -- ["cddef","defcd"]
  print $ joinToLength 3 ["x", "y", "z"] -- []
  print $ joinToLength 4 ["hi", "yo", "ab", "cd"] -- ["hiyo","yoab","abhi","cdyo"]
