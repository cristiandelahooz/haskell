whileRight :: (a -> Either b a) -> a -> b
whileRight check x = case check x of
  Left result -> result
  Right next -> whileRight check next

-- Definición de check para pruebas
check :: Int -> Either String Int
check x = if x < 10 then Right (x + 1) else Left ("Done: " ++ show x)

step :: Int -> Int -> Either Int Int
step k x = if x < k then Right (2 * x) else Left x

-- Ejemplo de uso
main :: IO ()
main = do
  print $ whileRight (step 100) 1 -- Resultado esperado: 16
  print $ whileRight check 0 -- Resultado esperado: "Done: 10"
  print $ take 10 (cycle ("abc"))
