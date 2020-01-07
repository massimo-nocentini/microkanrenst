Class {
	#name : #Succeed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Succeed >> onState: aState [
	^ aState srfi41Singleton
]
