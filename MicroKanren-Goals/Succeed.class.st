"
.. index::
  single: goal; succeed
  pair: package; MicroKanren-Goals

I am a goal that represent logical truth, in particular I encode the :token:`goalGrammar:succeed` production.

Test cases
----------

.. pharo:autocompiledmethod:: GoalTest>>#testSucceed
"
Class {
	#name : #Succeed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Succeed >> onState: aState [

	"

:param State aState: a state containing a substitution that makes the top goal true.
:return: a stream of exactly one state, namely ``aState``.
:rtype: Srfi41Stream

The invariant that governs me can be stated as follows:

.. code-block:: smalltalk

  SBRAL new asState in: [:s | (true asGoal onState: s) car == s ] >>> true

or even better with the test case

.. pharo:autocompiledmethod:: GoalTest>>#testSucceedInvariant

"

	<doc: #Realog topic: #( Succeed onState )>
	^ (super onState: aState) , aState srfi41Singleton
]

{ #category : #'as yet unclassified' }
Succeed >> popGoalFromPathOfState: aState forConj: aGoal [

	aState path: aState path nextLink
]
