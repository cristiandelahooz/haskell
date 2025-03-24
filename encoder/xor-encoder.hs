import Data.Char -- (intToDigit)

type Bit = Int

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

toHexi :: Int -> Char
toHexi n = if n > 9 then chr (n + 55) else chr (48 + n)

toHexa :: Int -> String
toHexa n =
  let (q, r) = n `divMod` 16
   in toHexi (q) : toHexi (r) : []

str2Hex :: String -> String
str2Hex [] = []
str2Hex (c : cs) = concat $ toHexa (ord (c)) : map (\x -> toHexa ((ord (x)))) cs

exor :: Int -> Int -> Int
exor a b
  | a == b = 0
  | otherwise = 1

stHex :: [Int] -> [Int] -> [Int]
stHex ns ms = zipWith exor ns ms

ss = "Hola a todos en este fresco dia. Como les va?"
rs = encode ss
ts = decode rs
vs = str2Hex ss
cs = "A mi me va bien"
ps = take (length ss) $ concat $ repeat cs
qs = encode ps
xs = stHex rs qs

main :: IO ()
main = do
  print ss
  print rs
  print ts
  print vs
  print qs
  print ps
  print xs
