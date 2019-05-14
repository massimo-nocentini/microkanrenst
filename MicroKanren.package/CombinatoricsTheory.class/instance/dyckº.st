as yet unclassified
dyckº
	| µ |
	µ := Theory sexp.
	^ [:alpha | Goal cond e if: alpha nilº then: true asGoal;
		 if: true asGoal then: [:beta :gamma | µ appendo §§ {$( cons: beta. $) cons: gamma. alpha} , ([self dyckº § beta] eta , [self dyckº § gamma] eta)] fresh;
		 yourself]