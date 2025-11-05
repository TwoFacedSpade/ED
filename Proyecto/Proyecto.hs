import Aux

{-
  Funcion: huffmandecodificador 
  Descripcion: Decodifica un binario y un arbol huffman a su cadena de texto
  Uso: huffmandecodificador ("1010010001",Nodo (Nodo (Nodo (Nodo Vacio 'a') 'l') 'o') 'h') = hola
-}
huffmandecodificador :: (String, Huffa) -> String
huffmandecodificador (a,b) = decodificador (a,b)

{-
  Funcion: huffmancodificador 
  Descripcion: Codifica una cadena de texto a una variante de codificacion huffman
  Uso: huffmancodificador "hola" = ("1010010001",Nodo (Nodo (Nodo (Nodo Vacio 'a') 'l') 'o') 'h')
-}
huffmancodificador :: String -> (String, Huffa)
huffmancodificador [] = ([],Vacio ) 
huffmancodificador frase = ( (traductor frase (transformador (tablaFrecuencias(frase)))) , (arbol(tablaFrecuencias(frase)))   )