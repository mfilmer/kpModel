module Newton where
--module Newton (step, solve, slope) where

-- Made up number for epsilon
epsilon = 1e-5
slope :: (Double -> Double) -> Double -> Double
slope func x = (func (x+inc) - func (x-inc))/(2*inc)
  where
    inc = if x == 0
            then epsilon
            else x * epsilon

step :: (Double -> Double) -> Double -> Double
step func x = (m*x - func x) / m
  where
    m = slope func x

solve :: (Double -> Double) -> Double -> Double
solve func x = iterate (step func) x !! 99
