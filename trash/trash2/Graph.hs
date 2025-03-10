type Graph = [(Int, [Int])] -- Grafo representado como lista de adyacencia

dfs :: Graph -> Int -> [Int]
dfs graph start = dfs' graph [start] []

dfs' :: Graph -> [Int] -> [Int] -> [Int]
dfs' _ [] visited = visited
dfs' graph (node : stack) visited
  | node `elem` visited = dfs' graph stack visited
  | otherwise = dfs' graph (neighbors ++ stack) (node : visited)
  where
    neighbors = case lookup node graph of
      Just ns -> ns
      Nothing -> []

bfs :: Graph -> Int -> [Int]
bfs graph start = bfs' graph [start] []

bfs' :: Graph -> [Int] -> [Int] -> [Int]
bfs' _ [] visited = visited
bfs' graph (node : queue) visited
  | node `elem` visited = bfs' graph queue visited
  | otherwise = bfs' graph (queue ++ neighbors) (visited ++ [node])
  where
    neighbors = case lookup node graph of
      Just ns -> ns
      Nothing -> []

main :: IO ()
main = do
  -- Grafo de ejemplo
  -- 1 -> 2 -> 3
  -- 2 -> 4
  -- 3 -> 5
  -- 4 -> 5
  -- 5 -> 1
  -- 6 -> 5
  let graph = [(1, [2]), (2, [4]), (3, [5]), (4, [5]), (5, [1]), (6, [5])]
  print $ dfs graph 1
  print $ bfs graph 1
