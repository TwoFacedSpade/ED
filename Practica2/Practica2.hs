{-
Funcion: SayHello
Descripcion: Recibe una cadena de texto y devuelve su concatenacion con "Hello"
Uso: SayHello "Haskell"  = Hello, Haskell
-}
sayHello :: String -> String
sayHello s = "Hello, "++ s ++"!"


{-
Funcion: calcularPropina
Descripcion: Recibe dos numeros flotantes (la cuenta y el porcentaje de propina) y devuelve un flotante (la propina)
Uso: calcularPropina 1000 = calcularPropina 100  10%
calcularPropina 1000 = calcularPropina 150  10%
-}
calcularPropina ::  Float -> Float -> Float 
calcularPropina x y =
  if y==10 then x*(y/100) 
    else if y==15 then x*(y/100) 
    else 0


{-
Funcion: menor 
Descripcion: Determina el menor de 3 numeros
Uso: menor (123, 4, 56) = 4
-}
menor :: (Int, Int, Int) -> Int
menor (x, y, z) =
  if x < y && x < z
  then x
    else if y < x && y < z
    then y
      else if z < y && z < x
      then  z
      else 0


{-
Funcion: decide
Descripcion: Recibe un booleano y dos cadenas y devuelde la primera si el valor es ture devuelve la segunda en otro caso
Uso: decide True "Primera" "Segunda" = "Primera"
decide False "Primera" "Segunda" = "Segunda"
-}
decide :: Bool -> String -> String -> String
decide x y z =
  if x == True
  then  y
  else  z


{-
Funcion: esDecendiente
Descripcion: Recibe cuatro enteros y devuelve True si los numeros fueron ingresados de manera descendente devuelve false en otro caso
Uso: esDescendiente 10 9 8 7  = True  
esDescendiente 11 15 58 7 = False
-}
esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente a b c d =
  if b == a-1 && c == a-2 && d == a-3
  then True
  else False


{-
Funcion: esDivisible
Descripcion: Recibe dos enteros y devuelve una cadena del tipo: "x es divisible por y"
Uso: esDivisible 4 2 = 4 es divisible por 2 
-}
esDivisible :: Int -> Int -> String
esDivisible x y =
  if y == 0
  then "No es posible dividir entre 0"
    else if x `mod` y == 0
    then show x ++ " es divisible por " ++ show y
    else  "Los numeros no son divisibles entre si"


{-
Funcion: hipotenusa
Descripcion: Recibe dos flotantes donde h es la altura y b es la base  y devuelve un flotante que es la hipotenusa de un triangulo rectangulo 
Uso: hipotenusa 9.0 12.0 = 15.0 
-}
hipotenusa :: Float -> Float -> Float
hipotenusa x y  = sqrt(x^2 + y^2)


{-
Funcion: Pendiente
Descripcion: Recibe dos tuplas de dos elementos de tipo flotante y debe devolver otro flotante que represente la pendiente de la recta que pasa por esos puntos  
Uso: pendiente (3.0,2.0) (7.0,8.0) = 1.5 
-}
pendiente :: ((Float, Float), (Float, Float)) -> Float  
pendiente ((a, b), (c, d)) = (d - b)/(c - a)


{-
Funcion: Distancia entre dos puntos
Descripcion: Recibe dos tuplas de dos elementos de tipo flotante y debe devolver otro flotante que represente la distancia entre estos dos puntos  
Uso: distanciaPuntos (2.0,1.0) (5.0,5.0) = 5.0 
-}
distanciaPuntos :: ((Float, Float), (Float, Float)) -> Float  
distanciaPuntos ((a, b), (c, d)) = sqrt((c-a)^2 + (d-b)^2)


{-
Funcion: Cuadrados
Descripcion: Recibe una tupla de tipo entero y devuelve los cuadrados de los numeros dentro del rango de la tupla en una lista
Uso: cuadrados [1..5] = [1,4,9,16,25]
-}
cuadrados :: (Int, Int) -> [Int]
cuadrados (a,b) = [a*a | (a) <- [a..b]]


{- [operacion] == a*a multiplica el elemento por si mismo
   [generador] == (a) <- [a..b] mientras el elemento se encuentre en el rango que nos dio la tupla
   [condiciones] == no hay, se toman todos los elementos
-}
