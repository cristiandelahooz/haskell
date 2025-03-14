import Control.Monad -- for definition of "when"

main = do
  -- initialization
  putStrLn $ "Bienvenidos a mi REPL!"
  -- start the main loop
  loop
  -- clean up
  putStrLn $ "Gracias por usar mi REPL!"

-- definition of main loop
loop = do
  txt <- getLine
  when (txt /= "exit") $ do
    putStrLn $ "Tengo " ++ txt ++ "!"
    loop
