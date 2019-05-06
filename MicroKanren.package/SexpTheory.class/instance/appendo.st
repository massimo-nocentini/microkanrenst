as yet unclassified
appendo
	^ [:aCollection :anotherCollection :aResult | Goal cond e if: aCollection nilº then: aResult =° anotherCollection;
		 if: true asGoal then: [:a :d :rec | self conso §§ {a. d. aCollection} , (self conso §§ {a. rec. aResult}) , [self appendo §§ {d. anotherCollection. rec}] eta] fresh;
		 yourself]