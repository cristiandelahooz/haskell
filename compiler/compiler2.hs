data Expr = Val Int | Add Expr Expr | Mul Expr Expr
instance Show Expr where
  show (Val n) = show n
  show (Add x y) = "(" ++ show x ++ "+" ++ show y ++ ")"
  show (Mul x y) = "(" ++ show x ++ "*" ++ show y ++ ")"

type Cont = [Op]

data Op = EVAL Expr | ADD Int | MUL Int

eval :: Expr -> Cont -> Int
eval (Val n) c = exec c n
eval (Add x y) c = eval x (EVAL y : c)
eval (Mul x y) c = eval x (EVAL y : c)

exec :: Cont -> Int -> Int
exec [] n = n
exec (EVAL y : c) n = eval y (MUL n : c)
exec (ADD n : c) m = exec c (n + m)
exec (MUL n : c) m = exec c (n * m)

value :: Expr -> Int
value e = eval e []

ex :: Expr
ex = Add (Val 5) (Add (Val 3) (Add (Val 4) (Val 7)))
e1 :: Expr
e1 = Add (Add (Val 1) (Val 2)) (Val 3)
e2 :: Expr
e2 = Mul (Add (Val 4) (Val 2)) (Val 3)

main = do
  print e1
  let v1 = eval e1 []
  print v1
  let w1 = exec [(ADD 5)] 3
  print w1
  let z1 = exec [EVAL e1, ADD 5] 1
  print z1
  let t1 = value e1
  print t1

  print ex
  let vx = eval ex [EVAL e1]
  print vx
  let wx = exec [ADD 7] 5
  print wx
  let zx = exec [EVAL ex, ADD 3] 1
  print zx
  let tx = value ex
  print tx

  print e2
  let v2 = eval e2 []
  print v2
