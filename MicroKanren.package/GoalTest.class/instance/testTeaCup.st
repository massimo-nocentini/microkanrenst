as yet unclassified
testTeaCup
	| g |
	g := [:x :y :z | (self teacup: x)
				, ((self teacup: y)
						, (self teacup: z))] fresh.
	self assert: g solutions contents equals: {#(#tea #tea #tea). #(#tea #tea #cup). #(#tea #cup #tea). #(#tea #cup #cup). #(#cup #tea #tea). #(#cup #tea #cup). #(#cup #cup #tea). #(#cup #cup #cup)}.
	g := [:x :y :z | (self teacup: x)
				& ((self teacup: y)
						& (self teacup: z))] fresh.
	self assert: g solutions contents equals: {#(#tea #tea #tea). #(#cup #tea #tea). #(#tea #cup #tea). #(#cup #cup #tea). #(#tea #tea #cup). #(#cup #tea #cup). #(#tea #cup #cup). #(#cup #cup #cup)}