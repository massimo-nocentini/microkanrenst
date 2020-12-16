"
I and my subclasses represent a small language to construct logical relations. Formally, I adhere to
the following abstract grammar:

.. productionlist:: goalGrammar
   goal: `failed` | `succeed` | `binary_goal` |
       : `fresh` | `eta` | `predicate`
   failed: ""Ø""
   succeed: ""✓""
   binary_goal: `goal` (""|"" | ""&"" | ""!"") `goal`
   fresh: ""fresh"" [`var`] +  ""."" `goal`
   eta: ""eta"" ""."" `goal`
   var: ""var"" `Integer`
   predicate: `functor` [`var` | `value`] + ""."" `goal`
   functor: `String`
   value: `Object`

My subclasses have the responsibility to encode combinations of arbitrary goals and, consequently, shouldn't be stateful with respect to a logical computation. It follows that their sole instance variables have to related to goal construction. 

.. warning::

  Any reference to external objects beyond this scope should be prohibited.

To be polymorphic with me, the :ref:`onState-message-label` has to be implemented, as my subclasses have to; as the reader will understand following the referenced doc, it is the main message to respond to in order to get into a logic computation.
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

	"
:param Object anObj: the object that should be unified with `another`.
:param Object another: the object that should be unified with `anObj`.
:return: a goal that tries to perform unification.
:rtype: Unify
"

	^ Unify value: anObj value: another
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

	"^ self | true asGoal ! false asGoal"

	^ Not new
		  cuttingGoal: self;
		  yourself
]

{ #category : #running }
Goal >> onState: aState [

	"
I encode the basic behaviour to perform a step in a logic computation.
"

	<doc: #Realog topic: #( Gaol onState )>
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
