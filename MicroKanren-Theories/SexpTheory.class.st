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
	^ [ :aCollection :anotherCollection :aResult | 
	Goal cond e
		if: aCollection nilo
			then: (aResult unifyo value: anotherCollection);
		otherwise:
			[ :a :d :rec | 
			(self conso value: a value: d value: aCollection)
				, (self conso value: a value: rec value: aResult)
				, [ self appendo value: d value: anotherCollection value: rec ] eta ]
				fresh;
		yourself ]
]

{ #category : #'as yet unclassified' }
SexpTheory >> caro [
	^ [:aCons :aCar | [:aCdr | self conso !! {aCar.aCdr.aCons}] fresh]
]

{ #category : #'as yet unclassified' }
SexpTheory >> cdro [
	^ [:aCons :aCdr | [:aCar | self conso !! {aCar.aCdr.aCons}] fresh]
]

{ #category : #'as yet unclassified' }
SexpTheory >> conso [
	^ [:aCar :aCdr :aCons | (aCar cons: aCdr)
		unifyo value: aCons]
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
							res} ] eta.
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
		 if: true asGoal then: [:car :cdr :res | self conso !! {car. cdr. reversing} , (self appendo !! {res. {car} asCons. reversed}) , [self reverseo !! {cdr.res}] eta] fresh]
]
