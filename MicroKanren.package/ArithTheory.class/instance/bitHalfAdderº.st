as yet unclassified
bitHalfAdderº
	^ [:x :y :r :c | self bitXorº §§ {x. y. r} , (self bitAndº §§ {x. y. c})]