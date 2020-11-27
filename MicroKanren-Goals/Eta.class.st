Class {
	#name : #Eta,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Eta >> onState: aState [

	^ [ (super onState: aState) , (receiver value onState: aState) ]
		  srfi41Stream
]
