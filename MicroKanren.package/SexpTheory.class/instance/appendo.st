as yet unclassified
appendo
	^ [:aCollection :anotherCollection :aResult | Goal cond e if: aCollection nilo then: (aResult  unifyo value: anotherCollection);
		 if: true asGoal then: [:a :d :rec | self conso &&! {a. d. aCollection} , (self conso  &&!{a. rec. aResult}) , [self appendo &&! {d. anotherCollection. rec}] eta] fresh;
		 yourself]