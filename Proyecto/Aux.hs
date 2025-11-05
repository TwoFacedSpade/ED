module Aux ( Huffa(Vacio,Nodo), tablaFrecuencias, transformador, traductor, arbol, decodificador )  where 
import Data.List
import Data.Function
data Huffa = Vacio | Nodo Huffa Char deriving (Eq, Ord, Show)

{- *****************************************
   ** 
   **  Hola profe, puede que algunos de los Usos esten mal porque se me olvido probar
   **  las funciones individualmente y los puse de memoria, lo corregiré en la entrega final :D
   **
   *****************************************
-}

{- *****************************************
   ** 
   **  La mayoria de las funciones que me molestan son porque como guardo los valores en tuplas (las tablas)
   **  necesito una funcion para que recorra la lista de tuplas y otra funcion para que haga las operaciones
   **  que quiero con esas tuplas el mejor ejemplo seria recorrido que lo unico que hace es añadir un cero a 
   **  la variable margo y pasar al siguiente elemento de la tupla
   **
   *****************************************
-}


{- *****************************************
   ** 
   **   Tablas
   **
   *****************************************
-}
{-
  Funcion: tablaFrecuencias
  Descripcion: Crea una tabla de frecuencia de las letras en una frase ordenada de manera ascendente  
-}
tablaFrecuencias :: String -> [(Char, Int)]
tablaFrecuencias [] = []
tablaFrecuencias (x:xs) = sorte( [(x , (1 + cuentaApariciones x xs ))] ++ tablaFrecuencias(yaEvaluados x xs) ) 

{-
  Funcion: cuentaApariciones
  Descripcion: cuenta las veces que aparece una letra en la frase
-}
cuentaApariciones :: Char -> String -> Int
cuentaApariciones c [] = 0
cuentaApariciones c (x:xs) = 
  if c == x 
  then 1 + cuentaApariciones c xs
  else cuentaApariciones c xs


{-
  Funcion: yaEvaluados
  Descripcion: elimina las apariciones de las letras que ya se evaluaron 
-}
yaEvaluados :: Char -> String -> String
yaEvaluados c [] = []
yaEvaluados c (x:xs) = 
  if c == x 
  then yaEvaluados c xs
  else [x] ++ yaEvaluados c xs 


{-
  Funcion: sorte
  Descripcion: Ordena la tabla de valores de manera ascendente
  Esta la saque de internet, no se muy bien como funciona, pero funciona 
-}
sorte :: (Ord b) => [(a,b)] -> [(a,b)]
sorte = sortBy (flip compare `on` snd)

{- *****************************************
   ** 
   **   fin Tablas
   **
   *****************************************
-}


{- *****************************************
   ** 
   **   Arbol
   **
   *****************************************
-}

{-
  Funcion: arbol
  Descripcion: Crea el arbol de acuerdo a la tabla de frecuencias
  Uso: arbol [('a',1),('b',1),('c',1)] =  Nodo (Nodo (Nodo Vacio 'c') 'b') 'a'
-}
arbol :: [(Char, Int )] -> Huffa
arbol [] = Vacio
arbol (x:xs) =  Nodo (arbol xs) (nodito x)

{-
  Funcion: nodito
  Descripcion: devuelve el char de la tupla
  Uso: nodito ('a',1) = a
-}
nodito :: (Char, Int) -> Char
nodito (a,b) = a

{- *****************************************
   ** 
   **   fin arbol 
   **
   *****************************************
-}


{- *****************************************
   ** 
   **   binarios
   **
   *****************************************
-}
{-
  Funcion: traductor
  Descripcion: devuelve el binario de una frase de acuerdo a la frase y su tabla de binarios
  Uso: traductor "hambre" [('h',"1"),('a',"01"),('m',"001"),('b',"0001"),('r',"00001"),('e',"000001") ]   = "101001000100001000001"
-}
traductor :: String -> [(Char, String)] -> String
traductor [] (x:xs) = []
traductor (y:ys) (x:xs) = tra y (x:xs) ++ traductor ys (x:xs)

