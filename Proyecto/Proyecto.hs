import Data.List
import Data.Function
-- data Arbol Cha | AB Char  (Arbol Char) (Arbol Char) deriving (Eq, Ord, Show)
data Huffa = Vacio | Hoja Char | Nodo Huffa Huffa
--data Arbol a= Vacio | AB a  (Arbol a) (Arbol a) deriving (Eq, Ord, Show)


huffman :: String -> String 
huffman [] = []
huffman frase = traductor frase (transformador(recibetexto(frase)))

traductor :: String -> [(Char, String)] -> String
traductor [] (x:xs) = []
traductor (y:ys) (x:xs) = tra y (x:xs) ++ traductor ys (x:xs)

tra :: Char -> [(Char, String)] -> String 
tra x [] = []
tra x (y:ys) = tr x y ++ tra x ys

tr :: Char -> (Char, String) -> String
tr x (a,b) = 
  if x == a 
  then b 
  else []

recibetexto :: String -> [(Char, Int)]
recibetexto [] = []
recibetexto (x:xs) = sorte( [(x , (1 + aparece x xs ))] ++ recibetexto(eliminar x xs) ) 

aparece :: Char -> String -> Int
aparece c [] = 0
aparece c (x:xs) = 
  if c == x 
  then 1 + aparece c xs
  else aparece c xs

eliminar :: Char -> String -> String
eliminar c [] = []
eliminar c (x:xs) = 
  if c == x 
  then eliminar c xs
  else [x] ++ eliminar c xs 

sorte :: (Ord b) => [(a,b)] -> [(a,b)]
sorte = sortBy (flip compare `on` snd)

margo = "1"

transformador :: [(Char, Int)] -> [(Char, String)]
transformador [] = []
transformador (x:xs) = [binario margo (x)]  ++ recorrido ( "0" ++ margo ) xs  

recorrido :: String -> [(Char, Int)] -> [(Char, String)]
recorrido margo [] = []
recorrido margo (x:xs) = [binario margo (x)]  ++ recorrido ( "0" ++ margo ) xs  

binario :: String -> (Char, Int) -> (Char, String)
binario margo (a,b) = (a,margo) 