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
MKRealogTest >> maritalo [
	"This is a way to encode an enumeration."

	^ [ :language :status | 
	  Goal cond e
		  if: (language unifyo value: #'en-EN')
		  then: (#( single married widowed divorced )
				   inject: false asGoal
				   into: [ :g :each | g | (status unifyo value: each) ]);
		  if: (language unifyo value: #'de-DE')
		  then: (#( ledig verheiratet verwitwet geschieden )
				   inject: false asGoal
				   into: [ :g :each | g | (status unifyo value: each) ]) ]
]

{ #category : #tests }
MKRealogTest >> sicko [
	"The same can be done for presento and holidayo. I produce a
	 goal that encodes sickness days for each employee; in the end,
	 it shows another form of facts definition."

	^ [ :employee :date | 
	  Goal cond e
		  if: (employee unifyo value: (MKRealogIDType employee: 123))
		  then: ({ 
				   '01/15/2019' asDate.
				   '01/16/2019' asDate.
				   '01/17/2019' asDate.
				   '06/1/2019' asDate.
				   '06/2/2019' asDate.
				   '06/3/2019' asDate.
				   '06/4/2019' asDate.
				   '06/5/2019' asDate }
				   inject: false asGoal
				   into: [ :g :each | g | (date unifyo value: each) ]);
		  if: (employee unifyo value: (MKRealogIDType employee: 124))
		  then: ({ 
				   '06/1/2019' asDate.
				   '06/2/2019' asDate.
				   '06/3/2019' asDate }
				   inject: false asGoal
				   into: [ :g :each | g | (date unifyo value: each) ]);
		  if: (employee unifyo value: (MKRealogIDType employee: 125))
		  then: ({ '02/1/2019' asDate }
				   inject: false asGoal
				   into: [ :g :each | g | (date unifyo value: each) ]) ]
]

{ #category : #tests }
MKRealogTest >> testCheckSingleEmployment [

	| g |
	g := [ 
	     [ :id | 
	     | T |
	     T := (MKRealogIDType contract: id)
		          employee: (MKRealogIDType employee: 123);
		          company: (MKRealogIDType company: 3);
		          type: #employment;
		          yourself.
	     self contracto value: T ] fresh ] fresh.
	self
		assert: g solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection
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

{ #category : #tests }
MKRealogTest >> testMaritalo [
	| g |
	g := [ :E | self maritalo value: #'de-DE' value: E ] fresh.
	self
		assert: g solutions
		equals: #( ledig geschieden verwitwet verheiratet )
		modulo: #asOrderedCollection
]

{ #category : #predicates }
MKRealogTest >> testWorkedHourso [
	"[ :employee :date :period | 
	  [ :hours | 
	  (0 to: period - 1) inject: false asGoal into: [ :g :i | 
		  g
		  |
		  (self workedHourso
			   value: employee
			   value: date + i day
			   value: hours) ] ] fresh ]"

	| g |
	g := [ :list | 
	     [ :E :D :H :cdr :cddr | 
	     | bagOfGoal |
	     bagOfGoal := (self workedHourso value: E value: D value: H)
		                  bagOf: { 
				                  E.
				                  D.
				                  H }
		                  groupBy: [ :e :d :h | { e } ]
		                  template: [ :e :d :h | h ]
		                  value: list.
	     bagOfGoal ", (Theory sexp conso value: E value: cdr value: list)
	     , (Theory sexp conso value: H value: cddr value: cdr)" ]
		     fresh ] fresh.
	self
		assert: (g solutions collect: #asString)
		equals: { 'a MKRealogEmployee(123)'. 'a MKRealogEmployee(124)' }
		modulo: #asOrderedCollection
]

{ #category : #predicates }
MKRealogTest >> testWorkedo [
	| g |
	g := [ :E | 
	     self workedo value: E value: '06/01/2019' asDate value: 3 ]
		     fresh.
	self
		assert: (g solutions collect: #asString)
		equals: { 'a MKRealogEmployee(123)'. 'a MKRealogEmployee(124)' }
		modulo: #asOrderedCollection
]

{ #category : #tests }
MKRealogTest >> workedHourso [
	"The same can be done for presento and holidayo. I produce a
	 goal that encodes sickness days for each employee; in the end,
	 it shows another form of facts definition."

	^ [ :employee :date :hours | 
	  Goal cond e
		  if: (employee unifyo value: (MKRealogIDType employee: 123))
		  then: ({ 
				   ('01/1/2019' asDate -> 3 hours).
				   ('01/2/2019' asDate -> 8 hours).
				   ('01/3/2019' asDate -> 6 hours) }
				   inject: false asGoal
				   into: [ :g :each | 
					   (date unifyo value: each key)
					   , (hours unifyo value: each value) | g ]);
		  if: (employee unifyo value: (MKRealogIDType employee: 124))
		  then: ({ 
				   ('01/1/2019' asDate -> 8 hours).
				   ('01/2/2019' asDate -> 1 hour).
				   ('01/3/2019' asDate -> 4 hours) }
				   inject: false asGoal
				   into: [ :g :each | 
					   (date unifyo value: each key)
					   , (hours unifyo value: each value) | g ]);
		  if: (employee unifyo value: (MKRealogIDType employee: 125))
		  then: ({ ('02/1/2019' asDate -> 8 hours) }
				   inject: false asGoal
				   into: [ :g :each | 
					   (date unifyo value: each key)
					   , (hours unifyo value: each value) | g ]) ]
]

{ #category : #predicates }
MKRealogTest >> workedo [
	"Here there is a problem because `date` is not purely relational,
	 therefore this predicate cannot be ran backwards."

	^ [ :employee :date :period | 
	  (0 to: period - 1)
		  inject: true asGoal
		  into: [ :g :i | 
		  g , (self sicko value: employee value: date + i day) ] ]
]
