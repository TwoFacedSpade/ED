module Practica6 (Arbol(Vacio,AB), Reco(InOrden,PreOrden,PosOrden), nVacios, refleja, minimo, recorrido, esBalanceado, listaArbol) where
import Aux
data Reco =  InOrden | PreOrden | PosOrden 

{-
  Funcion: nVacios
  Descripcion: Devuelve el numero de nodos vacios en un arbol
  Uso: nVacios (AB 4 Vacio (AB 3 Vacio Vacio)) = 3
-}
nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB a t1 t2) = nVacios(t1) + nVacios(t2)


{-
  Funcion: refleja
  Descripcion: Hace a todos los subarboles izquierdos subarboles derechos y viceversa
  Uso: refleja (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = AB 4 (AB 3 (AB 5 Vacio Vacio) Vacio) Vacio
-}
refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB a t1 t2) = (AB a (refleja t2) (refleja t1))

{-
  Funcion: maxmin
  Descripcion: Saca el minimo o maximo de un Arbol segun la cadena que introduzca el usuario
  Uso: maxmin "minimo" (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 3
       maxmin "maximo" (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 5
-}
maxmin :: String -> (Ord a) => Arbol a -> a
maxmin [] (AB a t1 t2) = error "Pon bien los datos"
maxmin x Vacio = error "Pon bien los datos"
maxmin x (AB a t1 t2) 
  | x == "minimo" = minimo(AB a t1 t2)
  | x == "maximo" = maximo(AB a t1 t2) 


{-
  Funcion: maximo
  Descripcion: Saca el elemento maximo de un Arbol
  Uso: maximo  (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 5       
-}
maximo :: (Ord a) => Arbol a -> a
maximo (AB a Vacio Vacio) = a
maximo (AB a t1 t2) = max (buscamaxi a (t1)) (buscamaxi a (t2)) 


{-
  Funcion: minimo
  Descripcion: Saca el elemento minimo de un Arbol 
  Uso: minimov2  (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 3       
-}
minimo :: (Ord a) => Arbol a -> a
minimo (AB a Vacio Vacio) = a
minimo (AB a t1 t2) = min (buscami a (t1)) (buscami a (t2)) 

{-
  Funcion: maximov2
  Descripcion: Saca el elemento maximo de un Arbol
  Uso: maximov2  (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 5
  
maximov2 :: (Ord a) => Arbol a -> a
maximov2 (AB a Vacio Vacio) = a
maximov2 (AB a t1 t2) = zacola( quicksort( listea(AB a t1 t2) ) ) 


  Funcion: minimov2
  Descripcion: Saca el elemento minimo de un Arbol 
  Uso: minimo  (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = 3       

minimov2 :: (Ord a) => Arbol a -> a
minimov2 (AB a Vacio Vacio) = a
minimov2 (AB a t1 t2) = zacabeza( quicksort( listea(AB a t1 t2) ) )
-}

{-
  Funcion: recorrido
  Descripcion: Devuelve una lista con los elementos de un arbol de acuerdo a alguno de los tres recorridos 
  Uso: recorrido (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) Vacio)) PreOrden = [5,3,1,4,7,6]
       recorrido (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) Vacio)) InOrden  = [1,3,4,5,6,7]
       recorrido (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) Vacio)) PosOrden = [1,4,3,6,7,5]
-}
recorrido :: Arbol a -> Reco -> [a]
recorrido Vacio x = error "Datos Invalidos"
recorrido (AB a t1 t2) PreOrden = preorden(AB a t1 t2)  
recorrido (AB a t1 t2) InOrden  = inorden(AB a t1 t2)
recorrido (AB a t1 t2) PosOrden = postorden(AB a t1 t2)


{-
  Funcion: esBalanceado
  Descripcion: Verifica si un Arbol esta balanceado 
  Uso: esBalanceado (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) (AB 7 (AB 6 Vacio Vacio) Vacio)) = True
       esBalanceado (AB 5 (AB 3 (AB 1 Vacio Vacio) (AB 4 Vacio Vacio)) Vacio) = False
-}
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB a t1 t2) = diferencia (nivel t1) (nivel t2)  


{-
  Funcion: listaArbol
  Descripcion: Devuelve un arbol binario de busqueda con los elementos de una lista 
  Uso: listaArbol [5,3,7,1,9] = AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio)) 
       listaArbol [] = Vacio
-}
listaArbol :: (Ord a) => [a] -> Arbol a 
listaArbol [] = Vacio
listaArbol (x:xs) = (AB x (listaArbol (filter (<= x) xs)) (listaArbol(filter (>= x) xs)))

