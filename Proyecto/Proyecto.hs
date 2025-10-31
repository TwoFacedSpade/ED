--data Arbol Char | AB Char  (Arbol Char) (Arbol Char) deriving (Eq, Ord, Show)
--data Huffa = Vacio | Hoja Char | Nodo Hufa Huffa

recibetexto :: String -> [(Char, Int)]
recibetexto [] = []
recibetexto (x:xs) = [(x , (1 + aparece x xs ))] ++ recibetexto(eliminar x xs) 

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
  else x + eliminar c xs 