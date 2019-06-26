as yet unclassified
caro
	^ [:aCons :aCar | [:aCdr | self conso &&! {aCar.aCdr.aCons}] fresh]