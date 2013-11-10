import qualified Newton as N

-- Constants
m_0 = 9.10938           -- [kg] mass of electron
hbar = 1.054572e-34     -- [Js] reduced Planck constant
q = 1.602177e-19        -- [C] elementary charge

-- Helper Functions
log10 = logBase 10
logspace start stop count = [10**x | x <- [lstart, lstart + lstep .. lstop]]
  where
    lstart = log10 start
    lstop = log10 stop
    lstep = (lstop - lstart) / (count - 1)
jToEV joules = joules / q 

charEqu p x = p * sin x / x + cos x + 1
pArray = logspace 0.1 1000 1000
equArray = map charEqu pArray
alphaAArray = map (\x -> N.solve x (N.guess x (1.1*pi, 2*pi))) equArray
egArray = map e alphaAArray
  where
    e alpha = alpha - pi

main = mapM_ putStrLn [show x ++ ", " ++ show y |(x,y) <- zip pArray egArray]