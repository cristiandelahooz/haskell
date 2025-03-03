-- funciones combinatorias
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = yss ++ map (x:) yss
              where yss = subs xs
interleave :: a -> [a] -> [[a]]
interleave x [] = [[x]]
interleave x (y:ys) = (x:y:ys) : map (y:) (interleave x ys)
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat (map (interleave x) (perms xs))
ls :: [Int]
ls = [1,2,3]
choices :: [a] -> [[a]]
choices = concat .map perms . subs
main :: IO()
main =  do
  print $ subs ls  
  print $ interleave 8 ls
  print $ perms ls
  print $ choices ls  
  

[[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
[[8,1,2,3],[1,8,2,3],[1,2,8,3],[1,2,3,8]]
[[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
[[],[3],[2],[2,3],[3,2],[1],[1,3],[3,1],[1,2],[2,1],[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]
