"
I represent *goal* objects, namely a goal maps a `State` object to a `Chain` of `State` object.
"
Class {
	#name : #Goal,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

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
Goal class >> unify: anObj with: another [
	^ Unify new
		this: anObj;
		that: another;
		yourself
]

{ #category : #combining }
Goal >> & anotherGoal [
	^ (self , anotherGoal) interleaved
]

{ #category : #combining }
Goal >> , other [
	^ Conj both: self and: other
]

{ #category : #'as yet unclassified' }
Goal >> interleaved [
	^ self
]

{ #category : #running }
Goal >> onState: aState [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Goal >> solutions [
	^ Runner onGoal: self
]

{ #category : #reification }
Goal >> vars [
	^ {}
]

{ #category : #combining }
Goal >> | other [
	^ Disj either: self or: other
]
