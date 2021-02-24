Class {
	#name : #GoalAbstractTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #asserting }
GoalAbstractTest >> assert: actual equals: expected modulo: aSelector [

	"I'm an helper of #assert:equals: that comsume two collections (not strictly eager ones) and
	check if they are the same with respect to conversion given by `aSelector`."

	self
		assert: (aSelector value: actual readStream upToEnd)
		equals: (aSelector value: expected)
]

{ #category : #'as yet unclassified' }
GoalAbstractTest >> exportComputationTreeOfGoal: g limitedTo: n [

	^ self
		  export: (g asLogicComputationTreeLimitedTo: n)
		  pathSuffix: ''
		  selector: #gtInspectorTreeUsingCanvas:
]
