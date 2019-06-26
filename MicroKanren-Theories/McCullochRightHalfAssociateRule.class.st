Class {
	#name : #McCullochRightHalfAssociateRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories-McCulloch machine\'s rules'
}

{ #category : #computing }
McCullochRightHalfAssociateRule >> relateo [
	^ [:alpha :half_associate | [:beta :gamma | (alpha unifyo
		value: (6 cons: beta))
		, ((half_associate
				unifyo value:  (2 cons: gamma))
				, (machine relateo value: beta value: gamma))] fresh]
]
