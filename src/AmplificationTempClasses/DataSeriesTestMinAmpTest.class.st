Class {
	#name : #DataSeriesTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'series',
		'keyArray'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> setUp [
	keyArray := #(a b c d e f g h i j k).
	
	series := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testArithmeticsAddArrayToSeries_amp [
	<madeBySmallAmp>
	| series array actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	self assert: series class equals: DataSeries.
	array := #(3 4 5).
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := series + array
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testAtIndexPut_amp [
	<madeBySmallAmp>
	| expected tmp_v1qhI7CIxT1 |
	tmp_v1qhI7CIxT1 := series atIndex: 6 put: -2.
	self assert: series class equals: DataSeries.
	self assert: tmp_v1qhI7CIxT1 class equals: SmallInteger.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 -2 8 10 15 13 16)
		name: series name
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testAtTransformIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	series
		at: #NoSuchKey
		transform: [ :x | x + 1 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: series size equals: 11.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testCategoricalUniqueValues_amp [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withKeys: #(a b c d e) values: #(z y y z x).
	expected := #(x y z).
	actual := aSeries uniqueValues.
	self assert: aSeries class equals: DataSeries.
	self assert: actual class equals: Array
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testCategoricalValueCounts_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: #(8 20 16 15 13 10 9 7 6 3)
		values: #(2 1 1 1 1 1 1 1 1 1)
		name: series name.
	actual := series valueCounts.
	self assert: series size equals: 11.
	self assert: actual size equals: 10
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testCategoricalValueFrequencies_amp [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withValues: #(A B C A A B C A B B) name: #X.
	self assert: aSeries class equals: DataSeries.
	expected := DataSeries
		withKeys: #(B A C)
		values:
			{(2 / 5).
			(2 / 5).
			(1 / 5)}
		name: #X.
	actual := aSeries valueFrequencies.
	self assert: aSeries size equals: 10.
	self assert: actual size equals: 3
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testCopyCanBeChanged_amp [
	<madeBySmallAmp>
	| original seriesCopy expectedCopyAfterChange tmp_5F7Ex8WIa41 tmp_EibMtnJtKq2 tmp_xdGuq2yowU3 |
	original := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	expectedCopyAfterChange := DataSeries
		withKeys: #(b c d e)
		values: #(100 20 40 200)
		name: #Y.
	seriesCopy := original copy.
	tmp_5F7Ex8WIa41 := seriesCopy at: #b put: 100.
	tmp_EibMtnJtKq2 := seriesCopy at: #e put: 200.
	tmp_xdGuq2yowU3 := seriesCopy removeAt: #a.
	self assert: seriesCopy class equals: DataSeries.
	self assert: tmp_xdGuq2yowU3 class equals: SmallInteger.
	seriesCopy name: #Y
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testCreateDataSeriesWithValues_amp [
	<madeBySmallAmp>
	| values dataSeries |
	values := #(a b c).
	dataSeries := DataSeries withValues: values.
	self assert: dataSeries class equals: DataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testHeadN_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b)
		values: #(3 7)
		name: series name.
	actual := series head: 2.
	self assert: series size equals: 11.
	self assert: actual size equals: 2
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testHead_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c d e)
		values: #(3 7 6 20 8)
		name: series name.
	actual := series head.
	self assert: series size equals: 11.
	self assert: actual size equals: 5
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c e f g)
		values: #(3 7 6 8 9 8)
		name: 'ExampleSeries'.
	actual := series reject: [ :x | x >= 10 ].
	self assert: series size equals: 11.
	self assert: actual size equals: 6
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testRemoveAtIndex_amp [
	<madeBySmallAmp>
	| expected tmp_z8MblLr5GP1 |
	expected := DataSeries
		withKeys: (keyArray copyWithout: #c)
		values: #(3 7 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
	tmp_z8MblLr5GP1 := series removeAtIndex: 3.
	self assert: series class equals: DataSeries.
	self assert: tmp_z8MblLr5GP1 class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testStatsQuantileDoesNotModifyTheSeries_amp [
	<madeBySmallAmp>
	| copy tmp_DsvU0FCbK01 |
	copy := series copy.
	tmp_DsvU0FCbK01 := series quantile: 5.
	self assert: series class equals: DataSeries.
	self assert: series size equals: 11.
	self assert: tmp_DsvU0FCbK01 class equals: SmallInteger.
	self assert: tmp_DsvU0FCbK01 equals: 3
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testStatsSummary_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Min '1st Qu.' Median Average '3rd Qu.' Max)
		values:
			{3.
			7.
			9.
			(115 / 11).
			15.
			20}
		name: series name.
	actual := series summary.
	self assert: series size equals: 11.
	self assert: actual size equals: 6
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testTailN_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(j k)
		values: #(13 16)
		name: series name.
	actual := series tail: 2.
	self assert: series size equals: 11.
	self assert: actual size equals: 2
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testTail_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(g h i j k)
		values: #(8 10 15 13 16)
		name: series name.
	actual := series tail.
	self assert: series size equals: 11.
	self assert: actual size equals: 5
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithIndexDetectIfNone_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withIndexDetect: [ :x :i | i > 100 ]
		ifNone: [ 'not found' ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: ByteString
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithIndexDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withIndexDetect: [ :x :i | x > 5 and: i odd ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithIndexReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c e g)
		values: #(3 6 8 8)
		name: 'ExampleSeries'.
	actual := series withIndexReject: [ :x :i | x >= 10 or: i even ].
	self assert: series size equals: 11.
	self assert: actual size equals: 4
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithKeyDetectIfNone_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withKeyDetect: [ :x :k | x > 5 and: k = #NoSuchKey ]
		ifNone: [ 'not found' ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: ByteString
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithKeyDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withKeyDetect: [ :x :k | x > 5 and: k = #c ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAmpTest >> testWithKeyReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c g)
		values: #(3 6 8)
		name: 'ExampleSeries'.
	actual := series
		withKeyReject: [ :x :k | x >= 10 or: (#(a c g) includes: k) not ].
	self assert: series size equals: 11.
	self assert: actual size equals: 3
]
