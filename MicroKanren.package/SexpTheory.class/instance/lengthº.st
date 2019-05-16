as yet unclassified
lengthº
	| µ |
	µ := Theory arith.
	'^ [:lst :n | Goal cond e if: lst nilº , n zeroº then: true asGoal;
		 if: lst pairº then: n positiveº , [:cdr :res | self cdro §§ {lst. cdr} , (µ succº §§ {res. n}) , [self lengthº §§ {cdr. res}] eta] fresh;
		 yourself]'.
	^ [:lst :n | lst nilº , n zeroº | (lst pairº , n positiveº , [:cdr :res | |recº| recº :=[self lengthº §§ {cdr. res}] eta. self cdro §§ {lst. cdr} , (µ succº §§ {res. n}) , recº] fresh)]