Class {
	#name : #MKSexpTest,
	#superclass : #GoalAbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #utilities }
MKSexpTest >> imagesPath [

	^ self iceWorkingDirectory / 'booklet' / 'source' / '_images'
]

{ #category : #tests }
MKSexpTest >> testACORN [

	| g |
	g := [ :r | MKPredicateSexpCaro value: 'acorn' asCons value: r ]
		     asGoal.
	self assert: g solutions equals: { $a } modulo: #asOrderedCollection.

	"Export it."
	self
		export: (g asLogicComputationTreeLimitedTo: -1)
		pathSuffix: 'sexp-acorn'
		selector: #gtInspectorTreeUsingCanvas:
]

{ #category : #tests }
MKSexpTest >> testAppendoBackward [

	| g |
	g := [ :l :r | 
	     SexpTheory new appendo
		     value: l
		     value: r
		     value: #( a b c d e ) asCons ] asGoal.
	self
		assert: g solutions
		equals: ({ 
				 #( nil #( #a #b #c #d #e ) ).
				 #( #( #a ) #( #b #c #d #e ) ).
				 #( #( #a #b ) #( #c #d #e ) ).
				 #( #( #a #b #c ) #( #d #e ) ).
				 #( #( #a #b #c #d ) #( #e ) ).
				 #( #( #a #b #c #d #e ) nil ) } collect: [ :each | 
				 each collect: #asCons ])
		modulo: #asOrderedCollection.

	"Export it."
	self
		export: (g asLogicComputationTreeLimitedTo: -1)
		pathSuffix: 'sexp-appendo-backward'
		selector: #gtInspectorTreeUsingCanvas:
]

{ #category : #tests }
MKSexpTest >> testAppendoForward [

	| g |
	g := [ :l | 
	     SexpTheory new appendo
		     value: #( #a #b #c ) asCons
		     value: #( #d #e ) asCons
		     value: l ] asGoal.
	self
		assert: g solutions
		equals: #( a b c d e ) asCons
		modulo: #asOrderedCollection.

	"Export it."
	self
		export: (g asLogicComputationTreeLimitedTo: -1)
		pathSuffix: 'sexp-appendo-forward'
		selector: #gtInspectorTreeUsingCanvas:
]

{ #category : #tests }
MKSexpTest >> testDycko [

	| g |
	g := [ :alpha | MKPredicateSexpDycko value: alpha ] asGoal.
	self
		export: (g asLogicComputationTreeLimitedTo: 20)
		pathSuffix: 'sexp-dycko'
		selector: #gtInspectorTreeUsingCanvas:
]
