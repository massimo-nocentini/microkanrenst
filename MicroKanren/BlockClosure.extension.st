Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-core' }
BlockClosure >> fresh [
	^ Goal fresh: self
]

{ #category : #'*MicroKanren-core' }
BlockClosure >> tabled [
	| table ctor |
	table := Dictionary new.
	ctor := [:args | Goal
				tabledBlock: self
				withArgs: args
				withTable: table].
	^ numArgs caseOf: {
		[1] -> [[:a | ctor value: {a}]].
		[2] -> [[:a :b | ctor value: {a. b}]].
		[3] -> [[:a :b :c | ctor value: {a. b. c}]].
		[4] -> [[:a :b :c :d | ctor value: {a. b. c. d}]].
		[5] -> [[:a :b :c :d :e | ctor value: {a. b. c. d. e}]]}
]
