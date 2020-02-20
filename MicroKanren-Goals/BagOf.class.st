Class {
	#name : #BagOf,
	#superclass : #Goal,
	#instVars : [
		'receiver',
		'vars',
		'value',
		'template',
		'groupBy'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
BagOf >> groupBy: anObject [
	groupBy := anObject
]

{ #category : #'as yet unclassified' }
BagOf >> onState: aState [
	| dict g |
	dict := Dictionary new.
	(receiver onState: aState) asOrderedCollection
		do: [ :s | 
			| args key group |
			args := s identityReifier reifyVars: vars.
			key := groupBy valueWithArguments: args.
			group := dict at: key ifAbsentPut: [ OrderedCollection new ].
			group add: (template valueWithArguments: args) ].
	g := dict associations
		foldr: [ :anAssoc :rhs | 
			| lhs bindings |
			bindings := (groupBy valueWithArguments: vars)
				with: anAssoc key
				collect: [ :aVar :aValue | aVar unifyo value: aValue ].
			lhs := bindings
				foldr: #,
				init: (value unifyo value: anAssoc value asArray).
			lhs | rhs ]
		init: false asGoal.
	^ g onState: aState
]

{ #category : #accessing }
BagOf >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
BagOf >> template: anObject [
	template := anObject
]

{ #category : #accessing }
BagOf >> value: anObject [
	value := anObject
]

{ #category : #accessing }
BagOf >> vars: anObject [
	vars := anObject
]