{-
  Funcion: tra
  Descripcion: evalua una letra de la frase con su tabla de binarios
  Uso: tra "h" [('h',"1"),('a',"01"),('m',"001"),('b',"0001"),('r',"00001"),('e',"000001") ]   = "h"
-}
tra :: Char -> [(Char, String)] -> String 
tra x [] = []
tra x (y:ys) = tr x y ++ tra x ys


{-
  Funcion: tr
  Descripcion: evalua una letra de la frase con una tupla de su tabla de binarios
  Uso: tr "h" ('h',"1")   = "h"
       tr "a" ('h',"1")   = []
-}
tr :: Char -> (Char, String) -> String
tr x (a,b) = 
  if x == a 
  then b 
  else []

-- variable para la cadena binaria de cada letra
margo = "1"

{-
  Funcion: transformador
  Descripcion: Cambia los enteros de una tabla de frecuencia por binarios
  Uso transformador [('a',9), ('b',2), ('c',1)] = [('a',"1"), ('b',"01"), ('c',"001")]
-}
transformador :: [(Char, Int)] -> [(Char, String)]
transformador [] = []
transformador (x:xs) = [binario margo (x)]  ++ recorrido ( "0" ++ margo ) xs  

{-
  Funcion: recorrido 
  Descripcion: recorre la lista añadiendo 0 a la variable margo para cambiar el valor del binario
  Osea que cambia el valor del binario y va al siguiente valor de la lista
  realmente no hace gran cosa, ¿podria eliminarlo?
  Uso: recorrido "1" [('a',9), ('b',2), ('c',1)] -> recorrido "01" [('b',2), ('c',1)]
-}
recorrido :: String -> [(Char, Int)] -> [(Char, String)]
recorrido margo [] = []
recorrido margo (x:xs) = [binario margo (x)]  ++ recorrido ( "0" ++ margo ) xs  

{-
  Funcion: binario
  Descripcion: Cambia el entero del elemento por una cadena que represente su valor binario
  Uso: binario "1" ('a',9) = ('a',"1")
-}
binario :: String -> (Char, Int) -> (Char, String)
binario margo (a,b) = (a,margo) 


{- *****************************************
   ** 
   **   fin binarios
   **
   *****************************************
-}


{- *****************************************
   ** 
   **  decodificadores
   **
   *****************************************
-}
{-
  Funcion: decodificador
  Descripcion: Decodifica un binario de acuerdo con su arbol Huffa 
  Uso: decodificador ("101001",Nodo (Nodo (Nodo Vacio 'c') 'b') 'a') = "abc"
-}
decodificador :: (String, Huffa) -> String
decodificador ([] , huff) = []
decodificador ( (x:xs) , huff ) = check (x:xs) huff  ++ decodificador ( (ceros (x:xs) ) , huff)


{-
  Funcion: check
  Descripcion: evalua una letra del binario de acuerdo a su arbol Huffa
  Uso: check 101001 huffa = "a"
  
  suponiendo que el arbol se ve asi: 
  huffa = Nodo (Nodo (Nodo Vacio 'c' ) 'b') 'a'
-}
check :: String -> Huffa -> String
check (x:xs) (Nodo ti a) = 
  if x == '1'
  then [a]
  else check xs ti 


{-
  Funcion: ceros
  Descripcion: Elimina los ceros innecesarios de una letra que ya se evaluo por check
  Uso: ceros 001000010001 = 000010001
-}
ceros :: String -> String
ceros [] = []
ceros (x:xs) = 
  if x == '1' 
  then xs
  else ceros xs
   
{- *****************************************
   ** 
   **  fin  decodificadores 
   **
   *****************************************
-}

{-
   +--------------+
   |.------------.|
   ||  Gracias   ||
   ||  Profe     ||
   ||  Irvin     ||
   ||  :D        ||
   |+------------+|
   +-..--------..-+
   .--------------.
  / /============\ \
 / /==============\ \
/____________________\
\____________________/

-}