"
I am the disjunction of two goals: my question and my answer, or else my `otherwise` goal. I try the latter even when the question succeeds. `Cond` chains its clauses by means of me.

```smalltalk
[ :x |
	IfPure new
		question: (x unifyo value: 1);
		answer: true asGoal;
		otherwise: (x unifyo value: 2);
		chainCombinationStrategy: [ Disj interleaved ];
		yourself ] asGoal solutions readStream upToEnd. ""=> #(1 2)""
```
"
Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
IfPure >> onState: aState afterPushingGoal: _ [

	| disj |
	disj := chainCombinationStrategy value
		        left: question , answer;
		        right: otherwise;
		        yourself.

	^ disj onState: aState
]
