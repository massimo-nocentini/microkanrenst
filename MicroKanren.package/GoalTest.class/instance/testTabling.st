tests
testTabling
	| g patho |
	patho := self
				patho:{#a -> #b . #b -> #a . #b -> #d} asGraph asGoal.
	g := [:x | patho value: #a value: x] fresh.
	self assert: g solutions all equals: #(#b #a #d).
	patho := self patho: {#a -> #b. #b -> #c. #c -> #d. #d -> #a. #d -> #b} asGraph asGoal.
	g := [:x | patho value: #c value: x] fresh.
	self assert: g solutions all equals: #(#d #a #b #c)