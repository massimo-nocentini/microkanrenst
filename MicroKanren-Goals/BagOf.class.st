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

{ #category : #running }
BagOf >> onState: aState [
	| dict g |
	dict := Dictionary new.
	(receiver onState: aState) asOrderedCollection
		do: [ :s | 
			| args key group |
			args := s trasparentReifier reifyVars: vars.
			key := groupBy valueWithArguments: args.
			group := dict at: key ifAbsentPut: [ OrderedCollection new ].
			group add: (template valueWithArguments: args) ].
	g := dict associations
		foldr: [ :anAssoc :rhs | 
			| lhs |
			lhs := value unifyo value: anAssoc key -> anAssoc value asArray.
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
