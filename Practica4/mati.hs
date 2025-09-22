data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{-
Funcion: mayorIgual
Descripcion: Compara dos Matrioscas y devuelve True si la primera es mayor o igual que la segunda
             devuelve false en otro caso
Uso: mayorIgual Mati Mati = True
     mayorIgual (Cont(Cont Mati)) (Cont(Cont(Cont(Cont Mati)))) = False
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual (Cont m) Mati= True
mayorIgual Mati  Mati = True
mayorIgual Mati (Cont n) = False
mayorIgual (Cont m) (Cont n) = mayorIgual m n

{-
Funcion: aplana
Descripcion: Convierte una Matrioska anidada en una lista de sus componentes
Uso: aplana Mati = Mati
     aplana (Cont(Cont Mati)) = [Cont(Cont Mati), Cont Mati, Mati]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = (Cont m) : aplana m 