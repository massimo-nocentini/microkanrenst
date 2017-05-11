creating
id: anInteger
	^ self new
		id: ('var_' , anInteger asString) asSymbol;
		yourself