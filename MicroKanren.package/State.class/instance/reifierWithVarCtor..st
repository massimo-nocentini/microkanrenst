reification
reifierWithVarCtor: aSymbol
	^ Reifier new state: self; varCtor: aSymbol; yourself