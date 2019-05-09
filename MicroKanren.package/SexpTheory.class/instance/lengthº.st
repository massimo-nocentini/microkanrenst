as yet unclassified
lengthº
	| µ |
	µ := Theory arith.
	^ [:lst :n | Goal cond e if: lst nilº then: n zeroº;
		 if: lst pairº then: n positiveº , [:cdr :res | self cdro §§ {lst. cdr} , (µ succº §§ {res. n}) , [self lengthº §§ {cdr. res}] eta] fresh;
		 yourself]