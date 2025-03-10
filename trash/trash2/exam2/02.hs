fun:: [a] -> [[a]]
fun[] = [[]]
fun(x: xs) = yss++ map(x: ) yss
              where yss = fun xs

main:: IO()
main = print $ length $ head $ drop 15 $ fun[1, 2, 3, 4, 5]
