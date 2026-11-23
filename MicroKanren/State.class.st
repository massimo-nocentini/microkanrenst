"
I am the state of a logic computation: what a goal receives in `onState:`, and what the streams that goals answer are made of. `at:put:`, `pushGoal:` and `collectVars:forFresh:` go on from a new state, while `var:reifies:` changes my substitution in place.

Instance variables:

- `substitution`: the values of the variables, a `CTSBRAL` (one `CTMaybeCategory` per variable) or a `Dictionary`
- `birthdate`: the number of variables introduced so far, hence the `id` of the newest one
- `path`: the chain of the goals run, the newest first

To build the empty state send `asState` to a `CTSBRAL` or to a `Dictionary`. `at:put:` and `collectVars:forFresh:` work on the former: the variable with identifier `id` is at the index `birthdate - id + 1`.

I look variables up with `walk:`, which follows a variable to its value and leaves the parts of the value alone, while my `walker` replaces the variables inside the value too:

```smalltalk
| aState |
aState := (Dictionary new
	at: 1 asVar put: { 3. 2 asVar };
	at: 2 asVar put: 5;
	yourself) asState.
aState walker value: 1 asVar. ""=> #(3 5)""
```

I am sound (`isSound`) unless the last goal of my path is a failed one. I also make the objects that work on me: `unifier`, `walker`, `reifier`, `trasparentReifier` and `identityReifier`.
"
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
State >> at: aVar put: aValue [

	^ self class new
		  birthdate: birthdate;
		  substitution: (substitution
				   at: birthdate - aVar id + 1
				   put: (CTMaybeCategory just: aValue));
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
		                        aSBRAL add: CTMaybeCategory nothing ].
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

{ #category : #testing }
State >> isSound [

	^ path value isFailed not
]

{ #category : #'as yet unclassified' }
State >> onState: aState afterUnificationByUnify: aGoal [

	^ true asGoal onState: self
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

{ #category : #creating }
State >> unifier [
	^ Unifier new state: self; yourself
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

	<doc: #Realog topic: #( State walk inDictionary )>
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
	maybe := aSBRAL at: birthdate - aVar id + 1.
	^ maybe
		  ifNothing: [ aVar ]
		  ifJust: [ :aJust | self walk: aJust argument inSBRAL: aSBRAL ]
]

{ #category : #'as yet unclassified' }
State >> walker [
	^ Walker on: self
]
