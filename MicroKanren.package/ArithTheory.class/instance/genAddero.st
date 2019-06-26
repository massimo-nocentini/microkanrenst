as yet unclassified
genAddero
	| µ |
	µ := Theory sexp.
	^ [:b :n :m :r | [:a :c :d :e :x :y :z | µ conso &&! {a. x. n} , (µ conso &&! {d. y. m}) , y positiveo , (µ conso &&! {c. z. r}) , z positiveo , (self bitFullAddero &&! {b. a. d. c. e}) , [self addero &&! {e. x. y. z}] eta] fresh]