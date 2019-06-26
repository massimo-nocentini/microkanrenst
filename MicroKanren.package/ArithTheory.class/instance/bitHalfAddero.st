as yet unclassified
bitHalfAddero
	^ [:x :y :r :c | self bitXoro &&! {x. y. r} , (self bitAndo &&! {x. y. c})]