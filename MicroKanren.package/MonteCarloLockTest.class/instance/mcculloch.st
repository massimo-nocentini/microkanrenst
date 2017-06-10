initializing
mcculloch
	^ InductiveRelationsTheory new
		rules:
			{McCullochAssociateRule new.
			McCullochIdentityRule new};
		yourself