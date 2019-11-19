Class {
	#name : #DataFrameHeadTailTestAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df',
		'series'
	],
	#classInstVars : [
		'smallamp_logs'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> setUp [

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
DataFrameHeadTailTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDataFrameHeadN_1 [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(5.1 3.5 1.4 0.2 setosa) #(4.9 4 1.4 0.2 setosa) #(4.7 3.2 1.3 0.2 setosa)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHeadN_1:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameHeadN_1:1.2'.
	expected columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHeadN_1:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameHeadN_1:2.2'.
	self
		should: [ expected rowNames: (1 to: 4) ]
		raise: SizeMismatch
		description: 'testDataFrameHeadN_1:3.1'.
	actual := df head: 4.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameHeadN_1:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameHeadN_1:4.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testDataFrameHeadN_1:4.1'.
	self
		assert: actual size
		equals: 4
		description: 'testDataFrameHeadN_1:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDataFrameHeadN_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(5.1 3.5 1.4 0.2 setosa) #(4.9 3 1.4 0.2 setosa) #(4.7 3.2 1.3 0.2 setosa)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHeadN_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameHeadN_amp:1.2'.
	expected columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHeadN_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameHeadN_amp:2.2'.
	expected rowNames: (1 to: 3).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHeadN_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameHeadN_amp:3.2'.
	actual := df head: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameHeadN_amp:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameHeadN_amp:4.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testDataFrameHeadN_amp:4.1'.
	self
		assert: actual size
		equals: 3
		description: 'testDataFrameHeadN_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDataFrameHead_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(5.1 3.5 1.4 0.2 setosa) #(4.9 3 1.4 0.2 setosa) #(4.7 3.2 1.3 0.2 setosa) #(7 3.2 4.7 1.4 versicolor) #(6.4 3.2 4.5 1.5 versicolor)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHead_amp:1.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameHead_amp:1.2'.
	expected columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHead_amp:2.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameHead_amp:2.2'.
	expected rowNames: (1 to: df defaultHeadTailSize).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameHead_amp:3.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameHead_amp:3.2'.
	actual := df head.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameHead_amp:4.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameHead_amp:4.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testDataFrameHead_amp:4.1'.
	self
		assert: actual size
		equals: 5
		description: 'testDataFrameHead_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDataFrameTailN_amp [
	<madeBySmallAmp>
	| actual expected rows |
	expected := DataFrame
		withRows:
			#(#(6.3 3.3 6 2.5 virginica) #(5.8 2.7 5.1 1.9 virginica) #(7.1 3 5.9 2.1 virginica)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameTailN_amp:1.2'.
	expected columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameTailN_amp:2.2'.
	rows := df numberOfRows.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:3.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameTailN_amp:3.2'.
	self
		assert: rows class
		equals: SmallInteger
		description: 'testDataFrameTailN_amp:3.1'.
	self assert: rows equals: 9 description: 'testDataFrameTailN_amp:3.2'.
	expected rowNames: (rows - 3 + 1 to: rows).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDataFrameTailN_amp:4.2'.
	actual := df tail: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:5.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameTailN_amp:5.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testDataFrameTailN_amp:5.1'.
	self
		assert: actual size
		equals: 3
		description: 'testDataFrameTailN_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDataFrameTail_amp [
	<madeBySmallAmp>
	| actual expected rows |
	expected := DataFrame
		withRows:
			#(#(6.4 3.2 4.5 1.5 versicolor) #(6.9 3.1 4.9 1.5 versicolor) #(6.3 3.3 6 2.5 virginica) #(5.8 2.7 5.1 1.9 virginica) #(7.1 3 5.9 2.1 virginica)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTail_amp:1.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameTail_amp:1.2'.
	expected columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTail_amp:2.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameTail_amp:2.2'.
	rows := df numberOfRows.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameTail_amp:3.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameTail_amp:3.2'.
	self
		assert: rows class
		equals: SmallInteger
		description: 'testDataFrameTail_amp:3.1'.
	self assert: rows equals: 9 description: 'testDataFrameTail_amp:3.2'.
	expected rowNames: (rows - df defaultHeadTailSize + 1 to: rows).
	self
		assert: expected class
		equals: DataFrame
		description: 'testDataFrameTail_amp:4.1'.
	self
		assert: expected size
		equals: 5
		description: 'testDataFrameTail_amp:4.2'.
	actual := df tail.
	self
		assert: df class
		equals: DataFrame
		description: 'testDataFrameTail_amp:5.1'.
	self
		assert: df size
		equals: 9
		description: 'testDataFrameTail_amp:5.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testDataFrameTail_amp:5.1'.
	self
		assert: actual size
		equals: 5
		description: 'testDataFrameTail_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameHeadTailTestAmpTest >> testDefaultHeadTailSize_amp [
	<madeBySmallAmp>
	
]
