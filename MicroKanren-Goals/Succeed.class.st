"
.. index::
  single: goal; succeed
  pair: package; MicroKanren-Goals

I represent a goal that always *succeeds*, namely it produces a not empty stream containing exactly one state.

.. math::

  x + y

hgello.
"
Class {
	#name : #Succeed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Succeed >> onState: aState [

	"
This is some textAsCode.	

:param State aState: a state containing the substitution to refine.
:return: a stream of states with (possibly) extended substitutions.
:rtype: Srfi41Stream

.. math::

  x + f

this is even more explanations

>>> true asGoal
a Succeed

final thoughts.

"

	<doc: #Realog topic: #( Succeed onState )>
	^ (super onState: aState) , aState srfi41Singleton "ehe"
]

{ #category : #'as yet unclassified' }
Succeed >> popGoalFromPathOfState: aState forConj: aGoal [

	aState path: aState path nextLink
]
