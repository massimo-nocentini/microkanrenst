"
I hold the relation `synthº` between an expression `e` and an object `aThe`: the goal asks `e` to be a message `the:`, its argument to be a type by `isaTypeº`, its receiver to be of that type by `isAº`, and `aThe` to be the message `the:` with the resulting expression and type. The methods `isAº` and `isaTypeº` are empty.
"
Class {
	#name : #PieLanguage,
	#superclass : #Object,
	#category : #'MicroKanren-Pie'
}

{ #category : #accessing }
PieLanguage >> isAº [
]

{ #category : #accessing }
PieLanguage >> isaTypeº [
]

{ #category : #accessing }
PieLanguage >> synthº [
	^ [ :e :aThe | 
	[ :expr :expro :exprType :exprTypeo | 
	(e unifyo
		value: (RBMessageNode receiver: expr selector: #the: arguments: {exprType}))
		, (self isaTypeº value: exprType value: exprTypeo)
		, (self isAº value: expr value: exprTypeo value: expro)
		,
			(aThe unifyo
				value: (RBMessageNode receiver: expro selector: #the: arguments: {exprTypeo})) ]
		asGoal ]
]
