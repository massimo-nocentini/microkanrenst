Class {
	#name : #MKRealogTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Realog'
}

{ #category : #predicates }
MKRealogTest >> companyo [
	"The type information is checked against unification dispatched by each IDType."

	^ [ :E | 
	  (E unifyo value: (MKRealogIDType company: 1))
	  | (E unifyo value: (MKRealogIDType company: 2))
	  | (E unifyo value: (MKRealogIDType company: 3)) ]
]

{ #category : #predicates }
MKRealogTest >> contracto [
	"The type information is checked against unification dispatched by each IDType."

	^ [ :E | 
	  | a b c |
	  a := (MKRealogIDType contract: 1)
		       type: #employment;
		       employee: (MKRealogIDType employee: 123);
		       company: (MKRealogIDType company: 3);
		       yourself.
	  b := (MKRealogIDType contract: 2)
		       type: #freelance;
		       employee: (MKRealogIDType employee: 124);
		       company: (MKRealogIDType company: 1);
		       yourself.
	  c := (MKRealogIDType contract: 3)
		       type: #freelance;
		       employee: (MKRealogIDType employee: 124);
		       company: (MKRealogIDType company: 3);
		       yourself.
	  (E unifyo value: a) | (E unifyo value: b) | (E unifyo value: c) ]
]

{ #category : #predicates }
MKRealogTest >> employedo [
	^ [ :E :C | 
	  [ :id | 
	  | T |
	  T := (MKRealogIDType contract: id)
		       type: #employment;
		       employee: E;
		       company: C;
		       yourself.
	  (self employeeo value: E) , (self companyo value: C)
	  , (self contracto value: T) ] fresh ]
]

{ #category : #predicates }
MKRealogTest >> employeeo [
	"The type information is checked against unification dispatched by each IDType."

	^ [ :E | 
	  (E unifyo value: (MKRealogIDType employee: 123))
	  | (E unifyo value: (MKRealogIDType employee: 124))
	  | (E unifyo value: (MKRealogIDType employee: 125)) ]
]

{ #category : #tests }
MKRealogTest >> testContracto [
	| g |
	g := [ :E | self contracto value: E ] fresh.
	self
		assert: (g solutions collect: #id)
		equals: { 1. 3. 2 }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testContracto1 [
	| g |
	g := [ :E | 
	     [ :id :C | 
	     self contracto value: ((MKRealogIDType contract: id)
			      employee: E;
			      company: C;
			      type: #freelance;
			      yourself) ] fresh ] fresh.
	self
		assert: (g solutions collect: #asString)
		equals: { }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testEmployedo [
	| g |
	g := [ :E :C | self employedo value: E value: C ] fresh.
	self
		assert: (g solutions collect: [ :pair | pair first id ])
		equals: { 123 }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testEmployeeo [
	| g |
	g := [ :E | self employeeo value: E ] fresh.
	self
		assert: (g solutions collect: [ :pair | pair id ])
		equals: { 123. 125. 124 }
		modulo: #asOrderedCollection
]
