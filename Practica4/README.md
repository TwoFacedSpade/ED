# Practica 04
#### Estructuras Discretas 2026-1
##### Jose Gabriel Gutierrez Guillen
 
1. ***Objetivo de la practica***
- Repasar lo aprendido en clase 
2. ***Descripcion de las funciones***
-**a_natural** el caso base es que el entero recibido sea mayor a cero pues el valor mas pequeño del tipo de dato Natural es cero y en la funcion auxiliar pasas es el mismo caso base ya que la funcion reduce el entero en 1 por cada ciclo y añade una S al numero Natural que genera y cuando llega al caso base añade finalmente el 0 que completa el resultado.
-**a_entero** el caso base es que el natural recibido sea igual a Cero porque al ser de tipo Natural, solo podemos comprobar si lo recibido es igual a lo que definimos en este caso Cero y funciona de la misma manera que la funcion anterior, quitandole un sucesor al Natural y sumando 1 al entero que estamos generando hasta que llegue al Cero y sumamos 0 obteniendo el entero deseado.
-**potenciaNat**, el caso base es que un Natural sea elevado a la Cero, en tal caso devolvemos un 1 o en notacion Natural (S Cero) y el caso recursivo es igual a la forma recursiva normal de la potencia, x * potencia (x, n-1) lo que solo es multiplicar el numero por el mismo numero pero restandole 1 a la potencia hasta llegar a Cero donde lo multiplicamos por 1 lo que resulta en el mismo numero osea el numero a la potencia n.
-**facNat** el caso base es el factorial de Cero lo que regresa (S Cero) como en un factorial comun y corriente, el caso recursivo al igual que en la potencia es el mismo que en el factorial normal x * (x-1) hasta que x llegue a Cero y el numero se multiplica por 1 dando el factorial del numero deseado.
-**mayorIgual** esta funcion ocupa tres casos base uno para determinar cada caso, si es mayor, menor o igual y el caso recursivo es quitarle un contenedor (Cont) a los elementos recibidos hasta que uno o ambos lleguen a cualquiera de los casos base
-**aplana** el caso base es si la lista recibida tiene un solo elmento el que seria [Mati] de otro modo el caso recursivo es igual que la funcion anterior con el ligero cambio de que antes de quitarle un contenedor a la lista, lo concatenamos antes y luego introducimos el elemento reducido en 1 a la funcion hasta llegar al  caso base.
2. ***Tiempo para completar la practica***
- 4 horas aproximadamente 
3. ***Comentarios sobre la practica***
- No fue tan dificil como la practica anterior por todo lo que habiamos hecho en clase, lo mas dificil fue comprender la manera en las que debia aplicar las funciones multiplicacion para ajustarse a las nuevas funciones

