as yet unclassified
lengtho
	| µ |
	µ := Theory arith.
	^ [:lst :n | lst nilo , n zeroo | (lst pairo , n positiveo , [:cdr :res | 
			| recº |
			recº := [self lengtho &&!{cdr. res}] eta.
			self cdro &&! {lst. cdr} , (µ succo &&! {res. n}) , recº] fresh)]