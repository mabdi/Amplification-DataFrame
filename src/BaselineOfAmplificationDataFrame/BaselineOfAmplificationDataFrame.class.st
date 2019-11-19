Class {
	#name : #BaselineOfAmplificationDataFrame,
	#superclass : #BaselineOf,
	#category : #BaselineOfAmplificationDataFrame
}

{ #category : #baselines }
BaselineOfAmplificationDataFrame >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'TestAmplificationDataFrame'
				with: [ spec requires: #('Amplification' 'DataFrame') ].
			spec
				package: 'AmplificationTempClasses'
				with: [ spec requires: #('TestAmplificationDataFrame') ].
			spec
				baseline: 'Amplification'
				with: [ spec repository: 'github://mabdi/small-amp/src' ].
			spec
				baseline: 'DataFrame'
				with: [ spec repository: 'github://PolyMathOrg/DataFrame:v2.0/src' ] ]
]
