listing
atMost: n
	^ n isZero
		ifTrue: [ Chain bottom ]
		ifFalse: [ | tail |
			tail := self next atMost: n - 1.
			self class item: item linker: [ :_ | tail ] ]