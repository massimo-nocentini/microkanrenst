Class {
	#name : #IdentityReifier,
	#superclass : #Reifier,
	#category : #MicroKanren
}

{ #category : #dispatched }
IdentityReifier >> forVar: aVar [
	^ state reifyVar: aVar forIdentityReifier: self
]
