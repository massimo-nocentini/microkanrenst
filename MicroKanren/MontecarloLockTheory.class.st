Class {
	#name : #MontecarloLockTheory,
	#superclass : #Theory,
	#category : 'MicroKanren-theories'
}

{ #category : #'as yet unclassified' }
MontecarloLockTheory >> mccullocho [
	^ InductiveRelation new rules: {McCullochAssociateRule new. McCullochIdentityRule new};
		 relateo
]

{ #category : #'as yet unclassified' }
MontecarloLockTheory >> mclocko [
	^ InductiveRelation new rules: {McCullochRepeatRule new. McCullochReverseRule new. McCullochRightHalfAssociateRule new. McCullochShrinkRule new};
		 relateo
]
