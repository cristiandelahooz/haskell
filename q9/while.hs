while :: (a -> Bool) -> (a -> a) -> a -> a
while c f a = if c a then while c f (f a) else a

check :: String -> Bool
check [] = True
check ('A' : xs) = False
check _ = True

main :: IO ()
main = do
  print $ while check tail "xyzAvvt"
