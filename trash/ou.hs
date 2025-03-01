rmcar :: (Eq a) => a -> [a] -> [a]
rmcar _ [] = []
rmcar d (c:ss) = if c == d then rmcar d ss else c : (rmcar d ss)

main :: IO ()
main = do
    let as = ["Bienvenidos", "el", "dia", "de", "hoy luce", "brillante"]
        result = take 6 $ drop 10 $ rmcar ' ' $ unwords $ reverse as
        another = reverse as
    print result
    print $ rmcar ' ' $ unwords $ another
--brillantelucehoydediaelbienvenidos
