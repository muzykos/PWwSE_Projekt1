;;; --- RELACJE PODSTAWOWE ---

(defrule syn
   (or (mother ?p ?s) (father ?p ?s))
   (man ?s)
   =>
   (assert (syn ?s ?p)))

(defrule corka
   (or (mother ?p ?c) (father ?p ?c))
   (woman ?c)
   =>
   (assert (corka ?c ?p)))

(defrule malzenstwo
   (mother ?w ?dziecko)
   (father ?m ?dziecko)
   =>
   (assert (malzenstwo ?m ?w)))

(defrule rodzienstwo
   (or (mother ?p ?o1) (father ?p ?o1))
   (or (mother ?p ?o2) (father ?p ?o2))
   (test (neq ?o1 ?o2))
   =>
   (assert (rodzienstwo ?o1 ?o2)))

;;; --- DZIADKOWIE I WNUKI ---

(defrule dziadek
   (father ?d ?rodzic)
   (or (mother ?rodzic ?wnuk) (father ?rodzic ?wnuk))
   =>
   (assert (dziadek ?d ?wnuk)))

(defrule babcia
   (mother ?b ?rodzic)
   (or (mother ?rodzic ?wnuk) (father ?rodzic ?wnuk))
   =>
   (assert (babcia ?b ?wnuk)))

(defrule wnuk
   (or (dziadek ?dp ?w) (babcia ?dp ?w))
   (man ?w)
   =>
   (assert (wnuk ?w ?dp)))

(defrule wnuczka
   (or (dziadek ?dp ?w) (babcia ?dp ?w))
   (woman ?w)
   =>
   (assert (wnuczka ?w ?dp)))

;;; --- INTERAKCJA I WYŚWIETLANIE ---

;; Reguła pobierająca imię od użytkownika
(defrule podaj-imie
   (initial-fact)
   =>
   (printout t "Podaj imie osoby, aby sprawdzic relacje: ")
   (assert (szukana-osoba (read))))

(defrule pokaz-dziadkow
   (declare (salience 100))
   (szukana-osoba ?x)
   (or (dziadek ?y ?x) (babcia ?y ?x))
   =>
   (printout t ?y " jest dziadkiem/babcia dla " ?x crlf))

(defrule pokaz-rodzicow
   (declare (salience 80))
   (szukana-osoba ?x)
   (or (mother ?y ?x) (father ?y ?x))
   =>
   (printout t ?y " jest rodzicem dla " ?x crlf))

(defrule pokaz-rodzienstwo
   (declare (salience 60))
   (szukana-osoba ?x)
   (rodzienstwo ?x ?y)
   =>
   (printout t ?y " jest rodzenstwem dla " ?x crlf))

(defrule pokaz-dzieci
   (declare (salience 40))
   (szukana-osoba ?x)
   (or (syn ?y ?x) (corka ?y ?x))
   =>
   (printout t ?y " jest dzieckiem (synem/corka) dla " ?x crlf))