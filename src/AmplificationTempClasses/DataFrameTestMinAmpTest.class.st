Class {
	#name : #DataFrameTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> setUp [

	df := DataFrame withRows: #(
		(Barcelona 1.609 true)
   		(Dubai 2.789 true)
   		(London 8.788 false)).
		
	df rowNames: #(A B C).
	df columnNames: #(City Population BeenThere).
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testAtAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self assert: expected class equals: DataFrame.
	df at: 2 at: 2 transform: [ :value | value floor ]
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testAt_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries withValues: #('Dubai' 2.789 true).
	expected name: #B.
	expected keys: df columnNames.
	actual := df at: 2.
	self assert: df class equals: DataFrame.
	self assert: actual class equals: DataSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCollect_amp [
	<madeBySmallAmp>
	| expectedDf expectedResult actualResult |
	expectedDf := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	expectedDf rowNames: #(A B C).
	expectedDf columnNames: #(City Population BeenThere).
	expectedResult := DataFrame
		withRows: #(#('BARCELONA' 1) #('DUBAI' 2) #('LONDON' 8)).
	expectedResult rowNames: #(A B C).
	expectedResult columnNames: #(City Population).
	actualResult := df
		collect: [ :row | 
			row at: #City put: (row at: #City) asUppercase.
			row at: #Population put: (row at: #Population) asInteger.
			row removeAt: #BeenThere.
			row ].
	self assert: df size equals: 3.
	self assert: actualResult size equals: 3
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testColumnsAt_amp [
	<madeBySmallAmp>
	| columnNumbers actualDataFrame expectedDataFrame |
	columnNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	expectedDataFrame rowNames: df rowNames.
	expectedDataFrame
		columnNames: (columnNumbers collect: [ :i | df columnNames at: i ]).
	actualDataFrame := df columnsAt: columnNumbers.
	self assert: df class equals: DataFrame.
	self assert: actualDataFrame class equals: DataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateDataFrameWithColumnsColumnNames_amp [
	<madeBySmallAmp>
	| columns columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withColumns: columns
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateDataFrameWithColumnsRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| columns rowNames columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withColumns: columns
		rowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withColumns: columns
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateDataFrameWithColumnsRowNames_amp [
	<madeBySmallAmp>
	| columns rowNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns rowNames: rowNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withColumns: columns
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateDataFrameWithRowsColumnNames_amp [
	<madeBySmallAmp>
	| rows columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withRows: rows columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withRows: rows
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateDataFrameWithRowsRowNames_amp [
	<madeBySmallAmp>
	| rows rowNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRows: rows rowNames: rowNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withRows: rows
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateEmptyDataFrameWithColumnNames_amp [
	<madeBySmallAmp>
	| columnNames dataFrame |
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame withColumnNames: columnNames.
	self assert: dataFrame class equals: DataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testCreateEmptyDataFrameWithRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame |
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame
		withRowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testIndexOfRowNamedIfAbsentNotFound_amp [
	<madeBySmallAmp>
	| exceptionBlockEvaluated tmp_0rZSnjgeBD1 |
	exceptionBlockEvaluated := false.
	tmp_0rZSnjgeBD1 := df
		indexOfRowNamed: #NoSuchRow
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: df class equals: DataFrame.
	self assert: tmp_0rZSnjgeBD1 class equals: True
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testIndexOfRowNamed_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfRowNamed: #B.
	self assert: df class equals: DataFrame.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testInjectInto_amp [
	<madeBySmallAmp>
	| numericDataFrame actual expected |
	numericDataFrame := DataFrame
		withRows: #(#(4.5 86 24) #(2.3 60 14) #(1.2 56 16) #(-1.0 12 18))
		rowNames: #(A B C D)
		columnNames: #(temperature humidity wind).
	expected := DataSeries
		withKeys: #(temperature humidity wind)
		values: #(7.0 214 72)
		name: '(no name)'.
	actual := numericDataFrame
		inject: 0
		into: [ :sum :each | sum + each ].
	self assert: numericDataFrame class equals: DataFrame.
	self assert: actual class equals: DataSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testPrintOn_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'a DataFrame (3@3)'.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents.
	self assert: actual equals: 'a DataFrame (3@3)'
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testReject_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(B C)
		columnNames: df columnNames.
	actual := df reject: [ :row | (row at: #Population) < 2 ].
	self assert: df size equals: 3.
	self assert: actual size equals: 2
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testRowsAt_amp [
	<madeBySmallAmp>
	| rowNumbers actualDataFrame expectedDataFrame |
	rowNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expectedDataFrame
		rowNames: (rowNumbers collect: [ :i | df rowNames at: i ]).
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rowsAt: rowNumbers.
	self assert: df size equals: 3.
	self assert: actualDataFrame size equals: 2
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testRowsFromTo_amp [
	<madeBySmallAmp>
	| actualDataFrame expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false)).
	expectedDataFrame rowNames: #(B C).
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rowsFrom: 2 to: 3.
	self assert: df size equals: 3.
	self assert: actualDataFrame size equals: 2
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testRows_amp [
	<madeBySmallAmp>
	| rowNames actualDataFrame expectedDataFrame |
	rowNames := #(A C).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expectedDataFrame rowNames: rowNames.
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rows: rowNames.
	self assert: df size equals: 3.
	self assert: actualDataFrame size equals: 2
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAmpTest >> testWithIndexReject_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false))
		rowNames: #(A C)
		columnNames: df columnNames.
	actual := df
		withIndexReject: [ :row :index | (row at: #Population) > 2 and: [ index % 2 = 0 ] ].
	self assert: df size equals: 3.
	self assert: actual size equals: 2
]
