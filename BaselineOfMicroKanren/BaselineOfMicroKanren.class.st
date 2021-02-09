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
			     unifyWith: #unifyWith:usingUnifier: #onState:withVars:
			     #onState:afterPushingGoal: #onState:forGoal:fromConj:
			     #popGoalFromPathOfState:forConj:
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
			  #( asGoalWithUnaryASTof: substituteVariablesUsingDictionary:
			     visitLogicVariableNode: visitTemporaryNode:
			     asRBNode asLiteralRBNode #asGoalWithASTof:select:
			     unaryRBNode sourceNode ·> ··> ···> testSenderoForCompiledMethod
			     testSenderoForBlockClosure testSenderoForEmptyBlockClosure
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

{ #category : #export }
BaselineOfMicroKanren >> scriptExportTheLittleProverChapter01ForDoc [

	<script:
	'BaselineOfMicroKanren new scriptExportTheLittleProverChapter01ForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( isAtom #isAtomConsº #consª:isAtomª: #consº:isAtomº:
			     flapjackNilFalseº carConsº cdrConsº isAtomNilº equalSwapº
			     test_chapter_01_OldGamesNewRules_frame_06
			     test_chapter_01_OldGamesNewRules_frame_11
			     test_chapter_01_OldGamesNewRules_frame_14
			     #test_chapter_01_OldGamesNewRules_frame_16_byBlockClosure
			     test_chapter_01_OldGamesNewRules_frame_16_byCompiledMethod
			     test_chapter_01_OldGamesNewRules_frame_16_backward
			     #flapjackEqualsConsº:isAtomº: #flapjackEqualsConsª:isAtomª:
			     test_chapter_01_OldGamesNewRules_frame_19
			     test_chapter_01_OldGamesNewRules_frame_21
			     test_chapter_01_OldGamesNewRules_frame_28
			     test_chapter_01_OldGamesNewRules_frame_32
			     test_chapter_01_OldGamesNewRules_frame_44
			     test_chapter_01_OldGamesNewRules_frame_46
			     test_chapter_01_OldGamesNewRules_frame_46_variablesBindingByEqualSameº
			     test_chapter_01_OldGamesNewRules_frame_46_variablesBindingManually
			     test_chapter_01_OldGamesNewRules_frame_49
			     test_chapter_01_OldGamesNewRules_frame_55
			     test_chapter_01_OldGamesNewRules_frame_56 );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source'
			  / 'microkanren-the-little-prover-chapter-01.json' ]
		  ofPackage: self class package
]

{ #category : #export }
BaselineOfMicroKanren >> scriptExportTheLittleProverChapter02ForDoc [

	<script:
	'BaselineOfMicroKanren new scriptExportTheLittleProverChapter02ForDoc'>
	^ MetaSTExporter new
		  selectors: #( #test_chapter_02_EvenOlderGames_frame_05
			     #test_chapter_02_EvenOlderGames_frame_07
			     #test_chapter_02_EvenOlderGames_frame_15 );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source'
			  / 'microkanren-the-little-prover-chapter-02.json' ]
		  ofPackage: self class package
]

{ #category : #export }
BaselineOfMicroKanren >> scriptExportTheLittleProverPredicatesForDoc [

	<script:
	'BaselineOfMicroKanren new scriptExportTheLittleProverPredicatesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( isAtom #isAtomConsº #consª:isAtomª: #consº:isAtomº:
			     flapjackNilFalseº carConsº cdrConsº isAtomNilº equalSwapº
			     #flapjackEqualsConsº:isAtomº: #flapjackEqualsConsª:isAtomª:
			     ifSameº ifTrueº ifFalseº equalIfº );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'booklet' / 'source'
			  / 'microkanren-the-little-prover-predicates.json' ]
		  ofPackage: self class package
]
