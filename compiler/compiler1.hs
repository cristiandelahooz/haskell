data Expr = Val Int | Add Expr Expr

instance Show Expr where
  show (Val n) = show n
  show (Add x y) = "(" ++ show x ++ "+" ++ show y ++ ")"

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y

type Stack = [Int]

type Code = [Op]

data Op = PUSH Int | ADD
  deriving (Show)

exec :: Code -> Stack -> Stack
exec [] s = s
exec (PUSH n : c) s = exec c (n : s)
exec (ADD : c) (m : n : s) = exec c (n + m : s)

comp' :: Expr -> Code -> Code
comp' (Val n) c = PUSH n : c
comp' (Add x y) c = comp' x (comp' y (ADD : c))

comp :: Expr -> Code
comp e = comp' e []

ex :: Expr
ex = Add (Val 5) (Add (Val 3) (Add (Val 4) (Val 7)))
e1 :: Expr
e1 = Add (Add (Val 1) (Val 2)) (Val 3)

main = do
  print e1
  let v1 = comp e1
  print v1
  let vx = comp ex
  print vx
  let c1 = exec v1 []
  print c1
  let cx = exec vx []
  print cx
