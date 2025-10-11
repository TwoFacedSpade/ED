{-
Funcion: Creditos
Descripcion: Recibe un entero y devuelve la materia o materias que tienen ese mismo numero de creditos
Uso: creditos 10 [Introduccion a las CC]

Hola profe, me podria decir en los comentarios de classroom si esta otra implementacion seria valida, porque en los lineamientos no decia que puedieramos usar pattern matching, gracias
 
creditos :: Int -> [String]
creditos 10 = ["Algebra Superior 1", "Estructuras Discretas"]
creditos 12 = ["Introduccion a Ciencias de la computacion","Matematicas para las Ciencias Aplicadas 1"]
creditos 4 = ["Ingles 1"]
creditos _ = ["No hay una materia con esa cantidad de creditos"]

tambien tenia esta otra forma pero no supe como hacerla funcionar

materias =[(10,"Algebra Superior 1"), (10,"Estructuras Discretas"), demas materias]
creditos :: Eq a=> a -> materias -> [b]
creditos c l = [ m | (c', m) <- l, c' == c ]

El problema fue que no se como usar una lista que yo cree (en este caso materias) como argumento de la funcion, siempre me saltaba el error de que
materias y l no coincidian en sus tipos, no importa como intente escribirlo nunca funciono.
-}
creditos :: Int -> [String]
creditos x =
  if x==10
  then  ["Algebra Superior 1", "Estructuras Discretas"]
    else if x == 12
    then ["Introduccion a Ciencias de la computacion","Matematicas para las Ciencias Aplicadas 1"]
      else if x == 4
      then  ["Ingles 1"]
      else ["No hay una materia con esa cantidad de creditos"]


{-
Funcion: Negativos
Descripcion: Cuenta los numeros negativos de una lista 
Uso: negativos [-2,-1,0,1,2] = 2
-}
negativos :: [Int] -> Int
negativos xs = length[ x | x <- xs, x < 0 ]
Funcion: Primos
Descripcion: Devuelve los numeros primos desde 1 hasta el elemento indicado por el usuario
Uso: primos 20 = [2,3,5,7,11,13,17,19]

Con este tuve el mismo problema que con conjuntoLista, en una sola lista no encontre la forma de recorrer los elementos sin dejar la lista vacia por lo que buscando en internet
encontre esta manera que funciona de la siguiente manera:

primos recibe un numero que sera el limite de la lista y empieza a recorrer desde 1, manda el valor actual a esprimo que lo manda a factores.
factores evalua los factores del numero en forma de una lista y lo devuelve a esprimo, si la lista que manda factores a esprimo es igual a [1,x]
osea 1 y el mismo numero lo que efectivamente seria un numero primo, devuelve true a primos lo que hace que primos meta el valor en la lista y
pase al siguiente valorm, asi hasta llegar al valor tope que introdujo el usuario
-}
factores :: Int->[Int]
factores x = [y | y <-[1..x], (mod x y)==0]

esprimo :: Int ->Bool
esprimo x = (factores x) == [1,x]

primos :: Int->[Int]
primos x = [ n | n <- [1..x], esprimo n ]


{-
Funcion: ConjuntoLista
Descripcion: Quita los elementos repetidos de la lista 
Uso: conjuntoLIsta [1, 2, 2, 1, 3] = [1,2,3]

Esta implementacion la use aunque usa recursion y pattern matching porque no encontre otra forma de comparar los elementos de la lista sin eliminar todos los elementos,
me refiero a que usaba como condicion (x/=x) lo que dejaba la lista vacia y no encontre una forma de recorrer la lista por lo que buscando tutoriales en internet encontre esta forma de hacerlo
con recursion y como vimos un poco de recursion en clase pense que estaria bien.
-}


conjuntoLista :: [Int] -> [Int]
conjuntoLista [] = []
conjuntoLista [x] = [x]
conjuntoLista (x:xs) = x: [y | y <- conjuntoLista(xs), y/=x]

{-
Hola profe, esta es otra forma que se me ocurrio el 19/19/2025, no le haga caso, solo lo pongo porque en otra tarea me pidieron esta msima fucncion y queria ver si era correcta
Es lo mismo que la de arriba pero sin usar la lista por comprension, solo usando recursion y pattern matching

conjuntoLista :: [Int] -> [Int]
conjuntoLista [] = []
conjuntoLista [x] = [x]
conjuntoLista (x:xs) =
  if check(x, xs) == True
  then x: conjuntoLista(xs) 
  else  conjuntoLista(xs)

check :: (Int, [Int]) -> Bool
check (a,[]) = False
check ((a),(x:xs)) =
  if a == x
    then True
    else check(a, xs)
-}
  