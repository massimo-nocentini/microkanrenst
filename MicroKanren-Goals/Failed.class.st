"
.. index::
  single: goal; failed
  pair: package; MicroKanren-Goals

I am a goal that represent logical falsehood, in particular I encode the :token:`goalGrammar:failed` production.

Test cases
----------

.. pharo:autocompiledmethod:: GoalTest>>#testFailed
"
Class {
	#name : #Failed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #testing }
Failed >> isFailed [

	^ true
]

{ #category : #'as yet unclassified' }
Failed >> onState: refinedState forGoal: right fromConj: aConj [

	^ refinedState srfi41Singleton
]
