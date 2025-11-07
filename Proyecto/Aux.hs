module Aux ( Huffa(Vacio,Nodo), tablaFrecuencias, transformador, traductor, arbol, decodificador )  where 
data Huffa = Vacio | Nodo Huffa Char deriving (Eq, Ord, Show)

{- *****************************************
   ** 
   **   Tabla
   **
   *****************************************

  Funcion: tablaFrecuencias
  Descripcion: Crea una tabla de frecuencia de las letras en una frase ordenada de manera ascendente  
-}
tablaFrecuencias :: String -> [(Char, Int)]
tablaFrecuencias [] = []
tablaFrecuencias (x:xs) = quicksort( [(x , (1 + cuentaApariciones x xs ))] ++ tablaFrecuencias(yaEvaluados x xs) ) 

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
  Funcion: quicksort
  Descripcion: Ordena la tabla de valores de manera descendente
  Uso: quicksort [('a',2),('b',3),('c',6),('d',10)] = [('d',10),('c',6),('b',3),('a',2)]
-}
quicksort :: (Ord b) => [(a,b)] -> [(a,b)]
quicksort [] = []
quicksort ((a,b):xs) =
  quicksort [x | x <- xs, snd x > b]
  ++ [(a,b)] ++
  quicksort [x | x <- xs, snd x <= b]

{- *****************************************
   ** 
   **   fin Tabla
   **
   *****************************************

*****************************************************************************

   *****************************************
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
arbol ((a,b):xs) =  Nodo (arbol xs) (a)

{- *****************************************
   ** 
   **   fin arbol 
   **
   *****************************************
  
*****************************************************************************

   *****************************************
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
traductor [] arbol = []
traductor (y:ys) arbol =  buscaTabla y arbol ++ traductor ys arbol 

{-
  Funcion: buscaTabla
  Descripcion: Busca un elemento de la cadena original en el arbol binario e intercambia su valor
  Uso: buscaTabla "a" [('h',"1"),('a',"01"),('m',"001"),('b',"0001"),('r',"00001"),('e',"000001") ] = "01"
-}
buscaTabla :: Char -> [(Char, String)] -> String
buscaTabla c [] = []
buscaTabla c ((a,b):xs) = 
  if c == a 
  then b 
  else buscaTabla c xs

-- variable para la cadena binaria de cada letra
margo = "1"

{-
  Funcion: transformador
  Descripcion: Cambia los enteros de una tabla de frecuencia por binarios
  Uso transformador [('a',9), ('b',2), ('c',1)] = [('a',"1"), ('b',"01"), ('c',"001")]
-}
transformador :: [(Char, Int)] -> [(Char, String)]
transformador [] = []
transformador (x:xs) = transformadorAux margo  (x:xs)

{-
  Funcion: transformadorAux 
  Descripcion: cambia el entero de un elemento de la tabla de frecuencias por su valor binario
  Uso: recorrido "1" [('a',9), ('b',2), ('c',1)] -> recorrido "01" [('b',2), ('c',1)]
-}
transformadorAux :: String -> [(Char, Int)] -> [(Char, String)]
transformadorAux margo [] = []
transformadorAux margo ((a,b):xs) = [(a,margo)]  ++ transformadorAux ( "0" ++ margo ) xs  

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

  Funcion: decodificador
  Descripcion: Decodifica un binario de acuerdo con su arbol Huffa 
  Uso: decodificador ("101001",Nodo (Nodo (Nodo Vacio 'c') 'b') 'a') = "abc"
-}
decodificador :: (String, Huffa) -> String
decodificador ([] , huff) = []
decodificador ( frase , huff ) = decodeAux frase huff huff 


{-
  Funcion: decodeAux
  Descripcion: Recorre el arbol binario y devuelve los caracteres segun el binario
  Uso: decodificador ("101001",Nodo (Nodo (Nodo Vacio 'c') 'b') 'a') = "abc"  
-}
decodeAux :: String -> Huffa -> Huffa -> String
decodeAux [] (Nodo iz c) original = []
decodeAux ('0':res) (Nodo iz _) original = decodeAux res iz original
decodeAux ('1':res) (Nodo _ c) original = [c] ++ decodeAux res original original


{- *****************************************
   ** 
   **  fin  decodificadores 
   **
   *****************************************
-}
