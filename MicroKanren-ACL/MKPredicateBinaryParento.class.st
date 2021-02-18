Class {
	#name : #MKPredicateBinaryParento,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-ACL'
}

{ #category : #running }
MKPredicateBinaryParento >> binaryMessages [

	^ #( cons: = + - )
]

{ #category : #running }
MKPredicateBinaryParento >> binaryMessagesGoal [

	^ [ :c | 
	  | cRB |
	  cRB := c asRBNode.

	  self binaryMessages
		  foldr: [ :each :aGoal | 
			  | l r |
			  l := self unifyº value: secondArgument value: (RBMessageNode
					        receiver: firstArgument
					        selector: each
					        arguments: { cRB }).
			  r := self unifyº value: secondArgument value: (RBMessageNode
					        receiver: cRB
					        selector: each
					        arguments: { firstArgument }).
			  l | r | aGoal ]
		  init: false asGoal ] asGoal
]

{ #category : #running }
MKPredicateBinaryParento >> goal [

	| sequenceGoal blockGoal messageNode |
	sequenceGoal := self unifyº
		                value: secondArgument
		                value:
		                (RBSequenceNode statements: { firstArgument }).

	messageNode := self unaryMessagesGoal | self binaryMessagesGoal
	               | self ifMessageGoal.

	blockGoal := self unifyº
		             value: secondArgument
		             value:
		             (RBBlockNode body:
			              (RBSequenceNode statements: { firstArgument })).

	^ messageNode | sequenceGoal | blockGoal
]

{ #category : #running }
MKPredicateBinaryParento >> ifMessageGoal [

	^ [ :c :r | 
	  | cRB rRB if1 if2 if3 |
	  cRB := c asRBNode.
	  rRB := r asRBNode.

	  if1 := self unifyº value: secondArgument value: ([ :q :w :e | 
		          q
			          ifTrue: [ w ]
			          ifFalse: [ e ] ] 
			          substituteVariablesUsingSequenceableCollection:
			          (Array with: firstArgument with: cRB with: rRB)).

	  if2 := self unifyº value: secondArgument value: ([ :q :w :e | 
		          w
			          ifTrue: [ q ]
			          ifFalse: [ e ] ] 
			          substituteVariablesUsingSequenceableCollection:
			          (Array with: firstArgument with: cRB with: rRB)).

	  if3 := self unifyº value: secondArgument value: ([ :q :w :e | 
		          w
			          ifTrue: [ e ]
			          ifFalse: [ q ] ] 
			          substituteVariablesUsingSequenceableCollection:
			          (Array with: firstArgument with: cRB with: rRB)).

	  if1 | if2 | if3 ] asGoal
]

{ #category : #accessing }
MKPredicateBinaryParento >> name [

	^ 'parentº'
]

{ #category : #running }
MKPredicateBinaryParento >> unaryMessages [

	"	^ #( isUffish isBrillig isSlithy frabjous mimsy mome frumious )"

	^ #( car cdr )
]

{ #category : #running }
MKPredicateBinaryParento >> unaryMessagesGoal [

	^ self unaryMessages
		  foldr: [ :each :aGoal | 
			  | g |
			  g := self unifyº
				       value: secondArgument
				       value:
				       (RBMessageNode receiver: firstArgument selector: each).
			  g | aGoal ]
		  init: false asGoal
]
