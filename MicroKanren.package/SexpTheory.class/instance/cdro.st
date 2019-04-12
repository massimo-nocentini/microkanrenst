as yet unclassified
cdro
	^ [:aCons :aCdr | [:aCar | self conso
		value: aCar
		value: aCdr
		value: aCons] fresh]