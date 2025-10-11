 import Aux

{-
Funcion: a_natural
Descripcion: Transforma un entero a su estructura de dato natural  
Uso: a_natural 0 = Cero
-}
a_natural :: Int -> Natural
a_natural x =
  if x > 0
  then pasas(x)
  else Cero


{-
Funcion: a_entero
Descripcion: Transforma un natural a su estructura de dato entero  
Uso: a_entero Cero = 0
-}
a_entero :: Natural -> Int
a_entero x =
  if x == Cero
  then 0
  else pasas2(x)


{-
Funcion: potenciaNat
Descripcion: Eleva un numero natural a la potencia del segundo  
Uso: potenciaNat (S(S(S(Cero))) (S(S(Cero))) = S(S(S(S(S(S(S(S(S(Cero)))))))))
-}
potenciaNat :: Natural -> Natural -> Natural 
potenciaNat (S o) Cero = (S Cero)
potenciaNat (S o) (S p) = multiNat (S o) (potenciaNat (S o) p ) 


{-
Funcion: facNat
Descripcion: Devuelve el factorial de un Natural  
Uso: facNat (S(S(S(Cero))) = (S(S(S(S(S(S Cero))))))
-}
facNat :: Natural -> Natural
facNat  Cero = (S Cero)
facNat (S n) = multiNat (S n) (facNat n) 
