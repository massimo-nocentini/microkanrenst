Class {
	#name : #RBNodeTheoryTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#instVars : [
		'sexpTheory',
		'combTheory'
	],
	#category : #'MicroKanren-Tests'
}

{ #category : #utilities }
RBNodeTheoryTest >> imagesPath [

	^ self iceWorkingDirectory / 'booklet' / 'source' / '_images'
]

{ #category : #tests }
RBNodeTheoryTest >> testUnifyEmptyBlock [

	self
		assert:
			([ :ast | ast unifyo value: [  ] sourceNode body ] 
				 asGoalWithASTof: [  ]) solutions
		equals: { Var tautology }
		modulo: #asOrderedCollection
]

{ #category : #tests }
RBNodeTheoryTest >> testUnifyLiteralBlock [

	self
		assert: [ :v | 
			[ :o :ast | 
			(o unifyo value: (RBLiteralValueNode value: nil))
			, (v unifyo value: ast) ] asGoalWithASTof: [ :o | 3 cons: o ] ]
				asGoal solutions
		equals: { [ 3 cons: nil ] sourceNode body }
		modulo: #asOrderedCollection
]
