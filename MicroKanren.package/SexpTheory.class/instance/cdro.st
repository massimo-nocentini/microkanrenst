as yet unclassified
cdro
	^ [:aCons :aCdr | [:aCar | self conso &&! {aCar.aCdr.aCons}] fresh]