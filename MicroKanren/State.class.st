Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'substitution',
		'birthdate',
		'path',
		'disuniteConstraints'
	],
	#category : #MicroKanren
}

{ #category : #'instance creation' }
State class >> emptyWithSubstitution: aCollection [

	^ self new
		  birthdate: 0;
		  substitution: aCollection;
		  yourself
]

{ #category : #'instance creation' }
State class >> fromDictionary: aDictionary [
	^ self emptyWithSubstitution: aDictionary
]

{ #category : #'instance creation' }
State class >> fromSBRAL: aSBRAL [
	^ self emptyWithSubstitution: aSBRAL
]

{ #category : #'instance creation' }
State class >> fromUnionFind: aUF [
	^ self emptyWithSubstitution: aUF
]

{ #category : #'disunite constraint' }
State >> addDisuniteConstraint: aConstraint [

	^ self copy
		  disuniteConstraints: aConstraint ~~> disuniteConstraints;
		  yourself
]

{ #category : #'disunite constraint' }
State >> addDisuniteConstraintAdaptingBindings: bindings [

	| aConstraint |
	aConstraint := self linksFromBindings: bindings init: nil.
	^ self addDisuniteConstraint: aConstraint
]

{ #category : #accessing }
State >> at: aVar [

	^ substitution at: (self indexOf: aVar)
]

{ #category : #accessing }
State >> at: aVar put: aValue [

	^ self copy
		  substitution: (substitution at: (self indexOf: aVar) put: aValue);
		  yourself
]

{ #category : #accessing }
State >> at: aVar update: aBlock [

	| anObject anotherObject |
	anObject := self at: aVar.
	anotherObject := aBlock value: anObject.
	^ self at: aVar put: anotherObject
]

{ #category : #dispatching }
State >> beforeUnificationState: aState deltaBindings: bindings dispatchOver: aGoal [

	^ aGoal
		  beforeUnificationState: aState
		  afterUnificationState: self
		  deltaBindings: bindings
]

{ #category : #accessing }
State >> birthdate: anInteger [ 
	birthdate := anInteger
]

{ #category : #dispatched }
State >> checkDisuniteAssociation: anAssociation constraint: aConstraint constraints: currentConstraintsLink on: newConstraintsLink bindings: bindings ifViolated: aBlock referenceState: aState [

	^ self == aState
		  ifTrue: [ 
			  | extendedState error |
			  error := DisunificationError new
				           left: anAssociation key;
				           right: anAssociation value;
				           yourself.
			  extendedState := aState failedBecauseOfError: error.
			  aBlock value: extendedState ]
		  ifFalse: [ 
			  self
				  checkDisuniteConstraint: aConstraint
				  constraints: currentConstraintsLink
				  on: newConstraintsLink
				  bindings: bindings
				  ifViolated: aBlock
				  referenceState: aState ]
]

{ #category : #'disunite constraint' }
State >> checkDisuniteConstraint: aConstraint constraints: currentConstraintsLink on: newConstraintsLink bindings: bindings ifViolated: aBlock referenceState: aState [

	^ aConstraint
		  ifNil: [ 
			  self
				  checkDisuniteConstraints: currentConstraintsLink
				  on: bindings ~~> newConstraintsLink
				  bindings: nil
				  ifViolated: aBlock
				  referenceState: aState ]
		  ifNotNil: [ 
			  | newBindings aResult anAssociation |
			  anAssociation := aConstraint value.
			  newBindings := Dictionary new.
			  aResult := Unifier new
				             onState: self
				             unify: anAssociation key
				             and: anAssociation value
				             bindings: newBindings.

			  aResult
				  checkDisuniteAssociation: anAssociation
				  constraint: aConstraint nextLink
				  constraints: currentConstraintsLink
				  on: newConstraintsLink
				  bindings: (self linksFromBindings: newBindings init: bindings)
				  ifViolated: aBlock
				  referenceState: aState ]
]

{ #category : #'disunite constraint' }
State >> checkDisuniteConstraints: currentConstraintsLink on: newConstraintsLink bindings: bindings ifViolated: aBlock referenceState: aState [

	^ currentConstraintsLink
		  ifNil: [ 
			  aState copy
				  disuniteConstraints: newConstraintsLink;
				  yourself ]
		  ifNotNil: [ 
			  self
				  checkDisuniteConstraint: currentConstraintsLink value
				  constraints: currentConstraintsLink nextLink
				  on: newConstraintsLink
				  bindings: bindings
				  ifViolated: aBlock
				  referenceState: aState ]
]

{ #category : #'disunite constraint' }
State >> checkDisuniteConstraintsIfViolated: aBlock [
	
	^ self
		  checkDisuniteConstraints: disuniteConstraints
		  on: nil
		  bindings: nil
		  ifViolated: aBlock
		  referenceState: self
]

{ #category : #dispatching }
State >> collectVars: aCollection forFresh: aFreshGoal [

	| nextState vars extendedSubstitution |
	"Lift `aCollection` to a collection of logic variables that carry names also."
	vars := aCollection withIndexCollect: [ :aName :each | 
		        (each + birthdate) asVar
			        named: aName;
			        yourself ].

	"Allocate a slot for each variable in the substitution."
	extendedSubstitution := vars
		                        inject: substitution
		                        into: [ :aSubstitution :each | 
		                        aSubstitution add: Maybe nothing ].

	"Produce a copy of mine with the new substitution and increased birthdate."
	nextState := self copy
		             substitution: extendedSubstitution;
		             birthdate: birthdate + aCollection size;
		             yourself.

	"Finally, return back to the sender."
	^ aFreshGoal onState: nextState withVars: vars
]

{ #category : #'disunite constraint' }
State >> disuniteConstraintSatisfied: bindings previousState: previousState [

	^ bindings associations
		  inject: previousState
		  into: [ :aState :anAssociation | 
			  aState
				  at: anAssociation key
				  update: [ :aCell | aCell disunited: anAssociation value ] ]
]

{ #category : #'disunite constraint' }
State >> disuniteConstraints: aValueLink [

	disuniteConstraints := aValueLink
]

{ #category : #'disunite constraint' }
State >> failedBecauseOfError: e [

	^ FailedState new
		  substitution: substitution;
		  birthdate: birthdate;
		  path: path;
		  counterexample: e;
		  yourself
]

{ #category : #reification }
State >> identityReifier [
	^ self reifierOfClass: IdentityReifier
]

{ #category : #testing }
State >> ifCounterexampleFound: ceBlock otherwise: oBlock [

	^ oBlock cull: self
]

{ #category : #accessing }
State >> indexOf: aVar [

	^ birthdate - aVar id + 1
]

{ #category : #testing }
State >> isSound [

	^ path value isFailed not
]

{ #category : #'disunite constraint' }
State >> linksFromBindings: bindings init: aLink [

	^ bindings associations
		  inject: aLink
		  into: [ :aValueLink :each | each ~~> aValueLink ]
]

{ #category : #accessing }
State >> path [
	^ path
]

{ #category : #accessing }
State >> path: anObject [
	path := anObject
]

{ #category : #accessing }
State >> pushGoal: aGoal [

	^ self copy in: [ :aState | 
		  aState
			  path: aGoal ~~> aState path;
			  yourself ]
]

{ #category : #reification }
State >> reifier [
	^ self reifierOfClass: Reifier
]

{ #category : #reification }
State >> reifierOfClass: aClass [
	^ aClass new
		state: self;
		yourself
]

{ #category : #reification }
State >> reifyTopmostVariables [

	^ path reversed value variables in: [ :vars | 
		  vars zip: (self reifier reifyVars: vars) ]
]

{ #category : #reification }
State >> reifyVar: aVar forIdentityReifier: aReifier [
	substitution at: aVar ifPresent: [ :v | self error ]
]

{ #category : #reification }
State >> reifyVar: aVar forReifier: aReifier [
	self var: substitution size asReifiedVar reifies: aVar
]

{ #category : #reification }
State >> reifyVar: aVar forTransparentReifier: aReifier [
	self var: substitution size asVar reifies: aVar
]

{ #category : #accessing }
State >> substitution: aCollection [ 
	substitution := aCollection
]

{ #category : #reification }
State >> trasparentReifier [
	^ self reifierOfClass: TrasparentReifier
]

{ #category : #reification }
State >> var: aReifiedVar reifies: aVar [
	substitution
		at: aVar
		ifPresent: [ :v | self error ]
		ifAbsentPut: [ aReifiedVar ]
]

{ #category : #walking }
State >> walk: anObj [

	^ substitution walk: anObj fromState: self
]

{ #category : #walking }
State >> walk: anObj inDictionary: aDictionary [

	^ self walkIterative: anObj inDictionary: aDictionary
]

{ #category : #walking }
State >> walk: anObj inSBRAL: aSBRAL [

	^ anObj walkSBRAL: aSBRAL forState: self
]

{ #category : #walking }
State >> walk: anObj inUnionFind: aUF [
	^ (aUF includesKey: anObj)
		ifTrue: [ aUF at: anObj ]
		ifFalse: [ anObj ]
]

{ #category : #walking }
State >> walkIterative: anObj inDictionary: aDictionary [
	"searches for the value of `anObj` in substitution"

	"^ substitution
	at: anObj
	ifPresent: [:v | 
	| w |
	w := self walk: v.
	substitution at: anObj put: w]
	ifAbsent: [anObj]"

	| k |
	k := anObj.
	[ k := aDictionary at: k ifAbsent: [ ^ k ] ] repeat
]

{ #category : #dispatched }
State >> walkObject: anObject inSBRAL: aSBRAL [

	^ anObject
]

{ #category : #walking }
State >> walkRecursive: anObj inDictionary: aDictionary [
	^ aDictionary
		at: anObj
		ifPresent: [ :v | 
			aDictionary
				at: anObj
				put: (self walkRecursive: v inDictionary: aDictionary) ]
		ifAbsent: [ anObj ]
]

{ #category : #dispatched }
State >> walkVar: aVar inSBRAL: aSBRAL [

	| index maybe |
	index := self indexOf: aVar.
	maybe := aSBRAL at: index.
	^ maybe
		  ifNothing: [ aVar ]
		  ifJust: [ :aJust | self walk: aJust content inSBRAL: aSBRAL ]
]
