Class {
	#name : #TrasparentReifier,
	#superclass : #Reifier,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
TrasparentReifier >> forVar: aVar [
	^ state reifyVar: aVar forTransparentReifier: self
]
