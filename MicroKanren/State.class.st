Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'substitution',
		'birthdate',
		'path'
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

{ #category : #'as yet unclassified' }
State >> at: aVar [

	^ substitution at: (self indexOf: aVar)
]

{ #category : #'as yet unclassified' }
State >> at: aVar put: aValue [

	| aCell |
	aCell := (self at: aVar) unified: aValue.
	^ self class new
		  birthdate: birthdate;
		  substitution: (substitution at: (self indexOf: aVar) put: aCell);
		  path: path;
		  yourself
]

{ #category : #accessing }
State >> birthdate: anInteger [ 
	birthdate := anInteger
]

{ #category : #dispatching }
State >> collectVars: aCollection forFresh: aFresh [

	| nextState vars extendedSubstitution |
	vars := aCollection withIndexCollect: [ :aName :each | 
		        (each + birthdate) asVar
			        named: aName;
			        yourself ].
	extendedSubstitution := vars
		                        inject: substitution
		                        into: [ :aSBRAL :each | 
		                        aSBRAL add: StateCell new ].
	nextState := self class new
		             substitution: extendedSubstitution;
		             birthdate: birthdate + aCollection size;
		             path: path;
		             yourself.
	^ aFresh onState: nextState withVars: vars
]

{ #category : #'as yet unclassified' }
State >> failedBecauseOfUnificationError: e [

	^ FailedState new
		  substitution: substitution;
		  birthdate: birthdate;
		  path: path;
		  counterexample: e;
		  yourself
]

{ #category : #'as yet unclassified' }
State >> identityReifier [
	^ self reifierOfClass: IdentityReifier
]

{ #category : #'as yet unclassified' }
State >> ifCounterexampleFound: ceBlock otherwise: oBlock [

	^ oBlock cull: self
]

{ #category : #'as yet unclassified' }
State >> indexOf: aVar [

	^ birthdate - aVar id + 1
]

{ #category : #testing }
State >> isSound [

	^ path value isFailed not
]

{ #category : #'as yet unclassified' }
State >> onState: aState bindings: bindings fromUnify: aGoal [

	^ true asGoal onState: self
]

{ #category : #'as yet unclassified' }
State >> onState: aState unificationBy: bindings fromDisunite: aGoal [

	^ self == aState
		  ifTrue: [ 
			  | extendedState error |
			  error := DisunificationError new
				           left: aGoal left;
				           right: aGoal right;
				           yourself.
			  extendedState := aState failedBecauseOfUnificationError: error.
			  false asGoal onState: extendedState ]
		  ifFalse: [ 
			  | aNewState |
			  aNewState := bindings associations
				               inject: self
				               into: [ :eachState :eachAssociation | 
					               | aCell aNewCell aVar |
					               aVar := eachAssociation key.
					               aCell := eachState at: aVar.
					               aNewCell := aCell disunited: eachAssociation value.
					               eachState at: aVar put: aNewCell ].
			  true asGoal onState: aNewState ]
]

{ #category : #'as yet unclassified' }
State >> path [
	^ path
]

{ #category : #accessing }
State >> path: anObject [
	path := anObject
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
State >> walk: anObj [

	^ substitution walk: anObj fromState: self
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inDictionary: aDictionary [

	^ self walkIterative: anObj inDictionary: aDictionary
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inSBRAL: aSBRAL [

	^ anObj walkSBRAL: aSBRAL forState: self
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inUnionFind: aUF [
	^ (aUF includesKey: anObj)
		ifTrue: [ aUF at: anObj ]
		ifFalse: [ anObj ]
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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

	| maybe |
	maybe := (aSBRAL at: birthdate - aVar id + 1) unified.
	^ maybe
		  ifNothing: [ aVar ]
		  ifJust: [ :aJust | self walk: aJust content inSBRAL: aSBRAL ]
]

{ #category : #'as yet unclassified' }
State >> walker [
	^ Walker on: self
]
