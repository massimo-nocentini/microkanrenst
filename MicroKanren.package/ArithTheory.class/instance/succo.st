as yet unclassified
succo
	^ [:n :nSucc | Goal cond e if: n zeroo then: nSucc oneo;
		 if: n positiveo then: nSucc greaterThanOneo , (self pluso &&! {1 asConsedBinaryRepr. n. nSucc});
		 yourself]