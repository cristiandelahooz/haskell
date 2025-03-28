mapMaybe2 :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
mapmaybe2 _ _ Nothing = Nothing
mapMaybe2 _ Nothing _ = Nothing
mapMaybe2 f (Just x) (Just y) = Just (f x y)

main :: IO ()
main = do
  print $ mapMaybe2 take (Just 2) (Just "abcd")
