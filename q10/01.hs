quux :: String -> IO [String]
quux q = do
  y <- getLine
  z <- getLine
  putStrLn (y ++ z)
  return [q]
