module Practica5 where
import Data.Char
import Aux

{-
Funcion: HollerBack
Descripcion: Convierte una cadena a mayusculas
Uso: hollerBack "haskell" = HASKELL
-}
hollerBack :: String -> String
hollerBack [] = []
hollerBack malis = [toUpper (head malis)] ++ hollerBack(tail malis) 


{-
Funcion: Palindromo
Descripcion: Revisa si una cadena es un palindromo
Uso: palindromo "ana" = True
-}
palindromo :: Eq a => [a] -> Bool
palindromo [] = True
palindromo (x:xs) =
  if (x:xs) == (reversa(x:xs))
  then True
  else False


{-
Funcion: Replica
Descripcion: Crea una lista añadiendo n veces el elemento x
Uso: replica 2 5 = [2,2,2,2,2]
-}
replica :: Int -> Int -> [Int]
replica x 0 = []
replica x y = x : replica x (y-1)


{-
Funcion: Recupera Elemento
Descripcion: Devuelve el elemento en el indice x de la lista
Uso: recuperaElemento [2,4,6] 1 = 4
-}
recuperaElemento :: [a] -> Int -> a
recuperaElemento lisa 0 = head lisa
recuperaElemento [] x = error "Lista Vacia"
recuperaElemento lisa x  = recuperaElemento (tail lisa)  (x -1 )


{-
Funcion: Rota
Descripcion: mueve el primer elemento de la lista al final de la lista n veces 
Uso: rota [1,2,3,4,5] 2 = [3,4,5,1,2]
     rota [1,2,3,4,5] 13 = [4,5,1,2,3]
-}
rota :: [Int] -> Int -> [Int]
rota [] x = []
rota (y:ys) 0 = (y:ys)
rota (y:ys) x =
  if x < 0
  then  rota ( y:ys)  ( longitud(y:ys) + x ) 
  else rota ( ys ++ [y])  (x-1)


{-
Funcion: Extranio
Descripcion: Dado un elemento x hace lo siguiente
	     Si es par, lo divide entre 2
	     Si es inpar, lo multiplica por 3 y suma 1
	     Repite el algoritmo hasta que x sea 1 
Uso: extranio 13 = [13,40,20,10,5,16,8,4,2,1]
-}
extranio :: Int -> [Int]
extranio 1 = [1]
extranio 0 = [0]
extranio x =
  if x <= 0
  then [0]
  else
  [x] ++
  if (x `mod` 2) == 0
  then  extranio (x `div` 2)
  else  extranio ((x*3)+1)
