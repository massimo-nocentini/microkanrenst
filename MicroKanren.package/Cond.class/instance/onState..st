running
onState: aState 
	| g |
	
	g := clauses copy add: else;
				 reduceRight: if.
	^ g onState: aState