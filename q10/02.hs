data SF a = SS a | FF
           deriving (Show,Eq)

myhead [] = FF
myhead (a:as) = SS a

mytail [] = []
mytail ( _ : xs) = xs

  myzip [] _ = []
  myzip _ [] = []
  myzip (a:as) (b:bs) = (a,b) : (myzip as bs)

  mystery xs = myhead [x|(x,y) <- myzip xs (mytail xs),x==y]
main = do
  let xs = [1,2,3,4,5]
  print (mystery xs)
  print (myhead xs)
  print (mytail xs)
  print (myzip xs xs)
  print (mystery [1,2,3,4,5])
  print (mystery [1,2,2,4,5])
  print (mystery [1,2,3,4])
  print (mystery [1])
  print (mystery [])
