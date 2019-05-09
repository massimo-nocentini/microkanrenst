as yet unclassified
bitXorº
	^ [:x :y :z | Goal cond e if:x =° 0 , (y =° 0) then: (z =° 0); if: (x =° 0 , (y =° 1) ) then: (z =° 1); if: (x =° 1 , (y =° 0))then: (z =° 1); if: (x =° 1 , (y =° 1) ) then: (z =° 0); yourself]