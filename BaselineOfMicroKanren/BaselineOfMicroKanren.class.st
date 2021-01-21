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
			with: [ spec repository: 'github://massimo-nocentini/dsst' ];
			baseline: 'MetaSTExporter'
			with: [ spec repository: 'github://massimo-nocentini/MetaSTExporter/src' ].
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
BaselineOfMicroKanren >> scriptExportCoreMessagesForDoc [

	<script: 'BaselineOfMicroKanren new scriptExportCoreMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( onState: walk: asGoal fail tautology unifyo asReifiedVar
			     unifyWith: #onState:withVars: #onState:afterPushingGoal:
			     #onState:forGoal:fromConj: #popGoalFromPathOfState:forConj:
			     asReifiedWithVarClass: );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source' / 'microkanren-core-messages.json' ]
		  ofPackage: self class package
]

{ #category : #export }
BaselineOfMicroKanren >> scriptExportCoreTestsForDoc [

	<script: 'BaselineOfMicroKanren new scriptExportCoreTestsForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( testSucceed testSucceedInvariant testFailed testFreshSucceed
			     testFreshFailed testFreshMultipleVars testUnifyWithTopmostSharing
			     testUnifyWithTopmostSharingWithRepetition
			     testUnifySharing testUnifyWithTopmostWithoutSharing
			     testUnifySymmetryFourWithVar testUnifySymmetryVarWithFour
			     testUnifyThreeWithThree testUnifyFourWithThree
			     testEtaRaw eternity: testDisjFalseFalse #testDisjFalseTrue
			     testDisjTrueTrue testDisjThreeWithThreeOrFourWithVar
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
			  aPath / 'booklet' / 'source' / 'microkanren-core-tests.json' ]
		  ofPackage: self class package
]

{ #category : #export }
BaselineOfMicroKanren >> scriptExportRBTheoryForDoc [

	<script: 'BaselineOfMicroKanren new scriptExportRBTheoryForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( #testSenderoForCompiledMethod testSenderoForBlockClosure
			     testSenderoForEmptyBlockClosure
			     visitMessageNode: sendso testSenderoBackwards
			     arguments_testSenderoBackwards testSenderoForIdentityBlockClosure );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source' / 'microkanren-RBNodes-theory.json' ]
		  ofPackage: self class package
]

{ #category : #export }
BaselineOfMicroKanren >> scriptExportSexpTestsForDoc [

	<script: 'BaselineOfMicroKanren new scriptExportSexpTestsForDoc'>
	^ MetaSTExporter new
		  selectors: #( testACORN testAppendoForward testAppendoBackward
			     testDycko );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source' / 'microkanren-sexp-tests.json' ]
		  ofPackage: self class package
]
