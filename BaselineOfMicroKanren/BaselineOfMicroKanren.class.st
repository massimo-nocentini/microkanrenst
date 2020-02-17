Class {
	#name : #BaselineOfMicroKanren,
	#superclass : #BaselineOf,
	#category : #BaselineOfMicroKanren
}

{ #category : #baselines }
BaselineOfMicroKanren >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Externals."
			spec
				baseline: 'Srfi41'
					with: [ spec repository: 'github://massimo-nocentini/srfi-41st' ];
				baseline: 'dsst'
					with: [ spec repository: 'github://massimo-nocentini/dsst' ].
			"Packages"
			spec
				package: 'MicroKanren';
				package: 'MicroKanren-Goals';
				package: 'MicroKanren-Extensions'
					with: [ spec requires: #('MicroKanren') ];
				package: 'MicroKanren-Theories'
					with: [ spec requires: #('MicroKanren' 'MicroKanren-Extensions') ];
				package: 'MicroKanren-Tests'
					with: [ spec requires: #('MicroKanren-Theories') ];
				package: 'MicroKanren-Visualizations'
					with: [ spec requires: #('MicroKanren') ] ]
]
