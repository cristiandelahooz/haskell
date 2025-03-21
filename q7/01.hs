addEithers :: Either String Int -> Either String Int -> Either String Int
addEithers (Right x) (Right y) = Right (x + y)
addEithers (Left err) _ = Left err
addEithers _ (Left err) = Left err

main = do
  print $ addEithers (Right 1) (Right 2)
  print $ addEithers (Left "error") (Right 2)
  print $ addEithers (Right 1) (Left "error")
  print $ addEithers (Left "error1") (Left "error2")
