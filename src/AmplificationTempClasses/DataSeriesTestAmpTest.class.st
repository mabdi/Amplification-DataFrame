Class {
	#name : #DataSeriesTestAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'series',
		'keyArray'
	],
	#classInstVars : [
		'smallamp_logs'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> setUp [
	keyArray := #(a b c d e f g h i j k).
	
	series := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddArrayToSeries_amp [
	<madeBySmallAmp>
	| series array actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddArrayToSeries_amp:1.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddArrayToSeries_amp:1.2'.
	array := #(3 4 5).
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddArrayToSeries_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddArrayToSeries_amp:3.2'.
	actual := series + array.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddArrayToSeries_amp:4.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddArrayToSeries_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddArrayToSeries_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddArrayToSeries_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddScalarToSeries_amp [
	<madeBySmallAmp>
	| series scalar actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddScalarToSeries_amp:1.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddScalarToSeries_amp:1.2'.
	scalar := 10.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(11 12 13)
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddScalarToSeries_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddScalarToSeries_amp:3.2'.
	actual := series + scalar.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddScalarToSeries_amp:4.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddScalarToSeries_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddScalarToSeries_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddScalarToSeries_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddSeriesToArray_amp [
	<madeBySmallAmp>
	| array series actual expected |
	array := #(1 2 3).
	series := DataSeries withKeys: #(a b c) values: #(3 4 5) name: #X.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToArray_amp:2.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddSeriesToArray_amp:2.2'.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToArray_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddSeriesToArray_amp:3.2'.
	actual := array + series.
	self
		assert: array class
		equals: Array
		description: 'testArithmeticsAddSeriesToArray_amp:4.1'.
	self
		assert: array size
		equals: 3
		description: 'testArithmeticsAddSeriesToArray_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToArray_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddSeriesToArray_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddSeriesToScalar_amp [
	<madeBySmallAmp>
	| scalar series actual expected |
	scalar := 10.
	series := DataSeries withKeys: #(a b c) values: #(3 4 5) name: #X.
	self
		assert: series class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToScalar_amp:2.1'.
	self
		assert: series size
		equals: 3
		description: 'testArithmeticsAddSeriesToScalar_amp:2.2'.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(13 14 15)
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToScalar_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddSeriesToScalar_amp:3.2'.
	actual := scalar + series.
	self
		assert: scalar class
		equals: SmallInteger
		description: 'testArithmeticsAddSeriesToScalar_amp:4.1'.
	self
		assert: scalar
		equals: 10
		description: 'testArithmeticsAddSeriesToScalar_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToScalar_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddSeriesToScalar_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddSeriesToSeriesDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddSeriesToSeriesSameKeysAndName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:2.2'.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:3.2'.
	actual := firstSeries + secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysAndName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:2.2'.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:3.2'.
	actual := firstSeries + secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsAddSeriesToSeriesSameKeysDifferentName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideArrayBySeries_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := {2 . 2 . 1} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesByArray_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := {(1 / 2).
	(1 / 2).
	1} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesByScalar_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(0.5 1 1.5) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesBySeriesDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:2.2'.
	expected := DataSeries
		withKeys: #(a b c)
		values:
			{(1 / 3).
			(1 / 2).
			(3 / 5)}
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:3.2'.
	actual := firstSeries / secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysAndName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:2.2'.
	expected := DataSeries
		withKeys: #(a b c)
		values:
			{(1 / 3).
			(1 / 2).
			(3 / 5)}
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:3.2'.
	actual := firstSeries / secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsDivideSeriesBySeriesSameKeysDifferentName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsDivideSeriesBySeries_amp [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := {2 . 2 . 1} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplyArrayBySeries_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(2 8 9) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplyScalarBySeries_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(2 4 6) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesByArray_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(2 8 9) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesByScalar_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(2 4 6) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesBySeriesDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:2.2'.
	expected := DataSeries withKeys: #(a b c) values: #(3 8 15) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:3.2'.
	actual := firstSeries * secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysAndName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:2.2'.
	expected := DataSeries withKeys: #(a b c) values: #(3 8 15) name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:3.2'.
	actual := firstSeries * secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsMultiplySeriesBySeries_amp [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := #(2 8 9) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractArrayFromSeries_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(-1 -2 0) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractScalarFromSeries_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(-1 0 1) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromArray_amp [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(1 2 0) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromScalar_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(1 0 -1) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromSeriesDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:2.2'.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(-2 -2 -2)
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:3.2'.
	actual := firstSeries - secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysAndName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:2.2'.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(-2 -2 -2)
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:3.2'.
	actual := firstSeries - secondSeries.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testArithmeticsSubtractSeriesFromSeries_amp [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := #(1 2 0) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAsDictionary_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := {('a' -> 3).
	('b' -> 7).
	('c' -> 6).
	('d' -> 20).
	('e' -> 8).
	('f' -> 9).
	('g' -> 8).
	('h' -> 10).
	('i' -> 15).
	('j' -> 13).
	('k' -> 16)} asDictionary.
	actual := series asDictionary.
	self
		assert: series class
		equals: DataSeries
		description: 'testAsDictionary_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testAsDictionary_amp:2.2'.
	self
		assert: actual class
		equals: Dictionary
		description: 'testAsDictionary_amp:2.1'.
	self
		assert: actual size
		equals: 11
		description: 'testAsDictionary_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtIndexPut_amp [
	<madeBySmallAmp>
	| expected tmp_v1qhI7CIxT1 |
	tmp_v1qhI7CIxT1 := series atIndex: 6 put: -2.
	self
		assert: series class
		equals: DataSeries
		description: 'testAtIndexPut_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testAtIndexPut_amp:1.2'.
	self
		assert: tmp_v1qhI7CIxT1 class
		equals: SmallInteger
		description: 'testAtIndexPut_amp:1.1'.
	self
		assert: tmp_v1qhI7CIxT1
		equals: -2
		description: 'testAtIndexPut_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 -2 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtIndexPut_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testAtIndexPut_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtIndexTransform_amp [
	<madeBySmallAmp>
	| expected |
	series atIndex: 6 transform: [ :x | x + 1 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testAtIndexTransform_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testAtIndexTransform_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 10 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtIndexTransform_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testAtIndexTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtIndex_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtPutNewElement_amp [
	<madeBySmallAmp>
	| expected tmp_bTarqYWuPg1 |
	tmp_bTarqYWuPg1 := series at: #X put: -2.
	self
		assert: series class
		equals: DataSeries
		description: 'testAtPutNewElement_amp:1.1'.
	self
		assert: series size
		equals: 12
		description: 'testAtPutNewElement_amp:1.2'.
	self
		assert: tmp_bTarqYWuPg1 class
		equals: SmallInteger
		description: 'testAtPutNewElement_amp:1.1'.
	self
		assert: tmp_bTarqYWuPg1
		equals: -2
		description: 'testAtPutNewElement_amp:1.2'.
	expected := DataSeries
		withKeys: (keyArray copyWith: #X)
		values: #(3 7 6 20 8 9 8 10 15 13 16 -2)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtPutNewElement_amp:2.1'.
	self
		assert: expected size
		equals: 12
		description: 'testAtPutNewElement_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtPut_amp [
	<madeBySmallAmp>
	| expected tmp_p6Sfq5Hfev1 |
	tmp_p6Sfq5Hfev1 := series at: #f put: -2.
	self
		assert: series class
		equals: DataSeries
		description: 'testAtPut_amp:1.1'.
	self assert: series size equals: 11 description: 'testAtPut_amp:1.2'.
	self
		assert: tmp_p6Sfq5Hfev1 class
		equals: SmallInteger
		description: 'testAtPut_amp:1.1'.
	self
		assert: tmp_p6Sfq5Hfev1
		equals: -2
		description: 'testAtPut_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 -2 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtPut_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testAtPut_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtTransformIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	series
		at: #NoSuchKey
		transform: [ :x | x + 1 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: series class
		equals: DataSeries
		description: 'testAtTransformIfAbsent_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testAtTransformIfAbsent_amp:2.2'.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtTransformIfAbsent_amp:3.1'.
	self
		assert: expected size
		equals: 11
		description: 'testAtTransformIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	series at: #f transform: [ :x | x + 1 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testAtTransform_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testAtTransform_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 10 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAtTransform_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testAtTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testAt_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCategoricalCrossTabulateWith_amp [
	<madeBySmallAmp>
	| series1 series2 expected |
	series1 := #(A B C A A B C A B B) asDataSeries.
	series2 := #(1 2 1 2 1 1 2 1 2 2) asDataSeries.
	expected := DataFrame withRows: #(#(3 1) #(1 3) #(1 1)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCategoricalCrossTabulateWith_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testCategoricalCrossTabulateWith_amp:3.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCategoricalCrossTabulateWith_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testCategoricalCrossTabulateWith_amp:4.2'.
	expected columnNames: #(1 2).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCategoricalCrossTabulateWith_amp:5.1'.
	self
		assert: expected size
		equals: 3
		description: 'testCategoricalCrossTabulateWith_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCategoricalUniqueValues_amp [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withKeys: #(a b c d e) values: #(z y y z x).
	self
		assert: aSeries class
		equals: DataSeries
		description: 'testCategoricalUniqueValues_amp:1.1'.
	self
		assert: aSeries size
		equals: 5
		description: 'testCategoricalUniqueValues_amp:1.2'.
	expected := #(x y z).
	actual := aSeries uniqueValues.
	self
		assert: aSeries class
		equals: DataSeries
		description: 'testCategoricalUniqueValues_amp:3.1'.
	self
		assert: aSeries size
		equals: 5
		description: 'testCategoricalUniqueValues_amp:3.2'.
	self
		assert: actual class
		equals: Array
		description: 'testCategoricalUniqueValues_amp:3.1'.
	self
		assert: actual size
		equals: 3
		description: 'testCategoricalUniqueValues_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCategoricalValueCounts_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: #(8 20 16 15 13 10 9 7 6 3)
		values: #(2 1 1 1 1 1 1 1 1 1)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testCategoricalValueCounts_amp:1.1'.
	self
		assert: expected size
		equals: 10
		description: 'testCategoricalValueCounts_amp:1.2'.
	actual := series valueCounts.
	self
		assert: series class
		equals: DataSeries
		description: 'testCategoricalValueCounts_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testCategoricalValueCounts_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testCategoricalValueCounts_amp:2.1'.
	self
		assert: actual size
		equals: 10
		description: 'testCategoricalValueCounts_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCategoricalValueFrequencies_amp [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withValues: #(A B C A A B C A B B) name: #X.
	self
		assert: aSeries class
		equals: DataSeries
		description: 'testCategoricalValueFrequencies_amp:1.1'.
	self
		assert: aSeries size
		equals: 10
		description: 'testCategoricalValueFrequencies_amp:1.2'.
	expected := DataSeries
		withKeys: #(B A C)
		values:
			{(2 / 5).
			(2 / 5).
			(1 / 5)}
		name: #X.
	self
		assert: expected class
		equals: DataSeries
		description: 'testCategoricalValueFrequencies_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testCategoricalValueFrequencies_amp:2.2'.
	actual := aSeries valueFrequencies.
	self
		assert: aSeries class
		equals: DataSeries
		description: 'testCategoricalValueFrequencies_amp:3.1'.
	self
		assert: aSeries size
		equals: 10
		description: 'testCategoricalValueFrequencies_amp:3.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testCategoricalValueFrequencies_amp:3.1'.
	self
		assert: actual size
		equals: 3
		description: 'testCategoricalValueFrequencies_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCloseToDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testCloseToDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testCloseToDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 0.10000001 2)
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testCloseToDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testCloseToDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCloseToDifferentNames_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testCloseToDifferentNames_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testCloseToDifferentNames_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.10000001 2)
		name: 'B'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testCloseToDifferentNames_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testCloseToDifferentNames_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCloseToDifferentValues_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testCloseToDifferentValues_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testCloseToDifferentValues_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 3.10000001 2)
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testCloseToDifferentValues_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testCloseToDifferentValues_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCloseTo_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testCloseTo_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testCloseTo_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.10000001 2)
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testCloseTo_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testCloseTo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCollect_amp [
	<madeBySmallAmp>
	| actual expected |
	actual := series collect: [ :each | each / 10 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testCollect_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testCollect_amp:1.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testCollect_amp:1.1'.
	self
		assert: actual size
		equals: 11
		description: 'testCollect_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values:
			{(3 / 10).
			(7 / 10).
			(3 / 5).
			2.
			(4 / 5).
			(9 / 10).
			(4 / 5).
			1.
			(3 / 2).
			(13 / 10).
			(8 / 5)}
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testCollect_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testCollect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCopyCanBeChanged_amp [
	<madeBySmallAmp>
	| original seriesCopy expectedCopyAfterChange tmp_5F7Ex8WIa41 tmp_EibMtnJtKq2 tmp_xdGuq2yowU3 |
	original := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	self
		assert: original class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:1.1'.
	self
		assert: original size
		equals: 4
		description: 'testCopyCanBeChanged_amp:1.2'.
	expectedCopyAfterChange := DataSeries
		withKeys: #(b c d e)
		values: #(100 20 40 200)
		name: #Y.
	self
		assert: expectedCopyAfterChange class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:2.1'.
	self
		assert: expectedCopyAfterChange size
		equals: 4
		description: 'testCopyCanBeChanged_amp:2.2'.
	seriesCopy := original copy.
	self
		assert: original class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:3.1'.
	self
		assert: original size
		equals: 4
		description: 'testCopyCanBeChanged_amp:3.2'.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:3.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyCanBeChanged_amp:3.2'.
	tmp_5F7Ex8WIa41 := seriesCopy at: #b put: 100.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:4.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyCanBeChanged_amp:4.2'.
	self
		assert: tmp_5F7Ex8WIa41 class
		equals: SmallInteger
		description: 'testCopyCanBeChanged_amp:4.1'.
	self
		assert: tmp_5F7Ex8WIa41
		equals: 100
		description: 'testCopyCanBeChanged_amp:4.2'.
	tmp_EibMtnJtKq2 := seriesCopy at: #e put: 200.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:5.1'.
	self
		assert: seriesCopy size
		equals: 5
		description: 'testCopyCanBeChanged_amp:5.2'.
	self
		assert: tmp_EibMtnJtKq2 class
		equals: SmallInteger
		description: 'testCopyCanBeChanged_amp:5.1'.
	self
		assert: tmp_EibMtnJtKq2
		equals: 200
		description: 'testCopyCanBeChanged_amp:5.2'.
	tmp_xdGuq2yowU3 := seriesCopy removeAt: #a.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:6.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyCanBeChanged_amp:6.2'.
	self
		assert: tmp_xdGuq2yowU3 class
		equals: SmallInteger
		description: 'testCopyCanBeChanged_amp:6.1'.
	self
		assert: tmp_xdGuq2yowU3
		equals: 10
		description: 'testCopyCanBeChanged_amp:6.2'.
	seriesCopy name: #Y.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyCanBeChanged_amp:7.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyCanBeChanged_amp:7.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCopyChangeDoesNotAffectOriginal_amp [
	<madeBySmallAmp>
	| original seriesCopy expectedOriginalAfterChange tmp_N2yM6U5AOQ1 tmp_EoOW5XFRGq2 tmp_MrmCgRTDEE3 |
	original := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	self
		assert: original class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:1.1'.
	self
		assert: original size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:1.2'.
	expectedOriginalAfterChange := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	self
		assert: expectedOriginalAfterChange class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:2.1'.
	self
		assert: expectedOriginalAfterChange size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:2.2'.
	seriesCopy := original copy.
	self
		assert: original class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:3.1'.
	self
		assert: original size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:3.2'.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:3.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:3.2'.
	tmp_N2yM6U5AOQ1 := seriesCopy at: #b put: 100.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:4.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:4.2'.
	self
		assert: tmp_N2yM6U5AOQ1 class
		equals: SmallInteger
		description: 'testCopyChangeDoesNotAffectOriginal_amp:4.1'.
	self
		assert: tmp_N2yM6U5AOQ1
		equals: 100
		description: 'testCopyChangeDoesNotAffectOriginal_amp:4.2'.
	tmp_EoOW5XFRGq2 := seriesCopy at: #e put: 200.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:5.1'.
	self
		assert: seriesCopy size
		equals: 5
		description: 'testCopyChangeDoesNotAffectOriginal_amp:5.2'.
	self
		assert: tmp_EoOW5XFRGq2 class
		equals: SmallInteger
		description: 'testCopyChangeDoesNotAffectOriginal_amp:5.1'.
	self
		assert: tmp_EoOW5XFRGq2
		equals: 200
		description: 'testCopyChangeDoesNotAffectOriginal_amp:5.2'.
	tmp_MrmCgRTDEE3 := seriesCopy removeAt: #a.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:6.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:6.2'.
	self
		assert: tmp_MrmCgRTDEE3 class
		equals: SmallInteger
		description: 'testCopyChangeDoesNotAffectOriginal_amp:6.1'.
	self
		assert: tmp_MrmCgRTDEE3
		equals: 10
		description: 'testCopyChangeDoesNotAffectOriginal_amp:6.2'.
	seriesCopy name: #Y.
	self
		assert: seriesCopy class
		equals: DataSeries
		description: 'testCopyChangeDoesNotAffectOriginal_amp:7.1'.
	self
		assert: seriesCopy size
		equals: 4
		description: 'testCopyChangeDoesNotAffectOriginal_amp:7.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateDataSeriesAsDataSeries_amp [
	<madeBySmallAmp>
	| dataSeries |
	dataSeries := #(a b c) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateDataSeriesWithKeysValuesName_amp [
	<madeBySmallAmp>
	| values keys name dataSeries |
	values := #(a b c).
	keys := #(x y z).
	name := 'Some data'.
	dataSeries := DataSeries withKeys: keys values: values name: name.
	self
		assert: dataSeries class
		equals: DataSeries
		description: 'testCreateDataSeriesWithKeysValuesName_amp:4.1'.
	self
		assert: dataSeries size
		equals: 3
		description: 'testCreateDataSeriesWithKeysValuesName_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateDataSeriesWithKeysValues_amp [
	<madeBySmallAmp>
	| values keys dataSeries |
	values := #(a b c).
	keys := #(x y z).
	dataSeries := DataSeries withKeys: keys values: values.
	self
		assert: dataSeries class
		equals: DataSeries
		description: 'testCreateDataSeriesWithKeysValues_amp:3.1'.
	self
		assert: dataSeries size
		equals: 3
		description: 'testCreateDataSeriesWithKeysValues_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateDataSeriesWithValuesName_amp [
	<madeBySmallAmp>
	| values name dataSeries |
	values := #(a b c).
	name := 'Some data'.
	dataSeries := DataSeries withValues: values name: name.
	self
		assert: dataSeries class
		equals: DataSeries
		description: 'testCreateDataSeriesWithValuesName_amp:3.1'.
	self
		assert: dataSeries size
		equals: 3
		description: 'testCreateDataSeriesWithValuesName_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateDataSeriesWithValues_amp [
	<madeBySmallAmp>
	| values dataSeries |
	values := #(a b c).
	dataSeries := DataSeries withValues: values.
	self
		assert: dataSeries class
		equals: DataSeries
		description: 'testCreateDataSeriesWithValues_amp:2.1'.
	self
		assert: dataSeries size
		equals: 3
		description: 'testCreateDataSeriesWithValues_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testCreateEmptyDataSeries_amp [
	<madeBySmallAmp>
	| dataSeries |
	dataSeries := DataSeries new.
	self
		assert: dataSeries class
		equals: DataSeries
		description: 'testCreateEmptyDataSeries_amp:1.1'.
	self
		assert: dataSeries size
		equals: 0
		description: 'testCreateEmptyDataSeries_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testDetectIfNone_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series detect: [ :x | x > 100 ] ifNone: [ 'not found' ].
	self
		assert: series class
		equals: DataSeries
		description: 'testDetectIfNone_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testDetectIfNone_amp:2.2'.
	self
		assert: actual class
		equals: ByteString
		description: 'testDetectIfNone_amp:2.1'.
	self
		assert: actual
		equals: 'not found'
		description: 'testDetectIfNone_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testDetectNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 7.
	actual := series detect: [ :x | x > 5 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testDetect_amp:2.1'.
	self assert: series size equals: 11 description: 'testDetect_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testDetect_amp:2.1'.
	self assert: actual equals: 7 description: 'testDetect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testDo_amp [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series do: [ :each | sum := sum + each ].
	self
		assert: series class
		equals: DataSeries
		description: 'testDo_amp:2.1'.
	self assert: series size equals: 11 description: 'testDo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testEighth_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testEquality_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testEquality_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testEquality_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testEquality_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testEquality_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testFifth_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testFirst_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testFourth_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testGroupByAggregateUsingAsSizeMismatch_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries withValues: #(1 10 2 1) name: #salary.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsSizeMismatch_amp:1.1'.
	self
		assert: firstSeries size
		equals: 4
		description: 'testGroupByAggregateUsingAsSizeMismatch_amp:1.2'.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsSizeMismatch_amp:2.1'.
	self
		assert: secondSeries size
		equals: 5
		description: 'testGroupByAggregateUsingAsSizeMismatch_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testGroupByAggregateUsingAs_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries expected actual |
	firstSeries := DataSeries withValues: #(1 10 2 1 5) name: #salary.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAs_amp:1.1'.
	self
		assert: firstSeries size
		equals: 5
		description: 'testGroupByAggregateUsingAs_amp:1.2'.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAs_amp:2.1'.
	self
		assert: secondSeries size
		equals: 5
		description: 'testGroupByAggregateUsingAs_amp:2.2'.
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(15 4)
		name: #totalSalary.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAs_amp:3.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsingAs_amp:3.2'.
	actual := firstSeries
		groupBy: secondSeries
		aggregateUsing: #sum
		as: #totalSalary.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAs_amp:4.1'.
	self
		assert: firstSeries size
		equals: 5
		description: 'testGroupByAggregateUsingAs_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAs_amp:4.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsingAs_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testGroupByAggregateUsingSizeMismatch_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries withValues: #(1 10 2 1 5 100) name: #salary.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingSizeMismatch_amp:1.1'.
	self
		assert: firstSeries size
		equals: 6
		description: 'testGroupByAggregateUsingSizeMismatch_amp:1.2'.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsingSizeMismatch_amp:2.1'.
	self
		assert: secondSeries size
		equals: 5
		description: 'testGroupByAggregateUsingSizeMismatch_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testGroupByAggregateUsing_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries expected actual |
	firstSeries := DataSeries withValues: #(1 10 2 1 5) name: #salary.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsing_amp:1.1'.
	self
		assert: firstSeries size
		equals: 5
		description: 'testGroupByAggregateUsing_amp:1.2'.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsing_amp:2.1'.
	self
		assert: secondSeries size
		equals: 5
		description: 'testGroupByAggregateUsing_amp:2.2'.
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(15 4)
		name: #salary.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsing_amp:3.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsing_amp:3.2'.
	actual := firstSeries groupBy: secondSeries aggregateUsing: #sum.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testGroupByAggregateUsing_amp:4.1'.
	self
		assert: firstSeries size
		equals: 5
		description: 'testGroupByAggregateUsing_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsing_amp:4.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsing_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testHeadN_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b)
		values: #(3 7)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testHeadN_amp:1.1'.
	self assert: expected size equals: 2 description: 'testHeadN_amp:1.2'.
	actual := series head: 2.
	self
		assert: series class
		equals: DataSeries
		description: 'testHeadN_amp:2.1'.
	self assert: series size equals: 11 description: 'testHeadN_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testHeadN_amp:2.1'.
	self assert: actual size equals: 2 description: 'testHeadN_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testHead_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c d e)
		values: #(3 7 6 20 8)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testHead_amp:1.1'.
	self assert: expected size equals: 5 description: 'testHead_amp:1.2'.
	actual := series head.
	self
		assert: series class
		equals: DataSeries
		description: 'testHead_amp:2.1'.
	self assert: series size equals: 11 description: 'testHead_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testHead_amp:2.1'.
	self assert: actual size equals: 5 description: 'testHead_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testInequalityDifferentKeys_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testInequalityDifferentKeys_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testInequalityDifferentKeys_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testInequalityDifferentKeys_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testInequalityDifferentKeys_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testInequalityDifferentNames_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testInequalityDifferentNames_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testInequalityDifferentNames_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'B'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testInequalityDifferentNames_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testInequalityDifferentNames_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testInequalityDifferentValues_amp [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self
		assert: firstSeries class
		equals: DataSeries
		description: 'testInequalityDifferentValues_amp:1.1'.
	self
		assert: firstSeries size
		equals: 3
		description: 'testInequalityDifferentValues_amp:1.2'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.2 'a')
		name: 'A'.
	self
		assert: secondSeries class
		equals: DataSeries
		description: 'testInequalityDifferentValues_amp:2.1'.
	self
		assert: secondSeries size
		equals: 3
		description: 'testInequalityDifferentValues_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testInequality_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 0.1 'a') asDataSeries.
	b := #(2 0.2 'b') asDataSeries.
	a name: 'A'.
	self
		assert: a class
		equals: DataSeries
		description: 'testInequality_amp:3.1'.
	self assert: a size equals: 3 description: 'testInequality_amp:3.2'.
	b name: 'B'.
	self
		assert: b class
		equals: DataSeries
		description: 'testInequality_amp:4.1'.
	self assert: b size equals: 3 description: 'testInequality_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testInjectInto_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 115.
	actual := series inject: 0 into: [ :sum :x | sum + x ].
	self
		assert: series class
		equals: DataSeries
		description: 'testInjectInto_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testInjectInto_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testInjectInto_amp:2.1'.
	self assert: actual equals: 115 description: 'testInjectInto_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testLast_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathAbs_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . -2 . 3 . -4} asDataSeries.
	b := {1 . 2 . 3 . 4} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathCos_amp [
	<madeBySmallAmp>
	| a b pi |
	pi := Float pi.
	self
		assert: pi class
		equals: SmallFloat64
		description: 'testMathCos_amp:1.1'.
	self
		assert: pi
		equals: 3.141592653589793
		description: 'testMathCos_amp:1.2'.
	a := {0.
	pi.
	(pi / 2).
	(pi / 4).
	(pi / 3)} asDataSeries.
	b := {1.0.
	-1.0.
	0.0.
	(1 / 2 sqrt).
	0.5} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathExp_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {2.71828 . 7.38906 . 20.08554 . 54.59815} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathLn_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0 . 0.69315 . 1.09861 . 1.38629} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathLog2_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0 . 1 . 1.58496 . 2} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathLog_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0.0 . 0.30103 . 0.47712 . 0.60205} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathPowerScalar_amp [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(1 4 9) asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathSin_amp [
	<madeBySmallAmp>
	| a b pi |
	pi := Float pi.
	self
		assert: pi class
		equals: SmallFloat64
		description: 'testMathSin_amp:1.1'.
	self
		assert: pi
		equals: 3.141592653589793
		description: 'testMathSin_amp:1.2'.
	a := {0.
	pi.
	(pi / 2).
	(pi / 4).
	(pi / 6)} asDataSeries.
	b := {0.0.
	0.0.
	1.0.
	(1 / 2 sqrt).
	0.5} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathSqrt_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {1 . 1.41421 . 1.73205 . 2} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testMathTan_amp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {1.55741 . -2.18504 . -0.14255 . 1.15782} asDataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testNinth_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c e f g)
		values: #(3 7 6 8 9 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testReject_amp:1.1'.
	self
		assert: expected size
		equals: 6
		description: 'testReject_amp:1.2'.
	actual := series reject: [ :x | x >= 10 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testReject_amp:2.1'.
	self assert: series size equals: 11 description: 'testReject_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testReject_amp:2.1'.
	self assert: actual size equals: 6 description: 'testReject_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testRemoveAtIndex_amp [
	<madeBySmallAmp>
	| expected tmp_z8MblLr5GP1 |
	expected := DataSeries
		withKeys: (keyArray copyWithout: #c)
		values: #(3 7 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testRemoveAtIndex_amp:1.1'.
	self
		assert: expected size
		equals: 10
		description: 'testRemoveAtIndex_amp:1.2'.
	tmp_z8MblLr5GP1 := series removeAtIndex: 3.
	self
		assert: series class
		equals: DataSeries
		description: 'testRemoveAtIndex_amp:2.1'.
	self
		assert: series size
		equals: 10
		description: 'testRemoveAtIndex_amp:2.2'.
	self
		assert: tmp_z8MblLr5GP1 class
		equals: SmallInteger
		description: 'testRemoveAtIndex_amp:2.1'.
	self
		assert: tmp_z8MblLr5GP1
		equals: 6
		description: 'testRemoveAtIndex_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testRemoveAt_amp [
	<madeBySmallAmp>
	| expected tmp_WIlRqi3gy71 |
	expected := DataSeries
		withKeys: (keyArray copyWithout: #c)
		values: #(3 7 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testRemoveAt_amp:1.1'.
	self
		assert: expected size
		equals: 10
		description: 'testRemoveAt_amp:1.2'.
	tmp_WIlRqi3gy71 := series removeAt: #c.
	self
		assert: series class
		equals: DataSeries
		description: 'testRemoveAt_amp:2.1'.
	self
		assert: series size
		equals: 10
		description: 'testRemoveAt_amp:2.2'.
	self
		assert: tmp_WIlRqi3gy71 class
		equals: SmallInteger
		description: 'testRemoveAt_amp:2.1'.
	self
		assert: tmp_WIlRqi3gy71
		equals: 6
		description: 'testRemoveAt_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSecond_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSelect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c e f g)
		values: #(3 7 6 8 9 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSelect_amp:1.1'.
	self
		assert: expected size
		equals: 6
		description: 'testSelect_amp:1.2'.
	actual := series select: [ :x | x < 10 ].
	self
		assert: series class
		equals: DataSeries
		description: 'testSelect_amp:2.1'.
	self assert: series size equals: 11 description: 'testSelect_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testSelect_amp:2.1'.
	self assert: actual size equals: 6 description: 'testSelect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSeventh_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSixth_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortBlock_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(k j i h d g f e c b a)
		values: #(16 13 15 10 20 8 9 8 6 7 3)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortBlock_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortBlock_amp:1.2'.
	series sort: [ :a :b | a asString size > b asString size ].
	self
		assert: series class
		equals: DataSeries
		description: 'testSortBlock_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortDescending_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(d k i j h f g e b c a)
		values: #(20 16 15 13 10 9 8 8 7 6 3)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortDescending_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortDescending_amp:1.2'.
	series sortDescending.
	self
		assert: series class
		equals: DataSeries
		description: 'testSortDescending_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortDescending_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSort_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(a c b e g f h j i k d)
		values: #(3 6 7 8 8 9 10 13 15 16 20)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSort_amp:1.1'.
	self assert: expected size equals: 11 description: 'testSort_amp:1.2'.
	series sort.
	self
		assert: series class
		equals: DataSeries
		description: 'testSort_amp:2.1'.
	self assert: series size equals: 11 description: 'testSort_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortedBlockDoesNotChangeTheReceiver_amp [
	<madeBySmallAmp>
	| expected tmp_GO7MxFFVdi1 |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:1.2'.
	tmp_GO7MxFFVdi1 := series
		sorted: [ :a :b | a asString size > b asString size ].
	self
		assert: series class
		equals: DataSeries
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:2.2'.
	self
		assert: tmp_GO7MxFFVdi1 class
		equals: DataSeries
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: tmp_GO7MxFFVdi1 size
		equals: 11
		description: 'testSortedBlockDoesNotChangeTheReceiver_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortedBlock_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(k j i h d g f e c b a)
		values: #(16 13 15 10 20 8 9 8 6 7 3)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortedBlock_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortedBlock_amp:1.2'.
	actual := series
		sorted: [ :a :b | a asString size > b asString size ].
	self
		assert: series class
		equals: DataSeries
		description: 'testSortedBlock_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortedBlock_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testSortedBlock_amp:2.1'.
	self
		assert: actual size
		equals: 11
		description: 'testSortedBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortedDescendingDoesNotChangeTheReceiver_amp [
	<madeBySmallAmp>
	| expected tmp_JhBayxCgFl1 |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:1.2'.
	tmp_JhBayxCgFl1 := series sortedDescending.
	self
		assert: series class
		equals: DataSeries
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:2.2'.
	self
		assert: tmp_JhBayxCgFl1 class
		equals: DataSeries
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: tmp_JhBayxCgFl1 size
		equals: 11
		description: 'testSortedDescendingDoesNotChangeTheReceiver_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortedDescending_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(d k i j h f g e b c a)
		values: #(20 16 15 13 10 9 8 8 7 6 3)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortedDescending_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortedDescending_amp:1.2'.
	actual := series sortedDescending.
	self
		assert: series class
		equals: DataSeries
		description: 'testSortedDescending_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortedDescending_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testSortedDescending_amp:2.1'.
	self
		assert: actual size
		equals: 11
		description: 'testSortedDescending_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSortedDoesNotChangeTheReceiver_amp [
	<madeBySmallAmp>
	| expected tmp_oFewrGccDq1 |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSortedDoesNotChangeTheReceiver_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSortedDoesNotChangeTheReceiver_amp:1.2'.
	tmp_oFewrGccDq1 := series sorted.
	self
		assert: series class
		equals: DataSeries
		description: 'testSortedDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testSortedDoesNotChangeTheReceiver_amp:2.2'.
	self
		assert: tmp_oFewrGccDq1 class
		equals: DataSeries
		description: 'testSortedDoesNotChangeTheReceiver_amp:2.1'.
	self
		assert: tmp_oFewrGccDq1 size
		equals: 11
		description: 'testSortedDoesNotChangeTheReceiver_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testSorted_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c b e g f h j i k d)
		values: #(3 6 7 8 8 9 10 13 15 16 20)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testSorted_amp:1.1'.
	self
		assert: expected size
		equals: 11
		description: 'testSorted_amp:1.2'.
	actual := series sorted.
	self
		assert: series class
		equals: DataSeries
		description: 'testSorted_amp:2.1'.
	self assert: series size equals: 11 description: 'testSorted_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testSorted_amp:2.1'.
	self assert: actual size equals: 11 description: 'testSorted_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsAverage_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsFirstQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsFourthQuartileEqualsMax_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsFourthQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsInterquartileRange_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsMax_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsMedian_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsMin_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsMode_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsQuantileDoesNotModifyTheSeries_amp [
	<madeBySmallAmp>
	| copy tmp_DsvU0FCbK01 |
	copy := series copy.
	self
		assert: series class
		equals: DataSeries
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:1.2'.
	self
		assert: copy class
		equals: DataSeries
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:1.1'.
	self
		assert: copy size
		equals: 11
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:1.2'.
	tmp_DsvU0FCbK01 := series quantile: 5.
	self
		assert: series class
		equals: DataSeries
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:2.2'.
	self
		assert: tmp_DsvU0FCbK01 class
		equals: SmallInteger
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:2.1'.
	self
		assert: tmp_DsvU0FCbK01
		equals: 3
		description: 'testStatsQuantileDoesNotModifyTheSeries_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsQuantile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsRange_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsSecondQuartileEqualsMedian_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsSecondQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsStdev_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsSummary_amp [
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
	self
		assert: expected class
		equals: DataSeries
		description: 'testStatsSummary_amp:1.1'.
	self
		assert: expected size
		equals: 6
		description: 'testStatsSummary_amp:1.2'.
	actual := series summary.
	self
		assert: series class
		equals: DataSeries
		description: 'testStatsSummary_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testStatsSummary_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testStatsSummary_amp:2.1'.
	self
		assert: actual size
		equals: 6
		description: 'testStatsSummary_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsThirdQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsVariance_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsZerothQuartileEqualsMin_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testStatsZerothQuartile_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testTailN_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(j k)
		values: #(13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testTailN_amp:1.1'.
	self assert: expected size equals: 2 description: 'testTailN_amp:1.2'.
	actual := series tail: 2.
	self
		assert: series class
		equals: DataSeries
		description: 'testTailN_amp:2.1'.
	self assert: series size equals: 11 description: 'testTailN_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testTailN_amp:2.1'.
	self assert: actual size equals: 2 description: 'testTailN_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testTail_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(g h i j k)
		values: #(8 10 15 13 16)
		name: series name.
	self
		assert: expected class
		equals: DataSeries
		description: 'testTail_amp:1.1'.
	self assert: expected size equals: 5 description: 'testTail_amp:1.2'.
	actual := series tail.
	self
		assert: series class
		equals: DataSeries
		description: 'testTail_amp:2.1'.
	self assert: series size equals: 11 description: 'testTail_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testTail_amp:2.1'.
	self assert: actual size equals: 5 description: 'testTail_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testThird_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexCollect_amp [
	<madeBySmallAmp>
	| actual expected |
	actual := series withIndexCollect: [ :each :i | each / 10 + i ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexCollect_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexCollect_amp:1.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithIndexCollect_amp:1.1'.
	self
		assert: actual size
		equals: 11
		description: 'testWithIndexCollect_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values:
			{(13 / 10).
			(27 / 10).
			(18 / 5).
			6.
			(29 / 5).
			(69 / 10).
			(39 / 5).
			9.
			(21 / 2).
			(113 / 10).
			(63 / 5)}
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithIndexCollect_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testWithIndexCollect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexDetectIfNone_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withIndexDetect: [ :x :i | i > 100 ]
		ifNone: [ 'not found' ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexDetectIfNone_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexDetectIfNone_amp:2.2'.
	self
		assert: actual class
		equals: ByteString
		description: 'testWithIndexDetectIfNone_amp:2.1'.
	self
		assert: actual
		equals: 'not found'
		description: 'testWithIndexDetectIfNone_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexDetectNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withIndexDetect: [ :x :i | x > 5 and: i odd ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexDetect_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexDetect_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testWithIndexDetect_amp:2.1'.
	self
		assert: actual
		equals: 6
		description: 'testWithIndexDetect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexDo_amp [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series withIndexDo: [ :each :i | sum := sum + (each / i) ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexDo_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexDo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c e g)
		values: #(3 6 8 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithIndexReject_amp:1.1'.
	self
		assert: expected size
		equals: 4
		description: 'testWithIndexReject_amp:1.2'.
	actual := series withIndexReject: [ :x :i | x >= 10 or: i even ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexReject_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexReject_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithIndexReject_amp:2.1'.
	self
		assert: actual size
		equals: 4
		description: 'testWithIndexReject_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithIndexSelect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c e g)
		values: #(3 6 8 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithIndexSelect_amp:1.1'.
	self
		assert: expected size
		equals: 4
		description: 'testWithIndexSelect_amp:1.2'.
	actual := series withIndexSelect: [ :x :i | x < 10 and: i odd ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithIndexSelect_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithIndexSelect_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithIndexSelect_amp:2.1'.
	self
		assert: actual size
		equals: 4
		description: 'testWithIndexSelect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyCollect_amp [
	<madeBySmallAmp>
	| actual expected |
	actual := series
		withKeyCollect: [ :each :key | each / 10 + (keyArray indexOf: key) ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeyCollect_amp:1.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeyCollect_amp:1.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithKeyCollect_amp:1.1'.
	self
		assert: actual size
		equals: 11
		description: 'testWithKeyCollect_amp:1.2'.
	expected := DataSeries
		withKeys: keyArray
		values:
			{(13 / 10).
			(27 / 10).
			(18 / 5).
			6.
			(29 / 5).
			(69 / 10).
			(39 / 5).
			9.
			(21 / 2).
			(113 / 10).
			(63 / 5)}
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithKeyCollect_amp:2.1'.
	self
		assert: expected size
		equals: 11
		description: 'testWithKeyCollect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyDetectIfNone_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withKeyDetect: [ :x :k | x > 5 and: k = #NoSuchKey ]
		ifNone: [ 'not found' ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeyDetectIfNone_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeyDetectIfNone_amp:2.2'.
	self
		assert: actual class
		equals: ByteString
		description: 'testWithKeyDetectIfNone_amp:2.1'.
	self
		assert: actual
		equals: 'not found'
		description: 'testWithKeyDetectIfNone_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyDetectNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withKeyDetect: [ :x :k | x > 5 and: k = #c ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeyDetect_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeyDetect_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testWithKeyDetect_amp:2.1'.
	self
		assert: actual
		equals: 6
		description: 'testWithKeyDetect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyDo_amp [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series
		withKeyDo: [ :each :key | sum := sum + (each / (keyArray indexOf: key)) ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeyDo_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeyDo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeyReject_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c g)
		values: #(3 6 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithKeyReject_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testWithKeyReject_amp:1.2'.
	actual := series
		withKeyReject: [ :x :k | x >= 10 or: (#(a c g) includes: k) not ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeyReject_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeyReject_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithKeyReject_amp:2.1'.
	self
		assert: actual size
		equals: 3
		description: 'testWithKeyReject_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataSeriesTestAmpTest >> testWithKeySelect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c g)
		values: #(3 6 8)
		name: 'ExampleSeries'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testWithKeySelect_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testWithKeySelect_amp:1.2'.
	actual := series
		withKeySelect: [ :x :k | x < 10 and: (#(a c g) includes: k) ].
	self
		assert: series class
		equals: DataSeries
		description: 'testWithKeySelect_amp:2.1'.
	self
		assert: series size
		equals: 11
		description: 'testWithKeySelect_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testWithKeySelect_amp:2.1'.
	self
		assert: actual size
		equals: 3
		description: 'testWithKeySelect_amp:2.2'
]
