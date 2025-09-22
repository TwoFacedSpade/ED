module Aux (pasas, pasas2, sumaNat, multiNat, Natural(Cero,S)) where
data Natural = Cero | S Natural deriving (Eq, Show)
pasas :: Int -> Natural
pasas x  =
  if x > 0
  then  S( pasas(x-1) )
  else (Cero)



pasas2 :: Natural -> Int 
pasas2 (Cero) = 0
pasas2 (S m) =
  if (S m) == Cero
  then  0 
  else 1+  pasas2(m)



sumaNat :: Natural -> Natural -> Natural
sumaNat Cero n = n
sumaNat (S m) n = sumaNat  m (S n)


multiNat :: Natural -> Natural -> Natural
multiNat Cero  n = Cero
multiNat (S m)  n =  sumaNat  n (multiNat m n ) 

