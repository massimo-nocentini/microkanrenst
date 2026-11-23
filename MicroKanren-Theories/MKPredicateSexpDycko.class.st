"
I hold of a well balanced list of parentheses, the characters `$(` and `$)`: nil, or such a list between parentheses followed by such a list. `CombinatoricsTheory>>dycko` answers my class.

```smalltalk
([ :x | MKPredicateSexpDycko value: x ]
	asGoal solutions next: 3) readStream upToEnd.
""=> an Array(nil ($( $)) ($( $) $( $)))""
```
"
Class {
	#name : #MKPredicateSexpDycko,
	#superclass : #PredicateUnary,
	#category : #'MicroKanren-Theories-S-expressions'
}

{ #category : #running }
MKPredicateSexpDycko >> goal [

	^ Goal cond e
		  if: firstArgument nilo then: true asGoal;
		  otherwise: [ :beta :gamma | 
			  (MKPredicateSexpAppendo
				   value: ($( cons: beta)
				   value: ($) cons: gamma)
				   value: firstArgument)
			  , ((self class value: beta) , (self class value: gamma)) ] asGoal;
		  yourself
]

{ #category : #accessing }
MKPredicateSexpDycko >> name [

	^ 'dyckº'
]
