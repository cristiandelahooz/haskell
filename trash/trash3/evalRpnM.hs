import Control.Monad -- when
import Data.List qualified as List
import Data.Map qualified as Map

{-- List of supported Operators -> mapping with functions --}
ops =
  Map.fromList
    [ ("+", (+))
    , ("-", flip (-))
    , ("*", (*))
    , ("/", flip (/))
    ]

{-- Calculates value based on the operator string and two number args --}
opsEval :: String -> Float -> Float -> Float
opsEval key n1 n2 = case (Map.lookup key ops) of
  Just op -> op n1 n2
  Nothing -> error ("Operador Invalido" ++ key)

{-- The first two elements from the list are poped from the stack, and based
on the operator, the result is pushed back onto the stack --}
evalStack :: [Float] -> String -> [Float]
evalStack [] key = []
evalStack [x] key = [x]
evalStack (x : y : xs) key = (opsEval key x y) : xs

{-- The recursive function to evaluate the expression --}
evalRpnExprRec :: [Float] -> [String] -> Float
evalRpnExprRec stack [] = List.head stack
evalRpnExprRec stack (tok : toks)
  | Map.member tok ops = evalRpnExprRec (evalStack stack tok) toks
  | otherwise =
      let tokVal = read tok :: Float
       in evalRpnExprRec (tokVal : stack) toks

{-- Evaluates RPN Expression --}
evalRpnExpr :: String -> Float
evalRpnExpr raw = evalRpnExprRec [] (List.words raw)

main :: IO ()
main = do
  {-    print $ evalRpnExpr  " 13 15 + "
      print $ evalRpnExpr "3   25 4 *   + "
      print $ evalRpnExpr "1   2   2  + 2 7  *  *   -  "
  -}

  putStrLn $ "Bienvenidos a mi REPL!"

  loop

  putStrLn $ "Gracias por usar mi REPL!"

loop = do
  txt <- getLine
  when (txt /= "exit") $ do
    putStrLn $ "Tengo " ++ txt ++ "!"
    print $ evalRpnExpr txt
    loop

{-
 solveRPN' :: (Num a, Read a) => String -> a
    solveRPN' = head . foldl foldingFunction [] . words
        where   foldingFunction (x:y:ys) "*" = (x * y):ys
                foldingFunction (x:y:ys) "+" = (x + y):ys
                foldingFunction (x:y:ys) "-" = (y - x):ys
                foldingFunction xs numberString = read numberString:xs

-}
