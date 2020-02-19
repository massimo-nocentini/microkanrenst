Class {
	#name : #TrasparentReifier,
	#superclass : #Reifier,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
TrasparentReifier >> intToVar: anInteger [
	^ anInteger asVar
]
