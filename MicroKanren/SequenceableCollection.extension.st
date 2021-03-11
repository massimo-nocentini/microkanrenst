Extension { #name : #SequenceableCollection }

{ #category : #'*MicroKanren' }
SequenceableCollection >> acceptOccurChecker: aChecker [

	^ aChecker forSequenceableCollection: self
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> cond [
 |g|
	g := Goal cond.
	self do: [:each | g if: each key then: each value].
	^ g
	
]

{ #category : #'*MicroKanren' }
SequenceableCollection >> reifyUsingReifier: aReifier [

	^ aReifier forSequenceableCollection: self
]

{ #category : #'*MicroKanren' }
SequenceableCollection >> unifyWith: another usingUnifier: anUnifier [

	^ another
		  unifyWithSequenceableCollection: self
		  usingUnifier: anUnifier
]

{ #category : #'*MicroKanren' }
SequenceableCollection >> unifyWithSequenceableCollection: aCollection usingUnifier: anUnifier [

	^ anUnifier
		  forSequenceableCollection: self
		  forSequenceableCollection: aCollection
]

{ #category : #'*MicroKanren' }
SequenceableCollection >> walkStarUsingWalker: aWalker [

	^ aWalker forSequenceableCollection: self
]
