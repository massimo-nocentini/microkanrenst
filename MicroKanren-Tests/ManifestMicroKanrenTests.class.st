"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMicroKanrenTests,
	#superclass : #PackageManifest,
	#category : #'MicroKanren-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestMicroKanrenTests class >> ruleEndTrueFalseRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'MicroKanren-Tests')) #'2021-03-12T12:21:37.62545+01:00') )
]

{ #category : #'code-critics' }
ManifestMicroKanrenTests class >> ruleEqualsTrueRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'MicroKanren-Tests')) #'2021-03-12T12:21:47.133068+01:00') )
]
