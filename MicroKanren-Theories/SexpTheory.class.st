Class {
	#name : #SexpTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'lambda calculus' }
SexpTheory >> alphaRuleo [
	^ [:x :y | Goal alpha: x rule: y]
]

{ #category : #'as yet unclassified' }
SexpTheory >> appendo [

	^ MKPredicateSexpAppendo
]

{ #category : #'as yet unclassified' }
SexpTheory >> caro [

	^ MKPredicateSexpCaro
]

{ #category : #'as yet unclassified' }
SexpTheory >> cdro [

	^ MKPredicateSexpCdro
]

{ #category : #'as yet unclassified' }
SexpTheory >> conso [

	^ MKPredicateSexpConso
]

{ #category : #'as yet unclassified' }
SexpTheory >> lengtho [
	| µ |
	µ := Theory arith.
	^ [ :lst :n | 
	(lst nilo , n zeroo)
		|
			(lst pairo , n positiveo
				,
					[ :cdr :res | 
					| recº |
					recº := [ self lengtho
						!!
							{cdr.
							res} ] fresh.
					self cdro
						!!
							{lst.
							cdr}
						,
							(µ succo
								!!
									{res.
									n}) , recº ] fresh) ]
]

{ #category : #'as yet unclassified' }
SexpTheory >> nilo [
	^ [:anObj | anObj unifyo value: nil]
]

{ #category : #'as yet unclassified' }
SexpTheory >> pairo [
	^ [:lst | [:a :d | self conso !! {a. d. lst}] fresh]
]

{ #category : #'as yet unclassified' }
SexpTheory >> reverseo [
	^ [:reversing :reversed | Goal cond e if: reversing nilo then: reversed nilo;
		 if: true asGoal then: [:car :cdr :res | self conso !! {car. cdr. reversing} , (self appendo !! {res. {car} asCons. reversed}) , [self reverseo !! {cdr.res}] fresh] fresh]
]
