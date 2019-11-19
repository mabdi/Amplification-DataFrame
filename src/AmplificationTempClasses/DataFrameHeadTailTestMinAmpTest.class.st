Class {
	#name : #DataFrameHeadTailTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df',
		'series'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestMinAmpTest >> setUp [

	df := DataFrame withRows: #(
		(5.1 3.5 1.4 0.2 setosa)
		(4.9 3 1.4 0.2 setosa)
		(4.7 3.2 1.3 0.2 setosa)
		(7 3.2 4.7 1.4 versicolor)
		(6.4 3.2 4.5 1.5 versicolor)
		(6.9 3.1 4.9 1.5 versicolor)
		(6.3 3.3 6 2.5 virginica)
		(5.8 2.7 5.1 1.9 virginica)
		(7.1 3 5.9 2.1 virginica)).
		
	df columnNames: #(sepalLength sepalWidth petalLength petalWidth species).
	series := df column: #sepalLength.
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestMinAmpTest >> testDataFrameHeadN_1 [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(5.1 3.5 1.4 0.2 setosa) #(4.9 4 1.4 0.2 setosa) #(4.7 3.2 1.3 0.2 setosa)).
	expected columnNames: df columnNames.
	self should: [ expected rowNames: (1 to: 4) ] raise: SizeMismatch.
	actual := df head: 4.
	self assert: df class equals: DataFrame.
	self assert: df size equals: 9.
	self assert: actual class equals: DataFrame.
	self assert: actual size equals: 4
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestMinAmpTest >> testDataFrameHead_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(5.1 3.5 1.4 0.2 setosa) #(4.9 3 1.4 0.2 setosa) #(4.7 3.2 1.3 0.2 setosa) #(7 3.2 4.7 1.4 versicolor) #(6.4 3.2 4.5 1.5 versicolor)).
	expected columnNames: df columnNames.
	expected rowNames: (1 to: df defaultHeadTailSize).
	actual := df head.
	self assert: df size equals: 9.
	self assert: actual size equals: 5
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestMinAmpTest >> testDataFrameTailN_amp [
	<madeBySmallAmp>
	| actual expected rows |
	expected := DataFrame
		withRows:
			#(#(6.3 3.3 6 2.5 virginica) #(5.8 2.7 5.1 1.9 virginica) #(7.1 3 5.9 2.1 virginica)).
	expected columnNames: df columnNames.
	rows := df numberOfRows.
	expected rowNames: (rows - 3 + 1 to: rows).
	actual := df tail: 3.
	self assert: df size equals: 9.
	self assert: actual size equals: 3
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestMinAmpTest >> testDataFrameTail_amp [
	<madeBySmallAmp>
	| actual expected rows |
	expected := DataFrame
		withRows:
			#(#(6.4 3.2 4.5 1.5 versicolor) #(6.9 3.1 4.9 1.5 versicolor) #(6.3 3.3 6 2.5 virginica) #(5.8 2.7 5.1 1.9 virginica) #(7.1 3 5.9 2.1 virginica)).
	expected columnNames: df columnNames.
	rows := df numberOfRows.
	expected rowNames: (rows - df defaultHeadTailSize + 1 to: rows).
	actual := df tail.
	self assert: df size equals: 9.
	self assert: actual size equals: 5
]
