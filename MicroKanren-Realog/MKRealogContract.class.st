"
I am a contract between an `employee` and a `company`, with an `id` and a `type`: two contracts unify when these four parts do.

```smalltalk
[ :x |
	((MKRealogIDType contract: 1)
		employee: (MKRealogIDType employee: 2);
		company: (MKRealogIDType company: 3);
		type: #full;
		yourself) unifyo value: ((MKRealogIDType contract: 1)
			employee: (MKRealogIDType employee: 2);
			company: (MKRealogIDType company: x);
			type: #full;
			yourself) ] asGoal solutions readStream upToEnd. ""=> #(3)""
```
"
Class {
	#name : #MKRealogContract,
	#superclass : #MKRealogIDType,
	#instVars : [
		'employee',
		'company',
		'type'
	],
	#category : #'MicroKanren-Realog'
}

{ #category : #printing }
MKRealogContract >> betweenParenthesisPrintOn: aStream [
	super betweenParenthesisPrintOn: aStream.
	aStream nextPutAll: ', '.
	type printOn: aStream.
	aStream nextPutAll: ', '.
	employee printOn: aStream.
	aStream nextPutAll: ', '.
	company printOn: aStream
]

{ #category : #accessing }
MKRealogContract >> company [
	^ company
]

{ #category : #accessing }
MKRealogContract >> company: anObject [
	company := anObject
]

{ #category : #accessing }
MKRealogContract >> employee [
	^ employee
]

{ #category : #accessing }
MKRealogContract >> employee: anObject [
	employee := anObject
]

{ #category : #dispatching }
MKRealogContract >> reifyUsingReifier: aReifier [
	^ aReifier forRealogContract: self
]

{ #category : #accessing }
MKRealogContract >> type [
	^ type
]

{ #category : #accessing }
MKRealogContract >> type: anObject [
	type := anObject
]

{ #category : #dispatching }
MKRealogContract >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithRealogContract: self usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
MKRealogContract >> unifyWithRealogContract: aContract usingUnifier: anUnifier [
	^ anUnifier forRealogContract: self forRealogContract: aContract
]

{ #category : #'as yet unclassified' }
MKRealogContract >> walkStarUsingWalker: aWalker [
	^ aWalker forRealogContract: self
]
