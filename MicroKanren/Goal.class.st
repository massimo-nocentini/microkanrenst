"
I represent *goal* objects, namely a goal maps a `State` object to a `Chain` of `State` object.
"
Class {
	#name : #Goal,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Goal class >> alpha: anObj rule: anotherObj [ 
	^ AlphaRule new x: anObj; y: anotherObj; yourself 
]

{ #category : #creating }
Goal class >> cond [
	^ Cond new
]

{ #category : #creating }
Goal class >> eta: aGoal [
	^ Eta new
		goal: aGoal;
		yourself
]

{ #category : #creating }
Goal class >> fail [
	^ Fail new
]

{ #category : #creating }
Goal class >> fresh: aBlock [
	^ Fresh new
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
Goal >> , other [ 
	^ Conj new both: self;
		 and: other;
		 chainCombinationStrategy: Interleaved new;
		 yourself
]

{ #category : #combining }
Goal >> ,, other [ 
	^ Conj new both: self;
		 and: other;
		 chainCombinationStrategy: Sequential new;
		 yourself
]

{ #category : #running }
Goal >> onState: aState [
	self subclassResponsibility
]

{ #category : #running }
Goal >> solutions [
| g |
	g := Run new goal: self;
				 yourself.
	^ g onState:  Dictionary new asState
]

{ #category : #reification }
Goal >> vars [
	^ {}
]

{ #category : #combining }
Goal >> | other [ 
	^ Disj new either: self;
		 or: other;
		 chainCombinationStrategy: Interleaved new;
		 yourself
]
