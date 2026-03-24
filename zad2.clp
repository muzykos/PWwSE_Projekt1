;;; --- DEFINICJA FAKTÓW (Zasoby w kuchni) ---

(deffacts kuchnia
   (maka 2)          ; kg
   (cukier 1)        ; kg
   (jablka 2)        ; kg
   (maslo 1.5)       ; kostki/kg
   (jajka 12)        ; sztuki
   (mleko 2)         ; litry
   (makaron 0.5)     ; kg
   (ser-zolty 0.3)   ; kg
   (pomidory 1)      ; kg
   (cebula 0.5)      ; kg
   (czosnek 2)       ; ząbki/sztuki
   (sol 1)           ; kg
   (olej 1)          ; litr
)

;;; --- REGUŁY (Przepisy) ---

(defrule przepis-szarlotka-prosta
   (jablka ?jb&:(>= ?jb 1.5))
   (maka ?mk&:(>= ?mk 1))
   (cukier ?c&:(>= ?c 0.5))
   (maslo ?m&:(>= ?m 1))
   =>
   (printout t "Mozesz przygotowac: Szarlotka" crlf))

(defrule przepis-nalesniki
   (maka ?mk&:(>= ?mk 0.5))
   (mleko ?ml&:(>= ?ml 0.5))
   (jajka ?j&:(>= ?j 2))
   =>
   (printout t "Mozesz przygotowac: Nalesniki" crlf))

(defrule przepis-omlet
   (jajka ?j&:(>= ?j 3))
   (maslo ?m&:(>= ?m 0.1))
   =>
   (printout t "Mozesz przygotowac: Omlet klasyczny" crlf))

(defrule przepis-makaron-z-serem
   (makaron ?mr&:(>= ?mr 0.25))
   (ser-zolty ?s&:(>= ?s 0.15))
   (maslo ?m&:(>= ?m 0.05))
   =>
   (printout t "Mozesz przygotowac: Makaron z serem" crlf))

(defrule przepis-sos-pomidorowy
   (pomidory ?p&:(>= ?p 0.5))
   (cebula ?ce&:(>= ?ce 0.1))
   (czosnek ?cz&:(>= ?cz 1))
   (olej ?o&:(>= ?o 0.05))
   =>
   (printout t "Mozesz przygotowac: Domowy sos pomidorowy" crlf))

(defrule przepis-spaghetti-napoli
   (makaron ?mr&:(>= ?mr 0.2))
   (pomidory ?p&:(>= ?p 0.3))
   (ser-zolty ?s&:(>= ?s 0.05))
   =>
   (printout t "Mozesz przygotowac: Makaron Napoli" crlf))

(defrule przepis-ciasteczka-maslane
   (maka ?mk&:(>= ?mk 0.4))
   (cukier ?c&:(>= ?c 0.2))
   (maslo ?m&:(>= ?m 0.5))
   (jajka ?j&:(>= ?j 1))
   =>
   (printout t "Mozesz przygotowac: Ciasteczka maslane" crlf))

(defrule przepis-jajecznica-z-cebulka
   (jajka ?j&:(>= ?j 2))
   (cebula ?ce&:(>= ?ce 0.1))
   (maslo ?m&:(>= ?m 0.05))
   =>
   (printout t "Mozesz przygotowac: Jajecznica z cebulka" crlf))