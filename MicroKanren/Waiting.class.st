Class {
	#name : #Waiting,
	#superclass : #Chain,
	#instVars : [
		'streams'
	],
	#category : 'MicroKanren-chains'
}

{ #category : #dispatched }
Waiting >> mplus: aBlockClosure sequential: aSequential [ 
	^ self
		successCont: [self notImplemented]
		failureCont: [aBlockClosure value mplusWithWaitedStreams: streams sequential: aSequential]
]

{ #category : #accessing }
Waiting >> streams: anArray [ 
	streams:= anArray
]

{ #category : #'as yet unclassified' }
Waiting >> successCont: aBlockClosure failureCont: anotherBlockClosure [ 
	| loop |
	loop := nil.
	loop := [:w :a | w
				ifEmpty: [anotherBlockClosure value]
				ifNotEmpty: [| car cdr |
					car := w first.
					cdr := w allButFirst.
					car isReady
						ifTrue: [aBlockClosure
								value: (car
										successContForWaitedStreams: cdr
										withWaitingCtor: [self notImplemented])]
						ifFalse: [loop
								value: cdr
								value: (car cons: a)]]].
	^ loop value: streams value: LinkedList new asCons
]
