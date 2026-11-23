"
I am the superclass of the goals, the logic computations: a goal receives a `State` by `onState:` and answers the stream of the states in which it is satisfied, possibly among failed ones (`State>>isSound` tells them apart).

## How to make goals

- `true asGoal` is a `Succeed` goal and `false asGoal` a `Failed` one.
- `x unifyo value: y` is a `Unify` goal.
- `[ ... ] asGoal` is an `Eta` goal, and `[ :x :y | ... ] asGoal` a `Fresh` one, that introduces variables.
- `Goal cond` is a `Cond` goal to add clauses to.
- A subclass of `Predicate` gives a goal a name and arguments.

## How to combine them

- `a , b` is the conjunction (`Conj`).
- `a | b` is the disjunction (`Disj`).
- `a ! b` is the conjunction of a `Cut` of `a`, limited to one state, and `b`.
- `a not` is the negation (`Not`).

## How to run them

`solutions` answers the stream of the answers, as `Run` makes it; `asStatesStream` the stream of the states, starting from the empty one. A stream is made of links and of blocks to evaluate: send it `next:` to limit it, then `readStream`.

```smalltalk
[ :x | (x unifyo value: 1) | (x unifyo value: 2) ]
	asGoal solutions readStream upToEnd.
""=> #(1 2)""
```

Subclasses implement `onState:afterPushingGoal:`, which I send after I have pushed a copy of the goal on the path of the state, or `onState:` itself. `onState:forGoal:fromConj:` decides how a conjunction goes on when a goal is the last one on the path of a state.
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

{ #category : #'as yet unclassified' }
Goal class >> findAllo [

	^ PredicateFindAllo
]

{ #category : #creating }
Goal class >> tabledBlock: aBlockClosure withArgs: args withTable: aDictionary [ 
	^ Tabled new block: aBlockClosure; args: args; table: aDictionary; yourself
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

	^ self onState: CTSBRAL new asState
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
