Class {
	#name : #ArithTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'as yet unclassified' }
ArithTheory >> addero [
	^ [:b :n :m :r | Goal cond e
		if: (b unifyo value: 0)
				, m zeroo
		then: (n unifyo value: r);
		
		if: (b unifyo value: 0)
				, m positiveo , n zeroo
		then: (m unifyo value: r);
		 if: (b unifyo value: 1)
			, m zeroo then: [self addero &&! {0. n. 1 asConsedBinaryRepr. r}] eta;
		 if: (b unifyo value: 1)
			, m positiveo , n zeroo then: [self addero &&! {0. 1 asConsedBinaryRepr. m. r}] eta;
		 if: n oneo , m oneo then: [:a :c | ({a. c} asCons unifyo value: r)
			, (self bitFullAddero &&! {b. 1. 1. a. c})] fresh;
		 if: n oneo then: [self genAddero &&! {b. n. m. r}] eta;
		 if: n greaterThanOneo , m oneo then: r greaterThanOneo , [self addero &&! {b. 1 asConsedBinaryRepr. n. r}] eta;
		 if: n greaterThanOneo then: [self genAddero &&! {b. n. m. r}] eta;
		 yourself]
]

{ #category : #'as yet unclassified' }
ArithTheory >> bitAndo [
	^ [:x :y :z | Goal cond e if: (x unifyo value: 0) , (y unifyo value: 0) then: (z unifyo value: 0);
		 if: (x unifyo value: 0) , (y unifyo value: 1) then: (z unifyo value: 0);
		 if: (x unifyo value: 1) , (y unifyo value: 0) then: (z unifyo value: 0);
		 if: (x unifyo value: 1) , (y unifyo value: 1) then: (z unifyo value: 1);
		 yourself]
]

{ #category : #'as yet unclassified' }
ArithTheory >> bitFullAddero [
	^ [:b :x :y :r :c | [:w :xy :wz | self bitHalfAddero &&! {x. y. w. xy} , (self bitHalfAddero &&! {w. b. r. wz}) , (self bitXoro &&! {xy. wz. c})] fresh]
]

{ #category : #'as yet unclassified' }
ArithTheory >> bitHalfAddero [
	^ [:x :y :r :c | self bitXoro &&! {x. y. r} , (self bitAndo &&! {x. y. c})]
]

{ #category : #'as yet unclassified' }
ArithTheory >> bitXoro [
	^ [:x :y :z | Goal cond e if: (x unifyo value: 0) , (y unifyo value: 0) then: (z unifyo value: 0);
		 if: (x unifyo value: 0) , (y unifyo value: 1) then: (z unifyo value: 1);
		 if: (x unifyo value: 1) , (y unifyo value: 0) then: (z unifyo value: 1);
		 if: (x unifyo value: 1) , (y unifyo value: 1) then: (z unifyo value: 0);
		 yourself]
]

{ #category : #'as yet unclassified' }
ArithTheory >> genAddero [
	| µ |
	µ := Theory sexp.
	^ [:b :n :m :r | [:a :c :d :e :x :y :z | µ conso &&! {a. x. n} , (µ conso &&! {d. y. m}) , y positiveo , (µ conso &&! {c. z. r}) , z positiveo , (self bitFullAddero &&! {b. a. d. c. e}) , [self addero &&! {e. x. y. z}] eta] fresh]
]

{ #category : #'as yet unclassified' }
ArithTheory >> greaterThanOneo [
	^ [:x | [[:a :d :e | x
		unifyo value: ({a. d} asConsWithCdr: e)] fresh] eta]
]

{ #category : #'as yet unclassified' }
ArithTheory >> minuso [
	^ [:n :m :k | self pluso &&! {m. k. n}]
]

{ #category : #'as yet unclassified' }
ArithTheory >> oneo [
	^ [:n | n unifyo value:  1 asConsedBinaryRepr]
]

{ #category : #'as yet unclassified' }
ArithTheory >> pluso [
	^ [:x :y :r | self addero &&! {0. x. y. r}]
]

{ #category : #'as yet unclassified' }
ArithTheory >> positiveo [
	^ [:x | [[:a :d | x unifyo
		value: (a cons: d)] fresh] eta]
]

{ #category : #'as yet unclassified' }
ArithTheory >> succo [
	^ [:n :nSucc | Goal cond e if: n zeroo then: nSucc oneo;
		 if: n positiveo then: nSucc greaterThanOneo , (self pluso &&! {1 asConsedBinaryRepr. n. nSucc});
		 yourself]
]

{ #category : #'as yet unclassified' }
ArithTheory >> zeroo [
	^ [:n | n unifyo value: nil]
]
