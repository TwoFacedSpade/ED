# Proyecto 
## Codificación de Huffman (Variante)
#### Estructuras Discretas 2026-1
##### Jose Gabriel Gutierrez Guillen
 
***Objetivo del proyecto***
- Usar todo lo aprendido durante el primer semestre en el laboratorio de Estructuras Discretas para generar una variante del algoritmo de compresion de datos Huffman.

### ***Funcionamiento del proyecto***
:lock: Codificacion de la palabra
   
    a) Se toma la palabra y se forma su tabla de frecuencias, contando las apariciones de cada letra y ordenando dicha tabla de manera ascendente.

    b) Usando la tabla de frecuencias del inciso a,  se cre el arbol dejando como sub-arbol derecho el caracter y como subarbol izquierdo los demas valores, ademas se cambian los valores enteros de la tabla por binarios.

    c) Ya con la tabla de binarios se traduce la frase original a su cadena binaria.

    d) devolvemos ambos el arbol y la cadena binaria.

:unlock: Decodificacion de la palabra
   
    e) Recibe el arbol y la cadena binaria.

    f) Recorre el binario y el arbol al mismo tiempo hasta que encuentre un "1" en el binario y devuelve el caracter de esa hoja

    g) Repite el proceso hasta que se recorran todos los valores de la cadena binaria y devuelve la frase original

### ***Ejecucion***

:floppy_disk: Clonar el repositorio   

    git clone https://github.com/TwoFacedSpade/ED.git
    
    #Ir a la carpeta del Proyecto
    
    #Abrir Proyecto.hs con ghci
    ghci Proyecto.hs

    #Introducir la frase que quieras codificar 
    Huffman_Codificador "tu frase favorita"

    ("0100000100100010000110000001000000010010001100000000100000000010000100000000001011",Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio 'i') 'o') 'v') 'e') 's') 'u') 'r') 'f') ' ') 't') 'a')

    #Decodificar el resultado del codificador 
    Huffman_Decodificador("0100000100100010000110000001000000010010001100000000100000000010000100000000001011",Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio 'i') 'o') 'v') 'e') 's') 'u') 'r') 'f') ' ') 't') 'a')

    "tu frase favorita"

***Tiempo para completar el proyecto***
- 4 dias.
