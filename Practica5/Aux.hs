module Aux (reversa, longitud) where

{-
Funcion: reversa
Descripcion: te da el reverso de una cadena
Uso: reversa ana = ana
-}
reversa :: [a] -> [a]
reversa [] = []
reversa lala = reversa(tail lala) ++ [head lala]


{-
Funcion: longitud
Descripcion: te da la longitud de una lista
Uso: reversa [1,2,3] = 3
-}
longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)
