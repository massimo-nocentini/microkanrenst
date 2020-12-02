"
I represent *goal* objects, namely a goal maps a `State` object to a `Chain` of `State` object.
"
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
	^ Unify new
		this: anObj;
		that: another;
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
		both: self;
		and: other;
		yourself
]

{ #category : #running }
Goal >> asStatesStream [

	^ self onState: SBRAL new asState
]

{ #category : #combining }
Goal >> not [

	^ self | true asGoal ! false asGoal
]

{ #category : #running }
Goal >> onState: aState [
	aState pushGoal: self copy.
	^ {  } asSrfi41Stream
]

{ #category : #'as yet unclassified' }
Goal >> popGoalFromPathOfState: aState forConj: aGoal [

	"No action for the generic goal because if I am the top of `aState`'s goal path,
	 I have to remain there with respect to the computation step running in the
	 conjunction `aGoal`."

	
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

{ #category : #accessing }
Goal >> variables: aCollection [

	"Just ignore the given collection because a generic goal doesn't maintain 
	 any variable collection, usually. Let subclasses to keep them if they need."

	
]

{ #category : #combining }
Goal >> | other [

	^ Disj interleaved
		  either: self;
		  or: other;
		  yourself
]
