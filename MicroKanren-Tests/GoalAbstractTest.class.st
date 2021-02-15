Class {
	#name : #GoalAbstractTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #'as yet unclassified' }
GoalAbstractTest >> exportComputationTreeOfGoal: g limitedTo: n [

	^ self
		  export: (g asLogicComputationTreeLimitedTo: n)
		  pathSuffix: ''
		  selector: #gtInspectorTreeUsingCanvas:
]
