Class {
	#name : #StateCell,
	#superclass : #Object,
	#instVars : [
		'unify',
		'disunite'
	],
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
StateCell >> disunited [

	^ disunite
]

{ #category : #'as yet unclassified' }
StateCell >> disunited: anObject [

	^ self copy
		  instVarNamed: #disunite put: anObject ~~> disunite;
		  yourself
]

{ #category : #'as yet unclassified' }
StateCell >> emptyDisunite [

	^ self copy
		  instVarNamed: #disunite put: nil;
		  yourself
]

{ #category : #initialization }
StateCell >> initialize [

	super initialize.
	unify := Maybe nothing.
	disunite := nil
]

{ #category : #'as yet unclassified' }
StateCell >> unified [

	^ unify
]

{ #category : #'as yet unclassified' }
StateCell >> unified: anObject [

	^ self copy
		  instVarNamed: #unify put: (Maybe just: anObject);
		  yourself
]
