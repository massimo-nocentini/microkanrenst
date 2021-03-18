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

{ #category : #adding }
State >> addDisuniteConstraint: aConstraint [

	^ self copy
		  instVarNamed: #disuniteConstraints
		  put: aConstraint ~~> disuniteConstraints;
		  yourself
]

{ #category : #adding }
State >> addDisuniteConstraintAdaptingBindings: bindings [

	| aConstraint |
	aConstraint := bindings associations
		               inject: nil
		               into: [ :aValueLink :each | each ~~> aValueLink ].
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
