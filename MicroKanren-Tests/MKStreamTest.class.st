Class {
	#name : #MKStreamTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
MKStreamTest >> testAppendStream [

	self
		assert: ([ 1 ~~> nil ] appendStream: nil) readStream upToEnd
		equals: #( 1 )
]

{ #category : #tests }
MKStreamTest >> testAppendStream1Nil [

	self
		assert: (1 ~~> nil appendStream: nil) readStream upToEnd
		equals: #( 1 )
]

{ #category : #tests }
MKStreamTest >> testAppendStreamBlockBlock [

	self
		assert:
			([ 1 ~~> nil ] appendStream: [ 2 ~~> [ 3 ~~> nil ] ]) readStream
				upToEnd
		equals: #( 1 2 3 )
]

{ #category : #tests }
MKStreamTest >> testAppendStreamBlockNil [

	self
		assert: ([ 1 ~~> nil ] appendStream: nil) readStream upToEnd
		equals: #( 1 )
]

{ #category : #tests }
MKStreamTest >> testAppendStreamNilNil [

	self assert: (nil appendStream: nil) readStream upToEnd equals: #(  )
]
