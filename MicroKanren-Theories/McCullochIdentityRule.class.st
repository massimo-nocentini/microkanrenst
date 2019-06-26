Class {
	#name : #McCullochIdentityRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories'
}

{ #category : #computing }
McCullochIdentityRule >> relateo [
	^ [:two_alpha :alpha | two_alpha
		unifyo value:  (2 cons: alpha)]
]
