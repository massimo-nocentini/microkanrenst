Class {
	#name : #BaselineOfMicroKanren,
	#superclass : #BaselineOf,
	#category : #BaselineOfMicroKanren
}

{ #category : #baselines }
BaselineOfMicroKanren >> baseline: spec [
	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'Srfi41'
			with: [ spec repository: 'github://massimo-nocentini/srfi-41st' ];
			baseline: 'dsst'
			with: [ spec repository: 'github://massimo-nocentini/dsst' ].
		"Packages"
		spec
			package: 'MicroKanren';
			package: 'MicroKanren-Goals';
			package: 'MicroKanren-Extensions'
			with: [ spec requires: #( 'MicroKanren' ) ];
			package: 'MicroKanren-Theories'
			with: [ spec requires: #( 'MicroKanren' 'MicroKanren-Extensions' ) ];
			package: 'MicroKanren-Tests'
			with: [ spec requires: #( 'MicroKanren-Theories' ) ];
			package: 'MicroKanren-Visualizations'
			with: [ spec requires: #( 'MicroKanren' ) ];
			package: 'MicroKanren-Realog';
			package: 'MicroKanren-RB' ]
]

{ #category : #export }
BaselineOfMicroKanren >> exportForDocScript [

	<script: 'BaselineOfMicroKanren new exportForDocScript'>
	^ MetaSTExporter new
		  selectors:
			  #( onState: walk: asGoal fail tautology unifyo asReifiedVar
			     unifyWith: #onState:withVars: #onState:afterPushingGoal:
			     #onState:forGoal:fromConj: #popGoalFromPathOfState:forConj:
			     testSucceed testSucceedInvariant testFailed testFreshSucceed
			     testFreshFailed testFreshMultipleVars testUnifyWithTopmostSharing
			     testUnifyWithTopmostSharingWithRepetition
			     testUnifySharing testUnifyWithTopmostWithoutSharing
			     testUnifySymmetryFourWithVar testUnifySymmetryVarWithFour
			     testUnifyThreeWithThree testUnifyFourWithThree
			     testACORN testAppendoForward testAppendoBackward
			     testDycko testEtaRaw eternity: testDisjFalseFalse
			     testDisjTrueFalse testDisjTrueTrue testDisjThreeWithThreeOrFourWithVar
			     testDisjThreeWithVarOrFourWithVar
			     testDisjThreeWithVarOrThreeWithVar
			     testDisjThreeFourThenFive testDisjThreeThenFourFive
			     testDisjFourWithVarOrThreeWithVar
			     testConjDisj testConjFalseThreeWithVar
			     testConjSymmetry testConjThreeFour testConjThreeFourWithTwoVars
			     testConjThreeFresh testConjTrueThreeWithThree
			     testConjTrueTrue testConjFailingSharing testConjSucceedingSharing
			     testFives testFivesByPredicate testFivesSwapped
			     fives: testFivesByNats #repeat:value: testNats nats: #nats:stage:
			     #nats:stage:offset: );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source' / 'microkanren.json' ]
		  ofPackage: self class package
]
