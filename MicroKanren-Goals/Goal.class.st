Class {
	#name : #Goal,
	#superclass : #Object,
	#category : #'MicroKanren-Goals'
}

{ #category : #creating }
Goal class >> alpha: anObj rule: anotherObj [
	^ AlphaRule new
		x: anObj;
		y: anotherObj;
		yourself
]

{ #category : #'as yet unclassified' }
Goal class >> bagOfo [

	^ PredicateBagOfo
]

{ #category : #creating }
Goal class >> cond [
	^ Cond new
]

{ #category : #creating }
Goal class >> fail [
	^ Failed new
]

{ #category : #'as yet unclassified' }
Goal class >> findAllo [

	^ PredicateFindAllo
]

{ #category : #creating }
Goal class >> fresh: aBlock [

	^ (aBlock numArgs = 0
	   ifTrue: [ Eta new ]
	   ifFalse: [ Fresh new ])
	  receiver: aBlock;
	  yourself 
]

{ #category : #'as yet unclassified' }
Goal class >> succeed [
	^ Succeed new
]

{ #category : #creating }
Goal class >> tabledBlock: aBlockClosure withArgs: args withTable: aDictionary [ 
	^ Tabled new block: aBlockClosure; args: args; table: aDictionary; yourself
]

{ #category : #creating }
Goal class >> unify: anObj with: another [

	"
:param Object anObj: the object that should be unified with `another`.
:param Object another: the object that should be unified with `anObj`.
:return: a goal that tries to perform unification.
:rtype: Unify
"

	^ Unify new
		  left: anObj;
		  right: another;
		  yourself
]

{ #category : #combining }
Goal >> ! other [

	^ (Cut new
		   cuttingGoal: self;
		   length: 1;
		   yourself) , other
]

{ #category : #combining }
Goal >> , other [

	^ Conj new
		  left: self;
		  right: other;
		  yourself
]

{ #category : #running }
Goal >> asStatesStream [

	^ self onState: SBRAL new asState
]

{ #category : #testing }
Goal >> isFailed [

	^ false
]

{ #category : #combining }
Goal >> not [

	"^ self | true asGoal ! false asGoal"

	^ Not new
		  cuttingGoal: self;
		  yourself
]

{ #category : #running }
Goal >> onState: aState [

	<doc: #Realog topic: #( Gaol onState )>
	| aGoal |
	aGoal := self copy.
	^ self onState: (aState pushGoal: aGoal) afterPushingGoal: aGoal
]

{ #category : #'as yet unclassified' }
Goal >> onState: aState afterPushingGoal: aGoal [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Goal >> onState: refinedState forGoal: aGoal fromConj: aConj [

	self popGoalFromPathOfState: refinedState forConj: aConj. "this message should be removed to be full explicit."
	^ aGoal onState: refinedState
]

{ #category : #'as yet unclassified' }
Goal >> popGoalFromPathOfState: aState forConj: aGoal [

	"No action for the generic goal because if I am the top of `aState`'s goal path,
	 I have to remain there with respect to the computation running in the
	 conjunction goal `aGoal`."

	
]

{ #category : #running }
Goal >> solutions [

	^ Run new
		  goal: self;
		  asStatesStream
]

{ #category : #accessing }
Goal >> variables [

	^ {  }
]

{ #category : #combining }
Goal >> | other [

	^ Disj interleaved
		  left: self;
		  right: other;
		  yourself
]
