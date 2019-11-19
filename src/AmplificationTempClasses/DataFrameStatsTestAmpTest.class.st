Class {
	#name : #DataFrameStatsTestAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#classInstVars : [
		'smallamp_logs'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> setUp [

	df := DataFrame withRows: #(
		(7.1 3.5 1.4 0.2)
		(4.9 3 1.4 0.2)
		(4.7 3.2 1.3 0.2)
		(7 3.2 4.7 1.4)
		(6.4 3.2 4.5 1.5)
		(6.9 3.1 4.9 1.5)
		(6.3 3.3 6 2.5)
		(5.8 2.7 5.1 1.9)
		(7.1 3 5.9 2.1)).
		
	df columnNames: #(sepalLength sepalWidth petalLength petalWidth).
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testAverage_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {6.244444 . 3.133333 . 3.911111 . 1.277778} asDataSeries.
	expected name: #average.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAverage_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAverage_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAverage_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAverage_amp:3.2'.
	actual := df average.
	self
		assert: df class
		equals: DataFrame
		description: 'testAverage_amp:4.1'.
	self assert: df size equals: 9 description: 'testAverage_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testAverage_amp:4.1'.
	self assert: actual size equals: 4 description: 'testAverage_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testFirstQuartile_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {5.8 . 3 . 1.4 . 0.2} asDataSeries.
	expected name: #firstQuartile.
	self
		assert: expected class
		equals: DataSeries
		description: 'testFirstQuartile_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testFirstQuartile_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testFirstQuartile_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testFirstQuartile_amp:3.2'.
	actual := df firstQuartile.
	self
		assert: df class
		equals: DataFrame
		description: 'testFirstQuartile_amp:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testFirstQuartile_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testFirstQuartile_amp:4.1'.
	self
		assert: actual size
		equals: 4
		description: 'testFirstQuartile_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testInterquartileRange_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {1.2 . 0.2 . 3.7 . 1.7} asDataSeries.
	expected name: #interquartileRange.
	self
		assert: expected class
		equals: DataSeries
		description: 'testInterquartileRange_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testInterquartileRange_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testInterquartileRange_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testInterquartileRange_amp:3.2'.
	actual := df interquartileRange.
	self
		assert: df class
		equals: DataFrame
		description: 'testInterquartileRange_amp:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testInterquartileRange_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testInterquartileRange_amp:4.1'.
	self
		assert: actual size
		equals: 4
		description: 'testInterquartileRange_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testMax_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {7.1 . 3.5 . 6 . 2.5} asDataSeries.
	expected name: #max.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMax_amp:2.1'.
	self assert: expected size equals: 4 description: 'testMax_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMax_amp:3.1'.
	self assert: expected size equals: 4 description: 'testMax_amp:3.2'.
	actual := df max.
	self
		assert: df class
		equals: DataFrame
		description: 'testMax_amp:4.1'.
	self assert: df size equals: 9 description: 'testMax_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testMax_amp:4.1'.
	self assert: actual size equals: 4 description: 'testMax_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testMedian_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {6.4 . 3.2 . 4.7 . 1.5} asDataSeries.
	expected name: #median.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMedian_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testMedian_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMedian_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testMedian_amp:3.2'.
	actual := df median.
	self
		assert: df class
		equals: DataFrame
		description: 'testMedian_amp:4.1'.
	self assert: df size equals: 9 description: 'testMedian_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testMedian_amp:4.1'.
	self assert: actual size equals: 4 description: 'testMedian_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testMin_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {4.7 . 2.7 . 1.3 . 0.2} asDataSeries.
	expected name: #min.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMin_amp:2.1'.
	self assert: expected size equals: 4 description: 'testMin_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMin_amp:3.1'.
	self assert: expected size equals: 4 description: 'testMin_amp:3.2'.
	actual := df min.
	self
		assert: df class
		equals: DataFrame
		description: 'testMin_amp:4.1'.
	self assert: df size equals: 9 description: 'testMin_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testMin_amp:4.1'.
	self assert: actual size equals: 4 description: 'testMin_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testMode_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {7.1 . 3.2 . 1.4 . 0.2} asDataSeries.
	expected name: #mode.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMode_amp:2.1'.
	self assert: expected size equals: 4 description: 'testMode_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testMode_amp:3.1'.
	self assert: expected size equals: 4 description: 'testMode_amp:3.2'.
	actual := df mode.
	self
		assert: df class
		equals: DataFrame
		description: 'testMode_amp:4.1'.
	self assert: df size equals: 9 description: 'testMode_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testMode_amp:4.1'.
	self assert: actual size equals: 4 description: 'testMode_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testRange_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {2.4 . 0.8 . 4.7 . 2.3} asDataSeries.
	expected name: #range.
	self
		assert: expected class
		equals: DataSeries
		description: 'testRange_amp:2.1'.
	self assert: expected size equals: 4 description: 'testRange_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testRange_amp:3.1'.
	self assert: expected size equals: 4 description: 'testRange_amp:3.2'.
	actual := df range.
	self
		assert: df class
		equals: DataFrame
		description: 'testRange_amp:4.1'.
	self assert: df size equals: 9 description: 'testRange_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testRange_amp:4.1'.
	self assert: actual size equals: 4 description: 'testRange_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testStdev_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {0.927512 . 0.223607 . 1.971956 . 0.877180} asDataSeries.
	expected name: #stdev.
	self
		assert: expected class
		equals: DataSeries
		description: 'testStdev_amp:2.1'.
	self assert: expected size equals: 4 description: 'testStdev_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testStdev_amp:3.1'.
	self assert: expected size equals: 4 description: 'testStdev_amp:3.2'.
	actual := df stdev.
	self
		assert: df class
		equals: DataFrame
		description: 'testStdev_amp:4.1'.
	self assert: df size equals: 9 description: 'testStdev_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testStdev_amp:4.1'.
	self assert: actual size equals: 4 description: 'testStdev_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testThirdQuartile_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {7 . 3.2 . 5.1 . 1.9} asDataSeries.
	expected name: #thirdQuartile.
	self
		assert: expected class
		equals: DataSeries
		description: 'testThirdQuartile_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testThirdQuartile_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testThirdQuartile_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testThirdQuartile_amp:3.2'.
	actual := df thirdQuartile.
	self
		assert: df class
		equals: DataFrame
		description: 'testThirdQuartile_amp:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testThirdQuartile_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testThirdQuartile_amp:4.1'.
	self
		assert: actual size
		equals: 4
		description: 'testThirdQuartile_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameStatsTestAmpTest >> testVariance_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {0.860278 . 0.050000 . 3.888611 . 0.769444} asDataSeries.
	expected name: #variance.
	self
		assert: expected class
		equals: DataSeries
		description: 'testVariance_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testVariance_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testVariance_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testVariance_amp:3.2'.
	actual := df variance.
	self
		assert: df class
		equals: DataFrame
		description: 'testVariance_amp:4.1'.
	self assert: df size equals: 9 description: 'testVariance_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testVariance_amp:4.1'.
	self
		assert: actual size
		equals: 4
		description: 'testVariance_amp:4.2'
]
