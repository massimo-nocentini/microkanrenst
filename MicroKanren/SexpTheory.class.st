Class {
	#name : #SexpTheory,
	#superclass : #Object,
	#category : 'MicroKanren-theories'
}

{ #category : #'as yet unclassified' }
SexpTheory >> let: aResult be: aCollection append: anotherCollection [
	^ Goal cond e
		if: aCollection nilo then: (aResult unifyWith: anotherCollection);
		else:
			[ :a :d :rec | 
			(self let: aCollection be: a cons: d) , (self let: aResult be: a cons: rec)
				, (self let: rec be: d append: anotherCollection) ] fresh
]

{ #category : #'as yet unclassified' }
SexpTheory >> let: aCons be: aCar cons: aCdr [
	^ (self let: aCar car: aCons) , (self let: aCdr cdr: aCons)
]

{ #category : #'as yet unclassified' }
SexpTheory >> let: anObj car: anotherObj [
	^ [ :d | anotherObj asCons unifyWith: (Cons car: anObj asCons cdr: d) ] fresh
]

{ #category : #'as yet unclassified' }
SexpTheory >> let: anObj cdr: anotherObj [
	^ [ :a | anotherObj asCons unifyWith: (Cons car: a cdr: anObj asCons) ] fresh
]

{ #category : #'as yet unclassified' }
SexpTheory >> let: reversed reverse: reversing [
	^ Goal cond e
		if: reversing nilo then: reversed nilo;
		else:
			[ :car :cdr :res | (reversing unifyWith: (car cons: cdr)) , ((self let: reversed be: res append: (car cons: nil)) & (self let: res reverse: cdr)) ]
				fresh
]
