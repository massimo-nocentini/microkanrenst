creating
tabledBlock: aBlockClosure withArgs: args withTable: aDictionary 
	^ Tabled new block: aBlockClosure; args: args; table: aDictionary; yourself