Class {
	#name : #Conj,
	#superclass : #Goal,
	#instVars : [
		'both',
		'and',
		'interleaving'
	],
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Conj class >> both: this and: that [
	^ self new
		both: this and: that;
		yourself
]

{ #category : #accessing }
Conj >> both: aGoal and: anotherGoal [
	both := aGoal.
	and := anotherGoal
]

{ #category : #'as yet unclassified' }
Conj >> initialize [
	super initialize.
	interleaving := Sequential new
]

{ #category : #'as yet unclassified' }
Conj >> interleaved [
	interleaving := Interleaved new
]

{ #category : #running }
Conj >> onState: aState [
	^ interleaving of: ((both onState: aState) bind: and)
]
