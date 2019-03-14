creating
repeat: anObj 
	^ anObj cons: [self repeat: anObj]
		