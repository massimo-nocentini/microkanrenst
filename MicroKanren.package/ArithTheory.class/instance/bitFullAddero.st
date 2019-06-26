as yet unclassified
bitFullAddero
	^ [:b :x :y :r :c | [:w :xy :wz | self bitHalfAddero &&! {x. y. w. xy} , (self bitHalfAddero &&! {w. b. r. wz}) , (self bitXoro &&! {xy. wz. c})] fresh]