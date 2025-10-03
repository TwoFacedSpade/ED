# Practica 05
#### Estructuras Discretas 2026-1
##### Jose Gabriel Gutierrez Guillen
 
1. ***Objetivo de la practica***
- Repasar lo aprendido en clase 
2. ***Descripcion de las funciones***
-**hollerback** Ya que la funcion solo cambia una cadena a mayusculas, el caso base es si la cadena es vacia y luego solo recorre la lista de caracteres de cabeza a rabo cambiando la cabeza a mayusculas
-**palindromo** lo mismo que la funcion anteriro pero el caso recursivo ocupa una funcion auxiliar para comparar la cadena original con el reverso y si es igual osea un palindromo devuelve True
-**replica** el caso base es tener 0, lo que devuelve una lista vacia pues replicar un numero 0 veces no es nada y el caso recursivo es concatenar el numero y luego volver a llamar la funcion  con el mismo numero y restando 1 al numero de replicas
hasta llegar al caso base
-**RecuperaElemento** hay dos casos base, uno si el indice es 0 y otro si la lista es vacia, si el indice es 0 devuelve la cabeza, si la lista es vacia entonces el indice es mayor a la longitud de la lista por lo que da un error, el caso recursivo es volver a llamar la funcion con la cola de la lista y restandole 1 al indice hasta llegar al caso base
-**Rota** Igual que la funcion anterior hay 2 casos base, si rotas la lista 0 veces por lo que devuelves la lista y si la lista es vacia por lo que devuelves la lista vacia, el caso recursivo fue un poco complicado por el como debe funcionar cuando el indice es negativo, mi solucion fue volver a llamar la funcion con la lista pero como numero de rotaciones pongo el numero de longitud de la lista menos el numero de rotaciones que, como es negativo debo sumarlo pues (-) (-1) = 1 asi que lo sumo al numero de longitud de la lista lo que hace que la funcion rote la lista un numero de veces igual a la longitud menos el indice de rotaciones lo que cumple con la funcion de las pruebas unitarias, si el indice de rotaciones es positivo solo roto la lista de manera normal, añadiendo la cabeza al final de la lista y restandole 1 al indice de rotaciones 
-**Estranio** simplemente seguí la descripcion del documento, dividelo entre 2 si es par, multiplicalo por 3 y sumale 1 si es impar hasta que sea 1 o 0 
2. ***Tiempo para completar la practica***
- 5 horas aproximadamente 
3. ***Comentarios sobre la practica***
- No fue tan dificil y es agradable tener las pruebas unitarias como guia para saber si las funciones son correctas 
- No se como podrias definir las funciones como suma o resta sin los simbolos y sin usar tu propio tipo de dato. 
