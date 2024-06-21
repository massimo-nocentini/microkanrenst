Extension { #name : 'ReifiedVar' }

{ #category : '*MicroKanren-RB' }
ReifiedVar >> formattedCode [

	^ '◊' , self asString
]
