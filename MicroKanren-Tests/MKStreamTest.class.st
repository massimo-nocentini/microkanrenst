Class {
	#name : #MKStreamTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Tests'
}

{ #category : #streams }
MKStreamTest >> count: x [

	^ x ~~> [ self count: x + 1 ]
]

{ #category : #streams }
MKStreamTest >> repeat: x [

	^ x ~~> [ self repeat: x ]
]

{ #category : #tests }
MKStreamTest >> testAppendMap [

	self
		assert:
			(((self count: 1) appendMap: [ :v | self repeat: v ]) next: 50)
				readStream upToEnd
		equals:
			#( 1 1 2 1 1 2 1 3 1 2 1 1 2 1 3 1 2 1 4 1 2 1 3 1 2 1 1 2 1 3 1 2
			   1 4 1 2 1 3 1 2 1 5 1 2 1 3 1 2 1 4 )
]

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

{ #category : #tests }
MKStreamTest >> testRepeat [

	self
		assert: ((self repeat: 1) next: 20) readStream upToEnd
		equals: (Array new: 20 withAll: 1)
]
