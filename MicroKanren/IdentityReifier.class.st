"
I am a reifier that leaves the variables without a value as they are. `State>>identityReifier` makes me.

```smalltalk
(Dictionary new asState identityReifier
	reifyVars: { 7 asVar. 9 asVar })
	= { 7 asVar. 9 asVar }. ""=> true""
```
"
Class {
	#name : #IdentityReifier,
	#superclass : #Reifier,
	#category : #MicroKanren
}

{ #category : #dispatched }
IdentityReifier >> forVar: aVar [
	^ state reifyVar: aVar forIdentityReifier: self
]
