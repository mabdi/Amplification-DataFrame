Class {
	#name : #DataSeriesTestMinAddAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'series',
		'keyArray'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> setUp [
	keyArray := #(a b c d e f g h i j k).
	
	series := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddArrayToSeries [
	<madeBySmallAmp>
	| series array actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	array := #(3 4 5).
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := series + array.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddArrayToSeries_amp [
	<madeBySmallAmp>
	| series array actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	self assert: series class equals: DataSeries.
	array := #(3 4 5).
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := series + array
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddScalarToSeries [
	<madeBySmallAmp>
	| series scalar actual expected |
	series := DataSeries withKeys: #(a b c) values: #(1 2 3) name: #X.
	scalar := 10.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(11 12 13)
		name: #X.
	actual := series + scalar.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddSeriesToArray [
	<madeBySmallAmp>
	| array series actual expected |
	array := #(1 2 3).
	series := DataSeries withKeys: #(a b c) values: #(3 4 5) name: #X.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := array + series.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddSeriesToScalar [
	<madeBySmallAmp>
	| scalar series actual expected |
	scalar := 10.
	series := DataSeries withKeys: #(a b c) values: #(3 4 5) name: #X.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(13 14 15)
		name: #X.
	actual := scalar + series.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddSeriesToSeriesDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self should: [ firstSeries + secondSeries ] raise: Error
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddSeriesToSeriesSameKeysAndName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := firstSeries + secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsAddSeriesToSeriesSameKeysDifferentName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	expected := DataSeries withKeys: #(a b c) values: #(4 6 8) name: #X.
	actual := firstSeries + secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideArrayBySeries [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := {2 . 2 . 1} asDataSeries.
	self assert: array / a equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesByArray [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := {(1 / 2).
	(1 / 2).
	1} asDataSeries.
	self assert: a / array equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesByScalar [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(0.5 1 1.5) asDataSeries.
	self assert: a / 2 equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesBySeries [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := {2 . 2 . 1} asDataSeries.
	self assert: a / b equals: c
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesBySeriesDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self should: [ firstSeries / secondSeries ] raise: Error
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesBySeriesSameKeysAndName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	expected := DataSeries
		withKeys: #(a b c)
		values:
			{(1 / 3).
			(1 / 2).
			(3 / 5)}
		name: #X.
	actual := firstSeries / secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsDivideSeriesBySeriesSameKeysDifferentName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	expected := DataSeries
		withKeys: #(a b c)
		values:
			{(1 / 3).
			(1 / 2).
			(3 / 5)}
		name: #X.
	actual := firstSeries / secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplyArrayBySeries [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(2 8 9) asDataSeries.
	self assert: array * a equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplyScalarBySeries [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(2 4 6) asDataSeries.
	self assert: 2 * a equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesByArray [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(2 8 9) asDataSeries.
	self assert: a * array equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesByScalar [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(2 4 6) asDataSeries.
	self assert: a * 2 equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesBySeries [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := #(2 8 9) asDataSeries.
	self assert: a * b equals: c
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesBySeriesDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self should: [ firstSeries * secondSeries ] raise: Error
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesBySeriesSameKeysAndName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	expected := DataSeries withKeys: #(a b c) values: #(3 8 15) name: #X.
	actual := firstSeries * secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsMultiplySeriesBySeriesSameKeysDifferentName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	expected := DataSeries withKeys: #(a b c) values: #(3 8 15) name: #X.
	actual := firstSeries * secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractArrayFromSeries [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(-1 -2 0) asDataSeries.
	self assert: a - array equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractScalarFromSeries [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(-1 0 1) asDataSeries.
	self assert: a - 2 equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromArray [
	<madeBySmallAmp>
	| array a b |
	array := #(2 4 3).
	a := #(1 2 3) asDataSeries.
	b := #(1 2 0) asDataSeries.
	self assert: array - a equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromScalar [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(1 0 -1) asDataSeries.
	self assert: 2 - a equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromSeries [
	<madeBySmallAmp>
	| a b c |
	a := #(2 4 3) asDataSeries.
	b := #(1 2 3) asDataSeries.
	c := #(1 2 0) asDataSeries.
	self assert: a - b equals: c
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromSeriesDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	self should: [ firstSeries - secondSeries ] raise: Error
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromSeriesSameKeysAndName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #X.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(-2 -2 -2)
		name: #X.
	actual := firstSeries - secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testArithmeticsSubtractSeriesFromSeriesSameKeysDifferentName [
	<madeBySmallAmp>
	| firstSeries secondSeries actual expected |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 2 3)
		name: #X.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(3 4 5)
		name: #Y.
	expected := DataSeries
		withKeys: #(a b c)
		values: #(-2 -2 -2)
		name: #X.
	actual := firstSeries - secondSeries.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAsDictionary [
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAt [
	<madeBySmallAmp>
	self assert: (series at: #b) equals: 7
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtIndex [
	<madeBySmallAmp>
	self assert: (series atIndex: 2) equals: 7
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtIndexPut [
	<madeBySmallAmp>
	| expected |
	series atIndex: 6 put: -2.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 -2 8 10 15 13 16)
		name: series name.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtIndexPut_amp [
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
DataSeriesTestMinAddAmpTest >> testAtIndexTransform [
	<madeBySmallAmp>
	| expected |
	series atIndex: 6 transform: [ :x | x + 1 ].
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 10 8 10 15 13 16)
		name: series name.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtPut [
	<madeBySmallAmp>
	| expected |
	series at: #f put: -2.
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 -2 8 10 15 13 16)
		name: series name.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtPutNewElement [
	<madeBySmallAmp>
	| expected |
	series at: #X put: -2.
	expected := DataSeries
		withKeys: (keyArray copyWith: #X)
		values: #(3 7 6 20 8 9 8 10 15 13 16 -2)
		name: series name.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtTransform [
	<madeBySmallAmp>
	| expected |
	series at: #f transform: [ :x | x + 1 ].
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 10 8 10 15 13 16)
		name: series name.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtTransformIfAbsent [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	series
		at: #NoSuchKey
		transform: [ :x | x + 1 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	expected := DataSeries
		withKeys: keyArray
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	self assert: series equals: expected.
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testAtTransformIfAbsent_amp [
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
DataSeriesTestMinAddAmpTest >> testCategoricalCrossTabulateWith [
	<madeBySmallAmp>
	| series1 series2 expected |
	series1 := #(A B C A A B C A B B) asDataSeries.
	series2 := #(1 2 1 2 1 1 2 1 2 2) asDataSeries.
	expected := DataFrame withRows: #(#(3 1) #(1 3) #(1 1)).
	expected rowNames: #(A B C).
	expected columnNames: #(1 2).
	self assert: (series1 crossTabulateWith: series2) equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCategoricalUniqueValues [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withKeys: #(a b c d e) values: #(z y y z x).
	expected := #(x y z).
	actual := aSeries uniqueValues.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCategoricalUniqueValues_amp [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withKeys: #(a b c d e) values: #(z y y z x).
	expected := #(x y z).
	actual := aSeries uniqueValues.
	self assert: aSeries class equals: DataSeries.
	self assert: actual class equals: Array
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCategoricalValueCounts [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: #(8 20 16 15 13 10 9 7 6 3)
		values: #(2 1 1 1 1 1 1 1 1 1)
		name: series name.
	actual := series valueCounts.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCategoricalValueCounts_amp [
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
DataSeriesTestMinAddAmpTest >> testCategoricalValueFrequencies [
	<madeBySmallAmp>
	| aSeries expected actual |
	aSeries := DataSeries withValues: #(A B C A A B C A B B) name: #X.
	expected := DataSeries
		withKeys: #(B A C)
		values:
			{(2 / 5).
			(2 / 5).
			(1 / 5)}
		name: #X.
	actual := aSeries valueFrequencies.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCategoricalValueFrequencies_amp [
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
DataSeriesTestMinAddAmpTest >> testCloseTo [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.10000001 2)
		name: 'A'.
	self assert: firstSeries closeTo: secondSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCloseToDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 0.10000001 2)
		name: 'A'.
	self deny: (firstSeries closeTo: secondSeries)
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCloseToDifferentNames [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.10000001 2)
		name: 'B'.
	self deny: (firstSeries closeTo: secondSeries)
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCloseToDifferentValues [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 2)
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 3.10000001 2)
		name: 'A'.
	self deny: (firstSeries closeTo: secondSeries)
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCollect [
	<madeBySmallAmp>
	| actual expected |
	actual := series collect: [ :each | each / 10 ].
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCopyCanBeChanged [
	<madeBySmallAmp>
	| original seriesCopy expectedCopyAfterChange |
	original := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	expectedCopyAfterChange := DataSeries
		withKeys: #(b c d e)
		values: #(100 20 40 200)
		name: #Y.
	seriesCopy := original copy.
	seriesCopy at: #b put: 100.
	seriesCopy at: #e put: 200.
	seriesCopy removeAt: #a.
	seriesCopy name: #Y.
	self assert: seriesCopy equals: expectedCopyAfterChange
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCopyCanBeChanged_amp [
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
DataSeriesTestMinAddAmpTest >> testCopyChangeDoesNotAffectOriginal [
	<madeBySmallAmp>
	| original seriesCopy expectedOriginalAfterChange |
	original := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	expectedOriginalAfterChange := DataSeries
		withKeys: #(a b c d)
		values: #(10 30 20 40)
		name: #X.
	seriesCopy := original copy.
	seriesCopy at: #b put: 100.
	seriesCopy at: #e put: 200.
	seriesCopy removeAt: #a.
	seriesCopy name: #Y.
	self assert: original equals: expectedOriginalAfterChange
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesAsDataSeries [
	<madeBySmallAmp>
	| dataSeries |
	dataSeries := #(a b c) asDataSeries.
	self assert: dataSeries size equals: 3.
	self assert: dataSeries asArray equals: #(a b c).
	self assert: dataSeries keys equals: #(1 2 3).
	self assert: dataSeries name equals: '(no name)'
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesWithKeysValues [
	<madeBySmallAmp>
	| values keys dataSeries |
	values := #(a b c).
	keys := #(x y z).
	dataSeries := DataSeries withKeys: keys values: values.
	self assert: dataSeries size equals: 3.
	self assert: dataSeries asArray equals: values.
	self assert: dataSeries keys equals: keys.
	self assert: dataSeries name equals: '(no name)'
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesWithKeysValuesName [
	<madeBySmallAmp>
	| values keys name dataSeries |
	values := #(a b c).
	keys := #(x y z).
	name := 'Some data'.
	dataSeries := DataSeries withKeys: keys values: values name: name.
	self assert: dataSeries size equals: 3.
	self assert: dataSeries asArray equals: values.
	self assert: dataSeries keys equals: keys.
	self assert: dataSeries name equals: name
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesWithValues [
	<madeBySmallAmp>
	| values dataSeries |
	values := #(a b c).
	dataSeries := DataSeries withValues: values.
	self assert: dataSeries size equals: 3.
	self assert: dataSeries asArray equals: values.
	self assert: dataSeries keys equals: #(1 2 3).
	self assert: dataSeries name equals: '(no name)'
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesWithValuesName [
	<madeBySmallAmp>
	| values name dataSeries |
	values := #(a b c).
	name := 'Some data'.
	dataSeries := DataSeries withValues: values name: name.
	self assert: dataSeries size equals: 3.
	self assert: dataSeries asArray equals: values.
	self assert: dataSeries keys equals: #(1 2 3).
	self assert: dataSeries name equals: name
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateDataSeriesWithValues_amp [
	<madeBySmallAmp>
	| values dataSeries |
	values := #(a b c).
	dataSeries := DataSeries withValues: values.
	self assert: dataSeries class equals: DataSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testCreateEmptyDataSeries [
	<madeBySmallAmp>
	| dataSeries |
	dataSeries := DataSeries new.
	self assert: dataSeries size equals: 0.
	self assert: dataSeries asArray equals: #().
	self assert: dataSeries keys equals: #().
	self assert: dataSeries name equals: '(no name)'
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testDetect [
	<madeBySmallAmp>
	| expected actual |
	expected := 7.
	actual := series detect: [ :x | x > 5 ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testDetectIfNone [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series detect: [ :x | x > 100 ] ifNone: [ 'not found' ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testDetectNotFound [
	<madeBySmallAmp>
	self should: [ series detect: [ :x | x > 100 ] ] raise: NotFound
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testDo [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series do: [ :each | sum := sum + each ].
	self assert: sum equals: 115
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testEighth [
	<madeBySmallAmp>
	self assert: series eighth equals: 10
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testEquality [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	self assert: firstSeries equals: secondSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testFifth [
	<madeBySmallAmp>
	self assert: series fifth equals: 8
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testFirst [
	<madeBySmallAmp>
	self assert: series first equals: 3
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testFourth [
	<madeBySmallAmp>
	self assert: series fourth equals: 20
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testGroupByAggregateUsing [
	<madeBySmallAmp>
	| firstSeries secondSeries expected actual |
	firstSeries := DataSeries withValues: #(1 10 2 1 5) name: #salary.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(15 4)
		name: #salary.
	actual := firstSeries groupBy: secondSeries aggregateUsing: #sum.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testGroupByAggregateUsingAs [
	<madeBySmallAmp>
	| firstSeries secondSeries expected actual |
	firstSeries := DataSeries withValues: #(1 10 2 1 5) name: #salary.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(15 4)
		name: #totalSalary.
	actual := firstSeries
		groupBy: secondSeries
		aggregateUsing: #sum
		as: #totalSalary.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testGroupByAggregateUsingAsSizeMismatch [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries withValues: #(1 10 2 1) name: #salary.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		should: [ firstSeries
				groupBy: secondSeries
				aggregateUsing: #sum
				as: #totalSalary ]
		raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testGroupByAggregateUsingSizeMismatch [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries withValues: #(1 10 2 1 5 100) name: #salary.
	secondSeries := DataSeries
		withValues: #(Male Female Male Male Female)
		name: #sex.
	self
		should: [ firstSeries groupBy: secondSeries aggregateUsing: #sum ]
		raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testHead [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c d e)
		values: #(3 7 6 20 8)
		name: series name.
	actual := series head.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testHeadN [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b)
		values: #(3 7)
		name: series name.
	actual := series head: 2.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testHeadN_amp [
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
DataSeriesTestMinAddAmpTest >> testHead_amp [
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
DataSeriesTestMinAddAmpTest >> testInequality [
	<madeBySmallAmp>
	| a b |
	a := #(1 0.1 'a') asDataSeries.
	b := #(2 0.2 'b') asDataSeries.
	a name: 'A'.
	b name: 'B'.
	self assert: a ~= b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testInequalityDifferentKeys [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(x y z)
		values: #(1 0.1 'a')
		name: 'A'.
	self assert: firstSeries ~= secondSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testInequalityDifferentNames [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'B'.
	self assert: firstSeries ~= secondSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testInequalityDifferentValues [
	<madeBySmallAmp>
	| firstSeries secondSeries |
	firstSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.1 'a')
		name: 'A'.
	secondSeries := DataSeries
		withKeys: #(a b c)
		values: #(1 0.2 'a')
		name: 'A'.
	self assert: firstSeries ~= secondSeries
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testInjectInto [
	<madeBySmallAmp>
	| expected actual |
	expected := 115.
	actual := series inject: 0 into: [ :sum :x | sum + x ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testLast [
	<madeBySmallAmp>
	self assert: series last equals: 16
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathAbs [
	<madeBySmallAmp>
	| a b |
	a := {1 . -2 . 3 . -4} asDataSeries.
	b := {1 . 2 . 3 . 4} asDataSeries.
	self assert: a abs closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathCos [
	<madeBySmallAmp>
	| a b pi |
	pi := Float pi.
	a := {0.
	pi.
	(pi / 2).
	(pi / 4).
	(pi / 3)} asDataSeries.
	b := {1.0.
	-1.0.
	0.0.
	(1 / 2 sqrt).
	0.5} asDataSeries.
	self assert: a cos closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathExp [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {2.71828 . 7.38906 . 20.08554 . 54.59815} asDataSeries.
	self assert: a exp closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathLn [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0 . 0.69315 . 1.09861 . 1.38629} asDataSeries.
	self assert: a ln closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathLog [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0.0 . 0.30103 . 0.47712 . 0.60205} asDataSeries.
	self assert: a log closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathLog2 [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {0 . 1 . 1.58496 . 2} asDataSeries.
	self assert: (a log: 2) closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathPowerScalar [
	<madeBySmallAmp>
	| a b |
	a := #(1 2 3) asDataSeries.
	b := #(1 4 9) asDataSeries.
	self assert: a ** 2 equals: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathSin [
	<madeBySmallAmp>
	| a b pi |
	pi := Float pi.
	a := {0.
	pi.
	(pi / 2).
	(pi / 4).
	(pi / 6)} asDataSeries.
	b := {0.0.
	0.0.
	1.0.
	(1 / 2 sqrt).
	0.5} asDataSeries.
	self assert: a sin closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathSqrt [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {1 . 1.41421 . 1.73205 . 2} asDataSeries.
	self assert: a sqrt closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testMathTan [
	<madeBySmallAmp>
	| a b |
	a := {1 . 2 . 3 . 4} asDataSeries.
	b := {1.55741 . -2.18504 . -0.14255 . 1.15782} asDataSeries.
	self assert: a tan closeTo: b
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testNinth [
	<madeBySmallAmp>
	self assert: series ninth equals: 15
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testReject [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c e f g)
		values: #(3 7 6 8 9 8)
		name: 'ExampleSeries'.
	actual := series reject: [ :x | x >= 10 ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testReject_amp [
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
DataSeriesTestMinAddAmpTest >> testRemoveAt [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: (keyArray copyWithout: #c)
		values: #(3 7 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
	series removeAt: #c.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testRemoveAtIndex [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: (keyArray copyWithout: #c)
		values: #(3 7 20 8 9 8 10 15 13 16)
		name: 'ExampleSeries'.
	series removeAtIndex: 3.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testRemoveAtIndex_amp [
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
DataSeriesTestMinAddAmpTest >> testSecond [
	<madeBySmallAmp>
	self assert: series second equals: 7
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSelect [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a b c e f g)
		values: #(3 7 6 8 9 8)
		name: 'ExampleSeries'.
	actual := series select: [ :x | x < 10 ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSeventh [
	<madeBySmallAmp>
	self assert: series seventh equals: 8
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSixth [
	<madeBySmallAmp>
	self assert: series sixth equals: 9
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSort [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(a c b e g f h j i k d)
		values: #(3 6 7 8 8 9 10 13 15 16 20)
		name: series name.
	series sort.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortBlock [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(k j i h d g f e c b a)
		values: #(16 13 15 10 20 8 9 8 6 7 3)
		name: series name.
	series sort: [ :a :b | a asString size > b asString size ].
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortDescending [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(d k i j h f g e b c a)
		values: #(20 16 15 13 10 9 8 8 7 6 3)
		name: series name.
	series sortDescending.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSorted [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c b e g f h j i k d)
		values: #(3 6 7 8 8 9 10 13 15 16 20)
		name: series name.
	actual := series sorted.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortedBlock [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(k j i h d g f e c b a)
		values: #(16 13 15 10 20 8 9 8 6 7 3)
		name: series name.
	actual := series
		sorted: [ :a :b | a asString size > b asString size ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortedBlockDoesNotChangeTheReceiver [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	series sorted: [ :a :b | a asString size > b asString size ].
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortedDescending [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(d k i j h f g e b c a)
		values: #(20 16 15 13 10 9 8 8 7 6 3)
		name: series name.
	actual := series sortedDescending.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortedDescendingDoesNotChangeTheReceiver [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	series sortedDescending.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testSortedDoesNotChangeTheReceiver [
	<madeBySmallAmp>
	| expected |
	expected := DataSeries
		withKeys: #(a b c d e f g h i j k)
		values: #(3 7 6 20 8 9 8 10 15 13 16)
		name: series name.
	series sorted.
	self assert: series equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsAverage [
	<madeBySmallAmp>
	self assert: series average equals: 115 / 11
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsFirstQuartile [
	<madeBySmallAmp>
	self assert: series firstQuartile equals: 7
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsFourthQuartile [
	<madeBySmallAmp>
	self assert: series fourthQuartile equals: 20
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsFourthQuartileEqualsMax [
	<madeBySmallAmp>
	self assert: series fourthQuartile equals: series max
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsInterquartileRange [
	<madeBySmallAmp>
	self assert: series interquartileRange equals: 8
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsMax [
	<madeBySmallAmp>
	self assert: series max equals: 20
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsMedian [
	<madeBySmallAmp>
	self assert: series median equals: 9
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsMin [
	<madeBySmallAmp>
	self assert: series min equals: 3
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsMode [
	<madeBySmallAmp>
	self assert: series mode equals: 8
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsQuantile [
	<madeBySmallAmp>
	self assert: (series quantile: 0) equals: 3.
	self assert: (series quantile: 10) equals: 6.
	self assert: (series quantile: 25) equals: 7.
	self assert: (series quantile: 50) equals: 9.
	self assert: (series quantile: 75) equals: 15.
	self assert: (series quantile: 100) equals: 20
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsQuantileDoesNotModifyTheSeries [
	<madeBySmallAmp>
	| copy |
	copy := series copy.
	series quantile: 5.
	self assert: series equals: copy
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsQuantileDoesNotModifyTheSeries_amp [
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
DataSeriesTestMinAddAmpTest >> testStatsQuartile [
	<madeBySmallAmp>
	self assert: (series quartile: 0) equals: 3.
	self assert: (series quartile: 1) equals: 7.
	self assert: (series quartile: 2) equals: 9.
	self assert: (series quartile: 3) equals: 15.
	self assert: (series quartile: 4) equals: 20
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsRange [
	<madeBySmallAmp>
	self assert: series range equals: 17
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsSecondQuartile [
	<madeBySmallAmp>
	self assert: series secondQuartile equals: 9
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsSecondQuartileEqualsMedian [
	<madeBySmallAmp>
	self assert: series secondQuartile equals: series median
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsStdev [
	<madeBySmallAmp>
	self assert: series stdev closeTo: 5.00727
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsSummary [
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsSummary_amp [
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
DataSeriesTestMinAddAmpTest >> testStatsThirdQuartile [
	<madeBySmallAmp>
	self assert: series thirdQuartile equals: 15
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsVariance [
	<madeBySmallAmp>
	self assert: series variance closeTo: 25.07273
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsZerothQuartile [
	<madeBySmallAmp>
	self assert: series zerothQuartile equals: 3
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testStatsZerothQuartileEqualsMin [
	<madeBySmallAmp>
	self assert: series zerothQuartile equals: series min
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testTail [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(g h i j k)
		values: #(8 10 15 13 16)
		name: series name.
	actual := series tail.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testTailN [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(j k)
		values: #(13 16)
		name: series name.
	actual := series tail: 2.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testTailN_amp [
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
DataSeriesTestMinAddAmpTest >> testTail_amp [
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
DataSeriesTestMinAddAmpTest >> testThird [
	<madeBySmallAmp>
	self assert: series third equals: 6
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexCollect [
	<madeBySmallAmp>
	| actual expected |
	actual := series withIndexCollect: [ :each :i | each / 10 + i ].
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexDetect [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withIndexDetect: [ :x :i | x > 5 and: i odd ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexDetectIfNone [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withIndexDetect: [ :x :i | i > 100 ]
		ifNone: [ 'not found' ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexDetectIfNone_amp [
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
DataSeriesTestMinAddAmpTest >> testWithIndexDetectNotFound [
	<madeBySmallAmp>
	self
		should: [ series withIndexDetect: [ :x :i | i > 100 ] ]
		raise: NotFound
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withIndexDetect: [ :x :i | x > 5 and: i odd ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexDo [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series withIndexDo: [ :each :i | sum := sum + (each / i) ].
	self assert: sum equals: 108173 / 4620
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexReject [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c e g)
		values: #(3 6 8 8)
		name: 'ExampleSeries'.
	actual := series withIndexReject: [ :x :i | x >= 10 or: i even ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithIndexReject_amp [
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
DataSeriesTestMinAddAmpTest >> testWithIndexSelect [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c e g)
		values: #(3 6 8 8)
		name: 'ExampleSeries'.
	actual := series withIndexSelect: [ :x :i | x < 10 and: i odd ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyCollect [
	<madeBySmallAmp>
	| actual expected |
	actual := series
		withKeyCollect: [ :each :key | each / 10 + (keyArray indexOf: key) ].
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyDetect [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withKeyDetect: [ :x :k | x > 5 and: k = #c ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyDetectIfNone [
	<madeBySmallAmp>
	| expected actual |
	expected := 'not found'.
	actual := series
		withKeyDetect: [ :x :k | x > 5 and: k = #NoSuchKey ]
		ifNone: [ 'not found' ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyDetectIfNone_amp [
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
DataSeriesTestMinAddAmpTest >> testWithKeyDetectNotFound [
	<madeBySmallAmp>
	self
		should: [ series withKeyDetect: [ :x :k | x > 5 and: k = #NoSuchKey ] ]
		raise: NotFound
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyDetect_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 6.
	actual := series withKeyDetect: [ :x :k | x > 5 and: k = #c ].
	self assert: series class equals: DataSeries.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyDo [
	<madeBySmallAmp>
	| sum |
	sum := 0.
	series
		withKeyDo: [ :each :key | sum := sum + (each / (keyArray indexOf: key)) ].
	self assert: sum equals: 108173 / 4620
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyReject [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c g)
		values: #(3 6 8)
		name: 'ExampleSeries'.
	actual := series
		withKeyReject: [ :x :k | x >= 10 or: (#(a c g) includes: k) not ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeyReject_amp [
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

{ #category : #'as yet unclassified' }
DataSeriesTestMinAddAmpTest >> testWithKeySelect [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(a c g)
		values: #(3 6 8)
		name: 'ExampleSeries'.
	actual := series
		withKeySelect: [ :x :k | x < 10 and: (#(a c g) includes: k) ].
	self assert: actual equals: expected
]
