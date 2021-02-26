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
