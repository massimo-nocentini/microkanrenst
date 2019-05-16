as yet unclassified
bind: aBlockClosure interleaved: anInterleaved 
	| alpha beta |
	alpha := aBlockClosure value: item.
	beta := [rest bind: aBlockClosure interleaved: anInterleaved].
	^ alpha mplus: beta interleaved: anInterleaved