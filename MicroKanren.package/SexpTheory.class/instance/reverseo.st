as yet unclassified
reverseo
	^ [:reversing :reversed | Goal cond e if: reversing nilo then: reversed nilo;
		 if: true asGoal then: [:car :cdr :res | self conso &&! {car. cdr. reversing} , (self appendo &&! {res. {car} asCons. reversed}) , [self reverseo &&! {cdr.res}] eta] fresh]