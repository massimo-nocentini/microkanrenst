"
I am a reifier that replaces the variables without a value by plain `Var` objects, numbered from 0, instead of reified ones. `Master` and `Reuse` use me, by `State>>trasparentReifier`, for the answers they cache and read.

```smalltalk
(Dictionary new asState trasparentReifier
	reifyVars: { 7 asVar. 9 asVar })
	= { 0 asVar. 1 asVar }. ""=> true""
```
"
Class {
	#name : #TrasparentReifier,
	#superclass : #Reifier,
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
TrasparentReifier >> forVar: aVar [
	^ state reifyVar: aVar forTransparentReifier: self
]
