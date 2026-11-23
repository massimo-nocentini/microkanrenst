"
I am a predicate that relates an expression, my first argument, to a message `the:`, my second one, in one of two ways:

- `theGoal`: both arguments are messages `the:`, and their receivers and arguments satisfy the relations `isaTypeº` and `isAº` of my `pie` (see `PieLanguage`)
- `atomiGoal`: the first argument is the literal `#grape`, and the second one is the message `the:` sent to it with `Symbol` as argument

I have no method to set `pie`.
"
Class {
	#name : #PredicateBinarySynth,
	#superclass : #PredicateBinary,
	#instVars : [
		'pie'
	],
	#category : #'MicroKanren-Pie-MicroKanren-Pie'
}

{ #category : #accessing }
PredicateBinarySynth >> atomiGoal [
	^ [ :expr | 
	(self symbolº value: firstArgument)
		,
			(self unifyº
				value: secondArgument
				value:
					(RBMessageNode
						receiver: firstArgument
						selector: #the:
						arguments: {Symbol asGlobalRBNode})) ] asGoal
]

{ #category : #accessing }
PredicateBinarySynth >> goal [
	^ self theGoal | self atomiGoal
]

{ #category : #accessing }
PredicateBinarySynth >> name [
	^ 'synthº'
]

{ #category : #accessing }
PredicateBinarySynth >> symbolº [
	^ [ :a | self unifyº value: a value: #grape asLiteralRBNode ]
]

{ #category : #accessing }
PredicateBinarySynth >> theGoal [
	^ [ :expr :expro :exprType :exprTypeo | 
	(self unifyº
		value: firstArgument
		value: (RBMessageNode receiver: expr selector: #the: arguments: {exprType}))
		, (pie isaTypeº value: exprType value: exprType)
		, (pie isAº value: expr value: exprTypeo value: expro)
		,
			(self unifyº
				value: secondArgument
				value: (RBMessageNode receiver: expro selector: #the: arguments: {exprTypeo})) ]
		asGoal
]
