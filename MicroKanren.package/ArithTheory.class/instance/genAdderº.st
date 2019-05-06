as yet unclassified
genAdderº
	| µ |
	µ := Theory sexp.
	^ [:b :n :m :r | [:a :c :d :e :x :y :z | µ conso §§ {a. x. n} , (µ conso §§ {d. y. m}) , y positiveº , (µ conso §§ {c. z. r}) , z positiveº , (self bitFullAdderº §§ {b. a. d. c. e}) , [self adderº §§ {e. x. y. z}] eta] fresh]