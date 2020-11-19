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
	"Here we show that the collection of objects can be built at runtime,
	 as the case as loading from a different source like a db."

	| contracts |
	contracts := { 
		             ((MKRealogIDType contract: 1)
			              type: #employment;
			              employee: (MKRealogIDType employee: 123);
			              company: (MKRealogIDType company: 3);
			              yourself).
		             ((MKRealogIDType contract: 2)
			              type: #consulting;
			              employee: (MKRealogIDType employee: 124);
			              company: (MKRealogIDType company: 1);
			              yourself).
		             ((MKRealogIDType contract: 3)
			              type: #consulting;
			              employee: (MKRealogIDType employee: 124);
			              company: (MKRealogIDType company: 3);
			              yourself) }.
	^ [ :E | 
	  contracts
		  inject: false asGoal
		  into: [ :g :each | g | (E unifyo value: each) ] ]
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
	  self contracto value: T ] fresh ]
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
MKRealogTest >> testCompaniesWithConsultants [
	| g |
	g := [ :C | 
	     [ :id :E | 
	     | T |
	     T := (MKRealogIDType contract: id)
		          employee: E;
		          company: C;
		          type: #consulting;
		          yourself.
	     (self employeeo value: E) , (self companyo value: C)
	     , (self contracto value: T) ] fresh ] fresh.
	self
		assert: (g solutions collect: #asString)
		equals: { 'a MKRealogCompany(1)'. 'a MKRealogCompany(3)' }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testContracto [
	| g |
	g := [ :E | self contracto value: E ] fresh.
	self
		assert: (g solutions collect: #asString)
		equals:
			{ 'a MKRealogContract(1, #employment, a MKRealogEmployee(123), a MKRealogCompany(3))'.
			'a MKRealogContract(3, #consulting, a MKRealogEmployee(124), a MKRealogCompany(3))'.
			'a MKRealogContract(2, #consulting, a MKRealogEmployee(124), a MKRealogCompany(1))' }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testEmployedo [
	| g |
	g := [ :E :C | 
	     (self employeeo value: E) , (self companyo value: C)
	     , (self employedo value: E value: C) ] fresh.
	self
		assert: (g solutions collect: #asString)
		equals: { 'an Array(a MKRealogEmployee(123) a MKRealogCompany(3))' }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> testEmployeeo [
	| g |
	g := [ :E | self employeeo value: E ] fresh.
	self
		assert: (g solutions collect: [ :pair | pair asString ])
		equals: { 'a MKRealogEmployee(123)'. 'a MKRealogEmployee(125)'.
			'a MKRealogEmployee(124)' }
		modulo: #asOrderedCollection
]
