as yet unclassified
bitAndo
	^ [:x :y :z | Goal cond e if: (x unifyo value: 0) , (y unifyo value: 0) then: (z unifyo value: 0);
		 if: (x unifyo value: 0) , (y unifyo value: 1) then: (z unifyo value: 0);
		 if: (x unifyo value: 1) , (y unifyo value: 0) then: (z unifyo value: 0);
		 if: (x unifyo value: 1) , (y unifyo value: 1) then: (z unifyo value: 1);
		 yourself]