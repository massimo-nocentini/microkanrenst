"
I am the goal of a tabled block, that is of a block whose answers are kept in a `table` and reused by the next call whose arguments are reified alike. `BlockClosure>>tabled` answers a block that makes me for its arguments (from 1 to 5 of them).

My key in the table is the reification of `args`:

- if it is not there, I add it with an empty cache, and run the goal of my `block` followed by a `Master`, which fills the cache
- if it is there, I run a `Reuse` on its cache
"
Class {
	#name : #Tabled,
	#superclass : #Goal,
	#instVars : [
		'block',
		'args',
		'table'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Tabled >> args: aCons [ 
	args := aCons
]

{ #category : #accessing }
Tabled >> block: aBlockClosure [ 
	block := aBlockClosure
]

{ #category : #running }
Tabled >> onState: aState [ 
	| key |
	key := aState reifier reifyVars: args.
	^ table
		at: key
		ifPresent: [:cache | 
			| r |
			r := Reuse new args: args;
						 cache: cache;
						 yourself.
			r onState: aState]
		ifAbsent: [| cache g m |
			cache := LinkedList new.
			table at: key put: cache.
			g := block valueWithArguments: args.
			m := Master new args: args;
						 cache: cache;
						 yourself.
			g , m onState: aState]
]

{ #category : #accessing }
Tabled >> table: aDictionary [ 
	table := aDictionary
]
