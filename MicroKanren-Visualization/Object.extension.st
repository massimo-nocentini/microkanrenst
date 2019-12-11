Extension { #name : #Object }

{ #category : #'*MicroKanren-Visualization' }
Object class >> subscripts [
	^ Dictionary new
		at: $0 put: $₀;
		at: $1 put: $₁;
		at: $2 put: $₂;
		at: $3 put: $₃;
		at: $4 put: $₄;
		at: $5 put: $₅;
		at: $6 put: $₆;
		at: $7 put: $₇;
		at: $8 put: $₈;
		at: $9 put: $₉;
		at: $+ put: $₊;
		at: $- put: $₋;
		at: $= put: $₌;
		at: $( put: $₍;
		at: $) put: $₎;
		yourself
]
