as yet unclassified
bitFullAdderº
	^ [:b :x :y :r :c | [:w :xy :wz | self bitHalfAdderº §§ {x. y. w. xy} , (self bitHalfAdderº §§ {w. b. r. wz}) , (self bitXorº §§ {xy. wz. c})] fresh]