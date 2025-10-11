module Aux ( Arbol(Vacio,AB), buscami, buscamaxi, listea, quicksort, zacabeza, zacola, preorden, inorden, postorden, diferencia, nivel)  where 
data Arbol a= Vacio | AB a  (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

buscami:: (Ord a) => a -> Arbol a -> a
buscami x Vacio = x
buscami x (AB a t1 t2)
  | x <= a = min (buscami x (t1)) (buscami x (t2))  
  | x > a  = min (buscami a (t1)) (buscami a (t2)) 

buscamaxi:: (Ord a) => a -> Arbol a -> a
buscamaxi x Vacio = x
buscamaxi x (AB a t1 t2)
  | x <= a = max (buscamaxi a (t1)) (buscamaxi a (t2))  
  | x > a  = max (buscamaxi x (t1)) (buscamaxi x (t2)) 

listea :: Arbol a -> [a]
listea Vacio = []
listea (AB a Vacio Vacio) = [a] 
listea (AB a t1 t2) =   [a] ++ listea(t1)  ++ listea(t2)

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  quicksort (filter (<= x) xs)
  ++ [x] ++
  quicksort (filter (>= x) xs)

zacabeza :: [a] -> a
zacabeza [] = error "No mandaste nada tarado"
zacabeza (x:xs) = x

zacola :: [a] -> a
zacola [] = error "No mandaste nada tarado"
zacola [x] = x
zacola (x:xs) = zacola(xs)


preorden :: Arbol a -> [a]
preorden Vacio = []
preorden (AB a t1 t2) = [a] ++ preorden(t1) ++ preorden(t2)

inorden :: Arbol a -> [a]
inorden Vacio = []
inorden (AB a t1 t2) =  inorden(t1) ++ [a] ++ inorden(t2)

postorden :: Arbol a -> [a]
postorden Vacio = []
postorden (AB a t1 t2) =  postorden(t1) ++ postorden(t2) ++  [a]


diferencia :: Int -> Int -> Bool 
diferencia 0 0 = True
diferencia 0 1 = True
diferencia 1 0 = True
diferencia 0 y = False
diferencia x 0 = False
diferencia x y = diferencia(x-1) (y-1)

nivel :: Arbol a -> Int
nivel Vacio = 0
nivel (AB a t1 t2)= 1 + max (nivel t1) (nivel t2)

