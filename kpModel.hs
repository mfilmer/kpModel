import qualified Newton as N

-- Constants

-- Helper Functions
log10 = logBase 10
logspace start stop count = [10**x | x <- [lstart, lstart + lstep .. lstop]]
  where
    lstart = log10 start
    lstop = log10 stop
    lstep = (lstop - lstart) / (count - 1)

charEqu p x = p * sin x / x + cos x + 1
pArray = logspace 0.1 1000 100
equArray = map charEqu pArray
egArray = map (\x -> N.solve x (1.5*pi)) equArray

main = mapM putStrLn [show x ++ ", " ++ show y |(x,y) <- zip pArray egArray]