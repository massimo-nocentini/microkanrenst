initializing
mclock
	^ InductiveRelationsTheory new
		rules:
			{McCullochRepeatRule new.
			McCullochReverseRule new.
			McCullochRightHalfAssociateRule new.
			McCullochShrinkRule new};
		yourself