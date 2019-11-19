Class {
	#name : #DataFrameTestAmpTest,
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
DataFrameTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> setUp [

	df := DataFrame withRows: #(
		(Barcelona 1.609 true)
   		(Dubai 2.789 true)
   		(London 8.788 false)).
		
	df rowNames: #(A B C).
	df columnNames: #(City Population BeenThere).
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumnAtPosition_amp [
	<madeBySmallAmp>
	| column expected |
	column := DataSeries withValues: #(2015 2010 2017) name: #Year.
	self
		assert: column class
		equals: DataSeries
		description: 'testAddColumnAtPosition_amp:1.1'.
	self
		assert: column size
		equals: 3
		description: 'testAddColumnAtPosition_amp:1.2'.
	df addColumn: column atPosition: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddColumnAtPosition_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testAddColumnAtPosition_amp:2.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 2015 true) #(Dubai 2.789 2010 true) #(London 8.788 2017 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnAtPosition_amp:3.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnAtPosition_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnAtPosition_amp:4.2'.
	expected columnNames: #(City Population Year BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnAtPosition_amp:5.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnAtPosition_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumnNameMustBeDistinct_amp [
	<madeBySmallAmp>
	| series |
	series := DataSeries withValues: #(1 2 3) name: #City.
	self
		assert: series class
		equals: DataSeries
		description: 'testAddColumnNameMustBeDistinct_amp:1.1'.
	self
		assert: series size
		equals: 3
		description: 'testAddColumnNameMustBeDistinct_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumnNamedAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	df addColumn: #(2015 2010 2017) named: #Year atPosition: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddColumnNamedAtPosition_amp:1.1'.
	self
		assert: df size
		equals: 3
		description: 'testAddColumnNamedAtPosition_amp:1.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 2015 true) #(Dubai 2.789 2010 true) #(London 8.788 2017 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamedAtPosition_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamedAtPosition_amp:2.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamedAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamedAtPosition_amp:3.2'.
	expected columnNames: #(City Population Year BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamedAtPosition_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamedAtPosition_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumnNamedNameMustBeDistinct_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumnNamed_amp [
	<madeBySmallAmp>
	| expected |
	df addColumn: #(2015 2010 2017) named: #Year.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddColumnNamed_amp:1.1'.
	self
		assert: df size
		equals: 3
		description: 'testAddColumnNamed_amp:1.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true 2015) #(Dubai 2.789 true 2010) #(London 8.788 false 2017)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamed_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamed_amp:2.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamed_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamed_amp:3.2'.
	expected columnNames: #(City Population BeenThere Year).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumnNamed_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumnNamed_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddColumn_amp [
	<madeBySmallAmp>
	| column expected |
	column := DataSeries withValues: #(2015 2010 2017) name: #Year.
	self
		assert: column class
		equals: DataSeries
		description: 'testAddColumn_amp:1.1'.
	self
		assert: column size
		equals: 3
		description: 'testAddColumn_amp:1.2'.
	df addColumn: column.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddColumn_amp:2.1'.
	self assert: df size equals: 3 description: 'testAddColumn_amp:2.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true 2015) #(Dubai 2.789 true 2010) #(London 8.788 false 2017)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumn_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumn_amp:3.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumn_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumn_amp:4.2'.
	expected columnNames: #(City Population BeenThere Year).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddColumn_amp:5.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddColumn_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddEmptyColumnNamedAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 nil true) #(Dubai 2.789 nil true) #(London 8.788 nil false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamedAtPosition_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamedAtPosition_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamedAtPosition_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamedAtPosition_amp:2.2'.
	expected columnNames: #(City Population EmptyColumn BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamedAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamedAtPosition_amp:3.2'.
	df addEmptyColumnNamed: #EmptyColumn atPosition: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddEmptyColumnNamedAtPosition_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testAddEmptyColumnNamedAtPosition_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddEmptyColumnNamed_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true nil) #(Dubai 2.789 true nil) #(London 8.788 false nil)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamed_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamed_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamed_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamed_amp:2.2'.
	expected columnNames: #(City Population BeenThere EmptyColumn).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyColumnNamed_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAddEmptyColumnNamed_amp:3.2'.
	df addEmptyColumnNamed: #EmptyColumn.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddEmptyColumnNamed_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testAddEmptyColumnNamed_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddEmptyRowNamedAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(nil nil nil) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamedAtPosition_amp:1.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamedAtPosition_amp:1.2'.
	expected rowNames: #(A B X C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamedAtPosition_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamedAtPosition_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamedAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamedAtPosition_amp:3.2'.
	df addEmptyRowNamed: #X atPosition: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddEmptyRowNamedAtPosition_amp:4.1'.
	self
		assert: df size
		equals: 4
		description: 'testAddEmptyRowNamedAtPosition_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddEmptyRowNamed_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(nil nil nil)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamed_amp:1.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamed_amp:1.2'.
	expected rowNames: #(A B C X).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamed_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamed_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddEmptyRowNamed_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddEmptyRowNamed_amp:3.2'.
	df addEmptyRowNamed: #X.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddEmptyRowNamed_amp:4.1'.
	self
		assert: df size
		equals: 4
		description: 'testAddEmptyRowNamed_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowAtPosition_amp [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	self
		assert: row class
		equals: DataSeries
		description: 'testAddRowAtPosition_amp:1.1'.
	self
		assert: row size
		equals: 3
		description: 'testAddRowAtPosition_amp:1.2'.
	df addRow: row atPosition: 2.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddRowAtPosition_amp:2.1'.
	self
		assert: df size
		equals: 4
		description: 'testAddRowAtPosition_amp:2.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Paris 2.141 true) #(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowAtPosition_amp:3.2'.
	expected rowNames: #(A X B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowAtPosition_amp:4.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowAtPosition_amp:4.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowAtPosition_amp:5.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowAtPosition_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowNameMustBeDistinct_amp [
	<madeBySmallAmp>
	| series |
	series := DataSeries withValues: #(1 2 3) name: #A.
	self
		assert: series class
		equals: DataSeries
		description: 'testAddRowNameMustBeDistinct_amp:1.1'.
	self
		assert: series size
		equals: 3
		description: 'testAddRowNameMustBeDistinct_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowNamedAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	df addRow: #(Paris 2.141 true) named: #X atPosition: 2.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddRowNamedAtPosition_amp:1.1'.
	self
		assert: df size
		equals: 4
		description: 'testAddRowNamedAtPosition_amp:1.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Paris 2.141 true) #(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamedAtPosition_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamedAtPosition_amp:2.2'.
	expected rowNames: #(A X B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamedAtPosition_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamedAtPosition_amp:3.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamedAtPosition_amp:4.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamedAtPosition_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowNamedNameMustBeDistinct_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowNamed_amp [
	<madeBySmallAmp>
	| expected |
	df addRow: #(Paris 2.141 true) named: #X.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddRowNamed_amp:1.1'.
	self assert: df size equals: 4 description: 'testAddRowNamed_amp:1.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamed_amp:2.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamed_amp:2.2'.
	expected rowNames: #(A B C X).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamed_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamed_amp:3.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRowNamed_amp:4.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRowNamed_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRowSizeMismatch_amp [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addRow: #(1 2) named: #TooSmall ]
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAddRow_amp [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	self
		assert: row class
		equals: DataSeries
		description: 'testAddRow_amp:1.1'.
	self assert: row size equals: 3 description: 'testAddRow_amp:1.2'.
	df addRow: row.
	self
		assert: df class
		equals: DataFrame
		description: 'testAddRow_amp:2.1'.
	self assert: df size equals: 4 description: 'testAddRow_amp:2.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRow_amp:3.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRow_amp:3.2'.
	expected rowNames: #(A B C X).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRow_amp:4.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRow_amp:4.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAddRow_amp:5.1'.
	self
		assert: expected size
		equals: 4
		description: 'testAddRow_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAdd_amp [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	self
		assert: row class
		equals: DataSeries
		description: 'testAdd_amp:1.1'.
	self assert: row size equals: 3 description: 'testAdd_amp:1.2'.
	df add: row.
	self
		assert: df class
		equals: DataFrame
		description: 'testAdd_amp:2.1'.
	self assert: df size equals: 4 description: 'testAdd_amp:2.2'.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAdd_amp:3.1'.
	self assert: expected size equals: 4 description: 'testAdd_amp:3.2'.
	expected rowNames: #(A B C X).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAdd_amp:4.1'.
	self assert: expected size equals: 4 description: 'testAdd_amp:4.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAdd_amp:5.1'.
	self assert: expected size equals: 4 description: 'testAdd_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAsArrayOfColumns_amp [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false))
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAsArrayOfRows_amp [
	<madeBySmallAmp>
	| expected |
	expected := {(#('Barcelona' 1.609 true) asDataSeries
		name: 'A';
		keys: df columnNames;
		yourself).
	(#('Dubai' 2.789 true) asDataSeries
		name: 'B';
		keys: df columnNames;
		yourself).
	(#('London' 8.788 false) asDataSeries
		name: 'C';
		keys: df columnNames;
		yourself)}
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAtAtPut_amp [
	<madeBySmallAmp>
	| expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 1000 false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testAtAtPut_amp:1.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testAtAtPut_amp:1.2'.
	expectedDataFrame rowNames: df rowNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testAtAtPut_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testAtAtPut_amp:2.2'.
	expectedDataFrame columnNames: df columnNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testAtAtPut_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testAtAtPut_amp:3.2'.
	df at: 3 at: 2 put: 1000.
	self
		assert: df class
		equals: DataFrame
		description: 'testAtAtPut_amp:4.1'.
	self assert: df size equals: 3 description: 'testAtAtPut_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAtAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAtAtTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAtAtTransform_amp:1.2'.
	df at: 2 at: 2 transform: [ :value | value floor ].
	self
		assert: df class
		equals: DataFrame
		description: 'testAtAtTransform_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testAtAtTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAtAt_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testAtTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testAtTransform_amp:1.2'.
	df
		at: 2
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self
		assert: df class
		equals: DataFrame
		description: 'testAtTransform_amp:2.1'.
	self assert: df size equals: 3 description: 'testAtTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testAt_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries withValues: #('Dubai' 2.789 true).
	self
		assert: expected class
		equals: DataSeries
		description: 'testAt_amp:1.1'.
	self assert: expected size equals: 3 description: 'testAt_amp:1.2'.
	expected name: #B.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAt_amp:2.1'.
	self assert: expected size equals: 3 description: 'testAt_amp:2.2'.
	expected keys: df columnNames.
	self
		assert: expected class
		equals: DataSeries
		description: 'testAt_amp:3.1'.
	self assert: expected size equals: 3 description: 'testAt_amp:3.2'.
	actual := df at: 2.
	self assert: df class equals: DataFrame description: 'testAt_amp:4.1'.
	self assert: df size equals: 3 description: 'testAt_amp:4.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testAt_amp:4.1'.
	self assert: actual size equals: 3 description: 'testAt_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCollect_amp [
	<madeBySmallAmp>
	| expectedDf expectedResult actualResult |
	expectedDf := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testCollect_amp:1.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testCollect_amp:1.2'.
	expectedDf rowNames: #(A B C).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testCollect_amp:2.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testCollect_amp:2.2'.
	expectedDf columnNames: #(City Population BeenThere).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testCollect_amp:3.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testCollect_amp:3.2'.
	expectedResult := DataFrame
		withRows: #(#('BARCELONA' 1) #('DUBAI' 2) #('LONDON' 8)).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testCollect_amp:4.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testCollect_amp:4.2'.
	expectedResult rowNames: #(A B C).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testCollect_amp:5.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testCollect_amp:5.2'.
	expectedResult columnNames: #(City Population).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testCollect_amp:6.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testCollect_amp:6.2'.
	actualResult := df
		collect: [ :row | 
			row at: #City put: (row at: #City) asUppercase.
			row at: #Population put: (row at: #Population) asInteger.
			row removeAt: #BeenThere.
			row ].
	self
		assert: df class
		equals: DataFrame
		description: 'testCollect_amp:7.1'.
	self assert: df size equals: 3 description: 'testCollect_amp:7.2'.
	self
		assert: actualResult class
		equals: DataFrame
		description: 'testCollect_amp:7.1'.
	self
		assert: actualResult size
		equals: 3
		description: 'testCollect_amp:7.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnAtPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnAtPut_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnAtPut_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnAtPut_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnAtPut_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnAtPut_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnAtPut_amp:3.2'.
	actual := df.
	actual columnAt: 1 put: #('X' 'Y' 'Z').
	self
		assert: actual class
		equals: DataFrame
		description: 'testColumnAtPut_amp:5.1'.
	self
		assert: actual size
		equals: 3
		description: 'testColumnAtPut_amp:5.2'.
	actual columnAt: 3 put: #(0 1 0).
	self
		assert: actual class
		equals: DataFrame
		description: 'testColumnAtPut_amp:6.1'.
	self
		assert: actual size
		equals: 3
		description: 'testColumnAtPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnAtTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnAtTransform_amp:1.2'.
	df
		columnAt: 2
		transform: [ :column | 
			column
				at: #B put: 0;
				yourself ].
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnAtTransform_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnAtTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnAt_amp [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #(Barcelona Dubai London).
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumnAt_amp:1.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumnAt_amp:1.2'.
	expectedSeries name: #City.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumnAt_amp:2.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumnAt_amp:2.2'.
	expectedSeries keys: df rowNames.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumnAt_amp:3.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumnAt_amp:3.2'.
	actualSeries := df columnAt: 1.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnAt_amp:4.1'.
	self assert: df size equals: 3 description: 'testColumnAt_amp:4.2'.
	self
		assert: actualSeries class
		equals: DataSeries
		description: 'testColumnAt_amp:4.1'.
	self
		assert: actualSeries size
		equals: 3
		description: 'testColumnAt_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnIfAbsent_amp [
	<madeBySmallAmp>
	| exceptionBlockEvaluated tmp_fCKKBM1HLI1 |
	exceptionBlockEvaluated := false.
	tmp_fCKKBM1HLI1 := df
		column: #NoSuchColumn
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnIfAbsent_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnIfAbsent_amp:2.2'.
	self
		assert: tmp_fCKKBM1HLI1 class
		equals: True
		description: 'testColumnIfAbsent_amp:2.1'.
	self
		assert: tmp_fCKKBM1HLI1
		equals: true
		description: 'testColumnIfAbsent_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnNamesMustBeDistinct_amp [
	<madeBySmallAmp>
	| newNames |
	newNames := #(x y y)
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnNamesSizeMismatch_amp [
	<madeBySmallAmp>
	| tooManyNames notEnoughNames |
	tooManyNames := #(W X Y Z).
	notEnoughNames := #(Y Z)
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnNames_amp [
	<madeBySmallAmp>
	| newNames |
	newNames := #(X Y Z).
	df columnNames: newNames.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnNames_amp:2.1'.
	self assert: df size equals: 3 description: 'testColumnNames_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnPutIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated tmp_1uuwbTbP7j1 |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnPutIfAbsent_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnPutIfAbsent_amp:2.2'.
	tmp_1uuwbTbP7j1 := df
		column: #NoSuchColumn
		put: #(0 0 0)
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnPutIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnPutIfAbsent_amp:3.2'.
	self
		assert: tmp_1uuwbTbP7j1 class
		equals: True
		description: 'testColumnPutIfAbsent_amp:3.1'.
	self
		assert: tmp_1uuwbTbP7j1
		equals: true
		description: 'testColumnPutIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnPutNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnPut_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnPut_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnPut_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnPut_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnPut_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnPut_amp:3.2'.
	actual := df.
	actual column: #City put: #('X' 'Y' 'Z').
	self
		assert: actual class
		equals: DataFrame
		description: 'testColumnPut_amp:5.1'.
	self
		assert: actual size
		equals: 3
		description: 'testColumnPut_amp:5.2'.
	actual column: #BeenThere put: #(0 1 0).
	self
		assert: actual class
		equals: DataFrame
		description: 'testColumnPut_amp:6.1'.
	self
		assert: actual size
		equals: 3
		description: 'testColumnPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnTransformIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated tmp_qdvST5YL791 |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnTransformIfAbsent_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnTransformIfAbsent_amp:2.2'.
	tmp_qdvST5YL791 := df
		column: #NoSuchColumn
		transform: [ :column | column at: #B put: 0 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnTransformIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnTransformIfAbsent_amp:3.2'.
	self
		assert: tmp_qdvST5YL791 class
		equals: True
		description: 'testColumnTransformIfAbsent_amp:3.1'.
	self
		assert: tmp_qdvST5YL791
		equals: true
		description: 'testColumnTransformIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnTransformNotFound_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnTransformNotFound_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnTransformNotFound_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testColumnTransform_amp:1.2'.
	df
		column: #Population
		transform: [ :column | 
			column
				at: #B put: 0;
				yourself ].
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnTransform_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumn_amp [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #(Barcelona Dubai London).
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumn_amp:1.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumn_amp:1.2'.
	expectedSeries name: #City.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumn_amp:2.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumn_amp:2.2'.
	expectedSeries keys: df rowNames.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testColumn_amp:3.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testColumn_amp:3.2'.
	actualSeries := df column: #City.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumn_amp:4.1'.
	self assert: df size equals: 3 description: 'testColumn_amp:4.2'.
	self
		assert: actualSeries class
		equals: DataSeries
		description: 'testColumn_amp:4.1'.
	self
		assert: actualSeries size
		equals: 3
		description: 'testColumn_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnsAtPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newColumns expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsAtPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsAtPut_amp:3.2'.
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows: #(#(2 true 1) #(2 true 1) #(2 true 1) #(2 false 1) #(2 true 1))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnsAtPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testColumnsAtPut_amp:5.2'.
	dataFrame columnsAt: #(3 1) put: newColumns.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsAtPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsAtPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnsAt_amp [
	<madeBySmallAmp>
	| columnNumbers actualDataFrame expectedDataFrame |
	columnNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsAt_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsAt_amp:2.2'.
	expectedDataFrame rowNames: df rowNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsAt_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsAt_amp:3.2'.
	expectedDataFrame
		columnNames: (columnNumbers collect: [ :i | df columnNames at: i ]).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsAt_amp:4.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsAt_amp:4.2'.
	actualDataFrame := df columnsAt: columnNumbers.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnsAt_amp:5.1'.
	self assert: df size equals: 3 description: 'testColumnsAt_amp:5.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testColumnsAt_amp:5.1'.
	self
		assert: actualDataFrame size
		equals: 3
		description: 'testColumnsAt_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnsFromToPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newColumns expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsFromToPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsFromToPut_amp:3.2'.
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows: #(#(2.4 2 1) #(0.5 2 1) #(-1.2 2 1) #(-2.3 2 1) #(3.2 2 1))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnsFromToPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testColumnsFromToPut_amp:5.2'.
	dataFrame columnsFrom: 3 to: 2 put: newColumns.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsFromToPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsFromToPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnsFromTo_amp [
	<madeBySmallAmp>
	| actualDataFrame expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(1.609 true) #(2.789 true) #(8.788 false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsFromTo_amp:1.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsFromTo_amp:1.2'.
	expectedDataFrame rowNames: df rowNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsFromTo_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsFromTo_amp:2.2'.
	expectedDataFrame columnNames: #(Population BeenThere).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumnsFromTo_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumnsFromTo_amp:3.2'.
	actualDataFrame := df columnsFrom: 2 to: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumnsFromTo_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testColumnsFromTo_amp:4.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testColumnsFromTo_amp:4.1'.
	self
		assert: actualDataFrame size
		equals: 3
		description: 'testColumnsFromTo_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumnsPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newColumns expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsPut_amp:3.2'.
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows: #(#(2 true 1) #(2 true 1) #(2 true 1) #(2 false 1) #(2 true 1))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testColumnsPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testColumnsPut_amp:5.2'.
	dataFrame columns: #(type temperature) put: newColumns.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testColumnsPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testColumnsPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testColumns_amp [
	<madeBySmallAmp>
	| columnNames actualDataFrame expectedDataFrame |
	columnNames := #(City BeenThere).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumns_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumns_amp:2.2'.
	expectedDataFrame rowNames: df rowNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumns_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumns_amp:3.2'.
	expectedDataFrame columnNames: columnNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testColumns_amp:4.1'.
	self
		assert: expectedDataFrame size
		equals: 3
		description: 'testColumns_amp:4.2'.
	actualDataFrame := df columns: columnNames.
	self
		assert: df class
		equals: DataFrame
		description: 'testColumns_amp:5.1'.
	self assert: df size equals: 3 description: 'testColumns_amp:5.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testColumns_amp:5.1'.
	self
		assert: actualDataFrame size
		equals: 3
		description: 'testColumns_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWith3ColumnsAndNoRows_amp [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new: 0 @ 3.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWith3ColumnsAndNoRows_amp:1.1'.
	self
		assert: dataFrame size
		equals: 0
		description: 'testCreateDataFrameWith3ColumnsAndNoRows_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithColumnsColumnNames_amp [
	<madeBySmallAmp>
	| columns columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithColumnsColumnNames_amp:3.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithColumnsColumnNames_amp:3.2'.
	expectedValues := DataFrameInternal withColumns: columns.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithColumnsColumnNames_amp:4.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithColumnsColumnNames_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithColumnsRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| columns rowNames columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withColumns: columns
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithColumnsRowNamesColumnNames_amp:4.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithColumnsRowNamesColumnNames_amp:4.2'.
	expectedValues := DataFrameInternal withColumns: columns.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithColumnsRowNamesColumnNames_amp:5.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithColumnsRowNamesColumnNames_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithColumnsRowNames_amp [
	<madeBySmallAmp>
	| columns rowNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns rowNames: rowNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithColumnsRowNames_amp:3.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithColumnsRowNames_amp:3.2'.
	expectedValues := DataFrameInternal withColumns: columns.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithColumnsRowNames_amp:4.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithColumnsRowNames_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithColumns_amp [
	<madeBySmallAmp>
	| columns dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	dataFrame := DataFrame withColumns: columns.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithColumns_amp:2.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithColumns_amp:2.2'.
	expectedValues := DataFrameInternal withColumns: columns.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithColumns_amp:3.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithColumns_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| rows dataFrameInternal rowNames columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	dataFrameInternal := DataFrameInternal withRows: rows.
	self
		assert: dataFrameInternal class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:2.1'.
	self
		assert: dataFrameInternal size
		equals: 9
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:2.2'.
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withDataFrameInternal: dataFrameInternal
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:5.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:5.2'.
	expectedValues := DataFrameInternal withRows: rows.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:6.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithDataFrameInternalRowNamesColumnNames_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithRowsColumnNames_amp [
	<madeBySmallAmp>
	| rows columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withRows: rows columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithRowsColumnNames_amp:3.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithRowsColumnNames_amp:3.2'.
	expectedValues := DataFrameInternal withRows: rows.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithRowsColumnNames_amp:4.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithRowsColumnNames_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithRowsRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| rows rowNames columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withRows: rows
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithRowsRowNamesColumnNames_amp:4.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithRowsRowNamesColumnNames_amp:4.2'.
	expectedValues := DataFrameInternal withRows: rows.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithRowsRowNamesColumnNames_amp:5.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithRowsRowNamesColumnNames_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithRowsRowNames_amp [
	<madeBySmallAmp>
	| rows rowNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRows: rows rowNames: rowNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithRowsRowNames_amp:3.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithRowsRowNames_amp:3.2'.
	expectedValues := DataFrameInternal withRows: rows.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithRowsRowNames_amp:4.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithRowsRowNames_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateDataFrameWithRows_amp [
	<madeBySmallAmp>
	| rows dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	dataFrame := DataFrame withRows: rows.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateDataFrameWithRows_amp:2.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateDataFrameWithRows_amp:2.2'.
	expectedValues := DataFrameInternal withRows: rows.
	self
		assert: expectedValues class
		equals: DataFrameInternal
		description: 'testCreateDataFrameWithRows_amp:3.1'.
	self
		assert: expectedValues size
		equals: 9
		description: 'testCreateDataFrameWithRows_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateEmptyDataFrameWithColumnNames_amp [
	<madeBySmallAmp>
	| columnNames dataFrame |
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame withColumnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateEmptyDataFrameWithColumnNames_amp:2.1'.
	self
		assert: dataFrame size
		equals: 0
		description: 'testCreateEmptyDataFrameWithColumnNames_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateEmptyDataFrameWithRowNamesColumnNames_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame |
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame
		withRowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateEmptyDataFrameWithRowNamesColumnNames_amp:3.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testCreateEmptyDataFrameWithRowNamesColumnNames_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateEmptyDataFrameWithRowNames_amp [
	<madeBySmallAmp>
	| rowNames dataFrame |
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRowNames: rowNames
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCreateEmptyDataFrame_amp [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCreateEmptyDataFrame_amp:1.1'.
	self
		assert: dataFrame size
		equals: 0
		description: 'testCreateEmptyDataFrame_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testCrossTabulation_amp [
	<madeBySmallAmp>
	| dataFrame expected |
	dataFrame := DataFrame
		withRows:
			#(#(Male Young) #(Female Old) #(Female Young) #(Female Young) #(Male Old)).
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCrossTabulation_amp:1.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testCrossTabulation_amp:1.2'.
	dataFrame columnNames: #(Gender Age).
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testCrossTabulation_amp:2.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testCrossTabulation_amp:2.2'.
	expected := DataFrame withRows: #(#(1 2) #(1 1)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCrossTabulation_amp:3.1'.
	self
		assert: expected size
		equals: 2
		description: 'testCrossTabulation_amp:3.2'.
	expected rowNames: #(Female Male).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCrossTabulation_amp:4.1'.
	self
		assert: expected size
		equals: 2
		description: 'testCrossTabulation_amp:4.2'.
	expected columnNames: #(Old Young).
	self
		assert: expected class
		equals: DataFrame
		description: 'testCrossTabulation_amp:5.1'.
	self
		assert: expected size
		equals: 2
		description: 'testCrossTabulation_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDetectIfNoneNotFound_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := 'not found'.
	actual := df
		detect: [ :row | (row at: #City) = 'Paris' ]
		ifNone: [ 'not found' ].
	self
		assert: df class
		equals: DataFrame
		description: 'testDetectIfNoneNotFound_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testDetectIfNoneNotFound_amp:2.2'.
	self
		assert: actual class
		equals: ByteString
		description: 'testDetectIfNoneNotFound_amp:2.1'.
	self
		assert: actual
		equals: 'not found'
		description: 'testDetectIfNoneNotFound_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDetectIfNone_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: df columnNames
		values: #(London 8.788 false)
		name: #C.
	self
		assert: expected class
		equals: DataSeries
		description: 'testDetectIfNone_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDetectIfNone_amp:1.2'.
	actual := df
		detect: [ :row | (row at: #BeenThere) not ]
		ifNone: [ 'not found' ].
	self
		assert: df class
		equals: DataFrame
		description: 'testDetectIfNone_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testDetectIfNone_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testDetectIfNone_amp:2.1'.
	self
		assert: actual size
		equals: 3
		description: 'testDetectIfNone_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDetectNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDetect_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: df columnNames
		values: #(London 8.788 false)
		name: #C.
	self
		assert: expected class
		equals: DataSeries
		description: 'testDetect_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDetect_amp:1.2'.
	actual := df detect: [ :row | (row at: #BeenThere) not ].
	self
		assert: df class
		equals: DataFrame
		description: 'testDetect_amp:2.1'.
	self assert: df size equals: 3 description: 'testDetect_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testDetect_amp:2.1'.
	self assert: actual size equals: 3 description: 'testDetect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDoCanModifyRows_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(BARCELONA 1.609 true) #(DUBAI 2.789 true) #(LONDON 8.788 false))
		rowNames: df rowNames
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testDoCanModifyRows_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testDoCanModifyRows_amp:1.2'.
	df do: [ :row | row at: #City put: (row at: #City) asUppercase ].
	self
		assert: df class
		equals: DataFrame
		description: 'testDoCanModifyRows_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testDoCanModifyRows_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testDo_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := OrderedCollection
		with: #(Barcelona 1.609 true) asDataSeries
		with: #(Dubai 2.789 true) asDataSeries
		with: #(London 8.788 false) asDataSeries.
	self
		assert: expected class
		equals: OrderedCollection
		description: 'testDo_amp:1.1'.
	self assert: expected size equals: 3 description: 'testDo_amp:1.2'.
	expected
		doWithIndex: [ :each :i | 
			each keys: #(City Population BeenThere).
			each name: (#(A B C) at: i) ].
	self
		assert: expected class
		equals: OrderedCollection
		description: 'testDo_amp:2.1'.
	self assert: expected size equals: 3 description: 'testDo_amp:2.2'.
	actual := OrderedCollection new.
	self
		assert: actual class
		equals: OrderedCollection
		description: 'testDo_amp:3.1'.
	self assert: actual size equals: 0 description: 'testDo_amp:3.2'.
	df do: [ :each | actual add: each ].
	self assert: df class equals: DataFrame description: 'testDo_amp:4.1'.
	self assert: df size equals: 3 description: 'testDo_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testEquality_amp [
	<madeBySmallAmp>
	| df1 df2 |
	df1 := DataFrame withRows: #(#(1 2) #(3 4)).
	self
		assert: df1 class
		equals: DataFrame
		description: 'testEquality_amp:1.1'.
	self assert: df1 size equals: 2 description: 'testEquality_amp:1.2'.
	df2 := DataFrame withRows: #(#(1 2) #(3 4)).
	self
		assert: df2 class
		equals: DataFrame
		description: 'testEquality_amp:2.1'.
	self assert: df2 size equals: 2 description: 'testEquality_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfColumnNamedIfAbsentNotFound_amp [
	<madeBySmallAmp>
	| exceptionBlockEvaluated tmp_3WV78k10381 |
	exceptionBlockEvaluated := false.
	tmp_3WV78k10381 := df
		indexOfColumnNamed: #NoSuchColumn
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfColumnNamedIfAbsentNotFound_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfColumnNamedIfAbsentNotFound_amp:2.2'.
	self
		assert: tmp_3WV78k10381 class
		equals: True
		description: 'testIndexOfColumnNamedIfAbsentNotFound_amp:2.1'.
	self
		assert: tmp_3WV78k10381
		equals: true
		description: 'testIndexOfColumnNamedIfAbsentNotFound_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfColumnNamedIfAbsent_amp [
	<madeBySmallAmp>
	| expected actual exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := 2.
	actual := df
		indexOfColumnNamed: #Population
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfColumnNamedIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfColumnNamedIfAbsent_amp:3.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testIndexOfColumnNamedIfAbsent_amp:3.1'.
	self
		assert: actual
		equals: 2
		description: 'testIndexOfColumnNamedIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfColumnNamedNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfColumnNamed_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfColumnNamed: #Population.
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfColumnNamed_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfColumnNamed_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testIndexOfColumnNamed_amp:2.1'.
	self
		assert: actual
		equals: 2
		description: 'testIndexOfColumnNamed_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfRowNamedIfAbsentNotFound_amp [
	<madeBySmallAmp>
	| exceptionBlockEvaluated tmp_0rZSnjgeBD1 |
	exceptionBlockEvaluated := false.
	tmp_0rZSnjgeBD1 := df
		indexOfRowNamed: #NoSuchRow
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfRowNamedIfAbsentNotFound_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfRowNamedIfAbsentNotFound_amp:2.2'.
	self
		assert: tmp_0rZSnjgeBD1 class
		equals: True
		description: 'testIndexOfRowNamedIfAbsentNotFound_amp:2.1'.
	self
		assert: tmp_0rZSnjgeBD1
		equals: true
		description: 'testIndexOfRowNamedIfAbsentNotFound_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfRowNamedIfAbsent_amp [
	<madeBySmallAmp>
	| expected actual exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := 2.
	actual := df
		indexOfRowNamed: #B
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfRowNamedIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfRowNamedIfAbsent_amp:3.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testIndexOfRowNamedIfAbsent_amp:3.1'.
	self
		assert: actual
		equals: 2
		description: 'testIndexOfRowNamedIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfRowNamedNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testIndexOfRowNamed_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfRowNamed: #B.
	self
		assert: df class
		equals: DataFrame
		description: 'testIndexOfRowNamed_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testIndexOfRowNamed_amp:2.2'.
	self
		assert: actual class
		equals: SmallInteger
		description: 'testIndexOfRowNamed_amp:2.1'.
	self
		assert: actual
		equals: 2
		description: 'testIndexOfRowNamed_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testInequality_amp [
	<madeBySmallAmp>
	| df1 df2 df3 df4 df5 |
	"Other data frames will be compared to this one"
	df1 := DataFrame withRows: #(#(1 2) #(3 4)).
	self
		assert: df1 class
		equals: DataFrame
		description: 'testInequality_amp:1.1'.
	self assert: df1 size equals: 2 description: 'testInequality_amp:1.2'.
	df1 rowNames: #(a b).
	self
		assert: df1 class
		equals: DataFrame
		description: 'testInequality_amp:2.1'.
	self assert: df1 size equals: 2 description: 'testInequality_amp:2.2'.
	df1 columnNames: #(x y).

	"This one has different row names"
	self
		assert: df1 class
		equals: DataFrame
		description: 'testInequality_amp:3.1'.
	self assert: df1 size equals: 2 description: 'testInequality_amp:3.2'.
	df2 := DataFrame withRows: #(#(1 2) #(3 4)).
	self
		assert: df2 class
		equals: DataFrame
		description: 'testInequality_amp:4.1'.
	self assert: df2 size equals: 2 description: 'testInequality_amp:4.2'.
	df2 rowNames: #(c b).
	self
		assert: df2 class
		equals: DataFrame
		description: 'testInequality_amp:5.1'.
	self assert: df2 size equals: 2 description: 'testInequality_amp:5.2'.
	df2 columnNames: #(x y).

	"This one has different column names"
	self
		assert: df2 class
		equals: DataFrame
		description: 'testInequality_amp:6.1'.
	self assert: df2 size equals: 2 description: 'testInequality_amp:6.2'.
	df3 := DataFrame withRows: #(#(1 2) #(3 4)).
	self
		assert: df3 class
		equals: DataFrame
		description: 'testInequality_amp:7.1'.
	self assert: df3 size equals: 2 description: 'testInequality_amp:7.2'.
	df3 rowNames: #(a b).
	self
		assert: df3 class
		equals: DataFrame
		description: 'testInequality_amp:8.1'.
	self assert: df3 size equals: 2 description: 'testInequality_amp:8.2'.
	df3 columnNames: #(x z).

	"This one has different dimensions"
	self
		assert: df3 class
		equals: DataFrame
		description: 'testInequality_amp:9.1'.
	self assert: df3 size equals: 2 description: 'testInequality_amp:9.2'.
	df4 := DataFrame withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: df4 class
		equals: DataFrame
		description: 'testInequality_amp:10.1'.
	self
		assert: df4 size
		equals: 3
		description: 'testInequality_amp:10.2'.
	df4 rowNames: #(a b c).
	self
		assert: df4 class
		equals: DataFrame
		description: 'testInequality_amp:11.1'.
	self
		assert: df4 size
		equals: 3
		description: 'testInequality_amp:11.2'.
	df4 columnNames: #(x z).

	"This one has different values"
	self
		assert: df4 class
		equals: DataFrame
		description: 'testInequality_amp:12.1'.
	self
		assert: df4 size
		equals: 3
		description: 'testInequality_amp:12.2'.
	df5 := DataFrame withRows: #(#(1 2) #(3 5)).
	self
		assert: df5 class
		equals: DataFrame
		description: 'testInequality_amp:13.1'.
	self
		assert: df5 size
		equals: 2
		description: 'testInequality_amp:13.2'.
	df5 rowNames: #(a b).
	self
		assert: df5 class
		equals: DataFrame
		description: 'testInequality_amp:14.1'.
	self
		assert: df5 size
		equals: 2
		description: 'testInequality_amp:14.2'.
	df5 columnNames: #(x z).
	self
		assert: df5 class
		equals: DataFrame
		description: 'testInequality_amp:15.1'.
	self
		assert: df5 size
		equals: 2
		description: 'testInequality_amp:15.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testInjectInto_amp [
	<madeBySmallAmp>
	| numericDataFrame actual expected |
	numericDataFrame := DataFrame
		withRows: #(#(4.5 86 24) #(2.3 60 14) #(1.2 56 16) #(-1.0 12 18))
		rowNames: #(A B C D)
		columnNames: #(temperature humidity wind).
	self
		assert: numericDataFrame class
		equals: DataFrame
		description: 'testInjectInto_amp:1.1'.
	self
		assert: numericDataFrame size
		equals: 4
		description: 'testInjectInto_amp:1.2'.
	expected := DataSeries
		withKeys: #(temperature humidity wind)
		values: #(7.0 214 72)
		name: '(no name)'.
	self
		assert: expected class
		equals: DataSeries
		description: 'testInjectInto_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testInjectInto_amp:2.2'.
	actual := numericDataFrame
		inject: 0
		into: [ :sum :each | sum + each ].
	self
		assert: numericDataFrame class
		equals: DataFrame
		description: 'testInjectInto_amp:3.1'.
	self
		assert: numericDataFrame size
		equals: 4
		description: 'testInjectInto_amp:3.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testInjectInto_amp:3.1'.
	self
		assert: actual size
		equals: 3
		description: 'testInjectInto_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testPrintOn_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'a DataFrame (3@3)'.
	actual := String new writeStream.
	df printOn: actual.
	self
		assert: df class
		equals: DataFrame
		description: 'testPrintOn_amp:3.1'.
	self assert: df size equals: 3 description: 'testPrintOn_amp:3.2'.
	actual := actual contents.
	self
		assert: actual class
		equals: ByteString
		description: 'testPrintOn_amp:4.1'.
	self
		assert: actual
		equals: 'a DataFrame (3@3)'
		description: 'testPrintOn_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testReject_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(B C)
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testReject_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testReject_amp:1.2'.
	actual := df reject: [ :row | (row at: #Population) < 2 ].
	self
		assert: df class
		equals: DataFrame
		description: 'testReject_amp:2.1'.
	self assert: df size equals: 3 description: 'testReject_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testReject_amp:2.1'.
	self assert: actual size equals: 2 description: 'testReject_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveColumnAtOutOfRange_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveColumnAt_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumnAt_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumnAt_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumnAt_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumnAt_amp:2.2'.
	expected columnNames: #(City BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumnAt_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumnAt_amp:3.2'.
	df removeColumnAt: 2.
	self
		assert: df class
		equals: DataFrame
		description: 'testRemoveColumnAt_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testRemoveColumnAt_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveColumnNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveColumn_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumn_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumn_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumn_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumn_amp:2.2'.
	expected columnNames: #(City BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveColumn_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRemoveColumn_amp:3.2'.
	df removeColumn: #Population.
	self
		assert: df class
		equals: DataFrame
		description: 'testRemoveColumn_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testRemoveColumn_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveRowAtOutOfRange_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveRowAt_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRowAt_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRowAt_amp:1.2'.
	expected rowNames: #(A C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRowAt_amp:2.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRowAt_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRowAt_amp:3.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRowAt_amp:3.2'.
	df removeRowAt: 2.
	self
		assert: df class
		equals: DataFrame
		description: 'testRemoveRowAt_amp:4.1'.
	self assert: df size equals: 2 description: 'testRemoveRowAt_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveRowNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRemoveRow_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRow_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRow_amp:1.2'.
	expected rowNames: #(A C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRow_amp:2.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRow_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRemoveRow_amp:3.1'.
	self
		assert: expected size
		equals: 2
		description: 'testRemoveRow_amp:3.2'.
	df removeRow: #B.
	self
		assert: df class
		equals: DataFrame
		description: 'testRemoveRow_amp:4.1'.
	self assert: df size equals: 2 description: 'testRemoveRow_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRenameColumnToNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRenameColumnTo_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population Visited).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRenameColumnTo_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRenameColumnTo_amp:1.2'.
	df renameColumn: #BeenThere to: #Visited.
	self
		assert: df class
		equals: DataFrame
		description: 'testRenameColumnTo_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testRenameColumnTo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRenameRowToNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRenameRowTo_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A X C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRenameRowTo_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRenameRowTo_amp:1.2'.
	df renameRow: #B to: #X.
	self
		assert: df class
		equals: DataFrame
		description: 'testRenameRowTo_amp:2.1'.
	self assert: df size equals: 3 description: 'testRenameRowTo_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowAtPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(X Y Z) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowAtPut_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowAtPut_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowAtPut_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowAtPut_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowAtPut_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowAtPut_amp:3.2'.
	actual := df.
	actual rowAt: 2 put: #(X Y Z).
	self
		assert: actual class
		equals: DataFrame
		description: 'testRowAtPut_amp:5.1'.
	self
		assert: actual size
		equals: 3
		description: 'testRowAtPut_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowAtTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowAtTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowAtTransform_amp:1.2'.
	df
		rowAt: 2
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self
		assert: df class
		equals: DataFrame
		description: 'testRowAtTransform_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testRowAtTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowAt_amp [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #('Dubai' 2.789 true).
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRowAt_amp:1.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRowAt_amp:1.2'.
	expectedSeries name: #B.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRowAt_amp:2.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRowAt_amp:2.2'.
	expectedSeries keys: df columnNames.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRowAt_amp:3.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRowAt_amp:3.2'.
	actualSeries := df rowAt: 2.
	self
		assert: df class
		equals: DataFrame
		description: 'testRowAt_amp:4.1'.
	self assert: df size equals: 3 description: 'testRowAt_amp:4.2'.
	self
		assert: actualSeries class
		equals: DataSeries
		description: 'testRowAt_amp:4.1'.
	self
		assert: actualSeries size
		equals: 3
		description: 'testRowAt_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowIfAbsent_amp [
	<madeBySmallAmp>
	| exceptionBlockEvaluated tmp_eghckXxLIO1 |
	exceptionBlockEvaluated := false.
	tmp_eghckXxLIO1 := df
		row: #NoSuchRow
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testRowIfAbsent_amp:2.1'.
	self assert: df size equals: 3 description: 'testRowIfAbsent_amp:2.2'.
	self
		assert: tmp_eghckXxLIO1 class
		equals: True
		description: 'testRowIfAbsent_amp:2.1'.
	self
		assert: tmp_eghckXxLIO1
		equals: true
		description: 'testRowIfAbsent_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowNamesMustBeDistinct_amp [
	<madeBySmallAmp>
	| newNames |
	newNames := #(x y y)
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowNamesSizeMismatch_amp [
	<madeBySmallAmp>
	| tooManyNames notEnoughNames |
	tooManyNames := #(W X Y Z).
	notEnoughNames := #(Y Z)
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowNames_amp [
	<madeBySmallAmp>
	| newNames |
	newNames := #(X Y Z).
	df rowNames: newNames.
	self
		assert: df class
		equals: DataFrame
		description: 'testRowNames_amp:2.1'.
	self assert: df size equals: 3 description: 'testRowNames_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowPutIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated tmp_Ulqiy6ltwv1 |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowPutIfAbsent_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowPutIfAbsent_amp:2.2'.
	tmp_Ulqiy6ltwv1 := df
		row: #NoSuchRow
		put: #(0 0 0)
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testRowPutIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testRowPutIfAbsent_amp:3.2'.
	self
		assert: tmp_Ulqiy6ltwv1 class
		equals: True
		description: 'testRowPutIfAbsent_amp:3.1'.
	self
		assert: tmp_Ulqiy6ltwv1
		equals: true
		description: 'testRowPutIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowPutNotFound_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(X Y Z) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowPut_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowPut_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowPut_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowPut_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowPut_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowPut_amp:3.2'.
	actual := df.
	actual row: #B put: #(X Y Z).
	self
		assert: actual class
		equals: DataFrame
		description: 'testRowPut_amp:5.1'.
	self assert: actual size equals: 3 description: 'testRowPut_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowTransformIfAbsent_amp [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated tmp_aP3i0vsNu71 |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowTransformIfAbsent_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowTransformIfAbsent_amp:2.2'.
	tmp_aP3i0vsNu71 := df
		row: #NoSuchRow
		transform: [ :row | row at: #Population put: 0 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self
		assert: df class
		equals: DataFrame
		description: 'testRowTransformIfAbsent_amp:3.1'.
	self
		assert: df size
		equals: 3
		description: 'testRowTransformIfAbsent_amp:3.2'.
	self
		assert: tmp_aP3i0vsNu71 class
		equals: True
		description: 'testRowTransformIfAbsent_amp:3.1'.
	self
		assert: tmp_aP3i0vsNu71
		equals: true
		description: 'testRowTransformIfAbsent_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowTransformNotFound_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowTransformNotFound_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowTransformNotFound_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowTransform_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowTransform_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testRowTransform_amp:1.2'.
	df
		row: #B
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self
		assert: df class
		equals: DataFrame
		description: 'testRowTransform_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testRowTransform_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRow_amp [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #('Dubai' 2.789 true).
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRow_amp:1.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRow_amp:1.2'.
	expectedSeries name: #B.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRow_amp:2.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRow_amp:2.2'.
	expectedSeries keys: df columnNames.
	self
		assert: expectedSeries class
		equals: DataSeries
		description: 'testRow_amp:3.1'.
	self
		assert: expectedSeries size
		equals: 3
		description: 'testRow_amp:3.2'.
	actualSeries := df row: #B.
	self
		assert: df class
		equals: DataFrame
		description: 'testRow_amp:4.1'.
	self assert: df size equals: 3 description: 'testRow_amp:4.2'.
	self
		assert: actualSeries class
		equals: DataSeries
		description: 'testRow_amp:4.1'.
	self
		assert: actualSeries size
		equals: 3
		description: 'testRow_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowsAtPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newRows expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsAtPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsAtPut_amp:3.2'.
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows: #(#(2.4 true rain) #(3 3 3) #(1 1 1) #(-2.3 false -) #(2 2 2))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowsAtPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testRowsAtPut_amp:5.2'.
	dataFrame rowsAt: #(3 5 2) put: newRows.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsAtPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsAtPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowsAt_amp [
	<madeBySmallAmp>
	| rowNumbers actualDataFrame expectedDataFrame |
	rowNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsAt_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsAt_amp:2.2'.
	expectedDataFrame
		rowNames: (rowNumbers collect: [ :i | df rowNames at: i ]).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsAt_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsAt_amp:3.2'.
	expectedDataFrame columnNames: df columnNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsAt_amp:4.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsAt_amp:4.2'.
	actualDataFrame := df rowsAt: rowNumbers.
	self
		assert: df class
		equals: DataFrame
		description: 'testRowsAt_amp:5.1'.
	self assert: df size equals: 3 description: 'testRowsAt_amp:5.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testRowsAt_amp:5.1'.
	self
		assert: actualDataFrame size
		equals: 2
		description: 'testRowsAt_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowsFromToPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newRows expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsFromToPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsFromToPut_amp:3.2'.
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows: #(#(2.4 true rain) #(3 3 3) #(2 2 2) #(1 1 1) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowsFromToPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testRowsFromToPut_amp:5.2'.
	dataFrame rowsFrom: 4 to: 2 put: newRows.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsFromToPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsFromToPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowsFromTo_amp [
	<madeBySmallAmp>
	| actualDataFrame expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsFromTo_amp:1.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsFromTo_amp:1.2'.
	expectedDataFrame rowNames: #(B C).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsFromTo_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsFromTo_amp:2.2'.
	expectedDataFrame columnNames: df columnNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRowsFromTo_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRowsFromTo_amp:3.2'.
	actualDataFrame := df rowsFrom: 2 to: 3.
	self
		assert: df class
		equals: DataFrame
		description: 'testRowsFromTo_amp:4.1'.
	self assert: df size equals: 3 description: 'testRowsFromTo_amp:4.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testRowsFromTo_amp:4.1'.
	self
		assert: actualDataFrame size
		equals: 2
		description: 'testRowsFromTo_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRowsPut_amp [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame newRows expected |
	rowNames := #('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime.
	columnNames := #(temperature precipitation type).
	dataFrame := DataFrame
		withRows:
			#(#(2.4 true rain) #(0.5 true rain) #(-1.2 true snow) #(-2.3 false -) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsPut_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsPut_amp:3.2'.
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows: #(#(2.4 true rain) #(3 3 3) #(1 1 1) #(-2.3 false -) #(2 2 2))
		rowNames: rowNames
		columnNames: columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testRowsPut_amp:5.1'.
	self
		assert: expected size
		equals: 5
		description: 'testRowsPut_amp:5.2'.
	dataFrame
		rows:
			{'01:50' asTime.
			'02:30' asTime.
			'01:30' asTime}
		put: newRows.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testRowsPut_amp:6.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testRowsPut_amp:6.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testRows_amp [
	<madeBySmallAmp>
	| rowNames actualDataFrame expectedDataFrame |
	rowNames := #(A C).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRows_amp:2.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRows_amp:2.2'.
	expectedDataFrame rowNames: rowNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRows_amp:3.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRows_amp:3.2'.
	expectedDataFrame columnNames: df columnNames.
	self
		assert: expectedDataFrame class
		equals: DataFrame
		description: 'testRows_amp:4.1'.
	self
		assert: expectedDataFrame size
		equals: 2
		description: 'testRows_amp:4.2'.
	actualDataFrame := df rows: rowNames.
	self
		assert: df class
		equals: DataFrame
		description: 'testRows_amp:5.1'.
	self assert: df size equals: 3 description: 'testRows_amp:5.2'.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testRows_amp:5.1'.
	self
		assert: actualDataFrame size
		equals: 2
		description: 'testRows_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testSelect_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(B C)
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testSelect_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testSelect_amp:1.2'.
	actual := df select: [ :row | (row at: #Population) > 2 ].
	self
		assert: df class
		equals: DataFrame
		description: 'testSelect_amp:2.1'.
	self assert: df size equals: 3 description: 'testSelect_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testSelect_amp:2.1'.
	self assert: actual size equals: 2 description: 'testSelect_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testSortByUsing_amp [
	"Sort by second letter of city name"

	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false) #(Dubai 2.789 true)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortByUsing_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortByUsing_amp:1.2'.
	expected rowNames: #(A C B).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortByUsing_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortByUsing_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortByUsing_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortByUsing_amp:3.2'.
	actual := df
		sortBy: #City
		using: [ :name1 :name2 | name1 second <= name2 second ].
	self
		assert: df class
		equals: DataFrame
		description: 'testSortByUsing_amp:4.1'.
	self assert: df size equals: 3 description: 'testSortByUsing_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testSortBy_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortBy_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortBy_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortBy_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortBy_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortBy_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortBy_amp:3.2'.
	actual := df sortBy: #Population.
	self
		assert: df class
		equals: DataFrame
		description: 'testSortBy_amp:4.1'.
	self assert: df size equals: 3 description: 'testSortBy_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testSortDescendingBy_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(London 8.788 false) #(Dubai 2.789 true) #(Barcelona 1.609 true)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortDescendingBy_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortDescendingBy_amp:1.2'.
	expected rowNames: #(C B A).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortDescendingBy_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortDescendingBy_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testSortDescendingBy_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testSortDescendingBy_amp:3.2'.
	actual := df sortDescendingBy: #Population.
	self
		assert: df class
		equals: DataFrame
		description: 'testSortDescendingBy_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testSortDescendingBy_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testToColumnApplyElementwise_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' true) #(Dubai '2.789' true) #(London '8.788' false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnApplyElementwise_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnApplyElementwise_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnApplyElementwise_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnApplyElementwise_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnApplyElementwise_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnApplyElementwise_amp:3.2'.
	df toColumn: #Population applyElementwise: [ :each | each asString ].
	self
		assert: df class
		equals: DataFrame
		description: 'testToColumnApplyElementwise_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testToColumnApplyElementwise_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testToColumnAtApplyElementwise_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' true) #(Dubai '2.789' true) #(London '8.788' false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnAtApplyElementwise_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnAtApplyElementwise_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnAtApplyElementwise_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnAtApplyElementwise_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnAtApplyElementwise_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnAtApplyElementwise_amp:3.2'.
	df toColumnAt: 2 applyElementwise: [ :each | each asString ].
	self
		assert: df class
		equals: DataFrame
		description: 'testToColumnAtApplyElementwise_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testToColumnAtApplyElementwise_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testToColumnsApplyElementwise_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' 'true') #(Dubai '2.789' 'true') #(London '8.788' 'false')).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsApplyElementwise_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsApplyElementwise_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsApplyElementwise_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsApplyElementwise_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsApplyElementwise_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsApplyElementwise_amp:3.2'.
	df
		toColumns: #(Population BeenThere)
		applyElementwise: [ :each | each asString ].
	self
		assert: df class
		equals: DataFrame
		description: 'testToColumnsApplyElementwise_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testToColumnsApplyElementwise_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testToColumnsAtApplyElementwise_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' 'true') #(Dubai '2.789' 'true') #(London '8.788' 'false')).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsAtApplyElementwise_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsAtApplyElementwise_amp:1.2'.
	expected rowNames: #(A B C).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsAtApplyElementwise_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsAtApplyElementwise_amp:2.2'.
	expected columnNames: #(City Population BeenThere).
	self
		assert: expected class
		equals: DataFrame
		description: 'testToColumnsAtApplyElementwise_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testToColumnsAtApplyElementwise_amp:3.2'.
	df toColumnsAt: #(2 3) applyElementwise: [ :each | each asString ].
	self
		assert: df class
		equals: DataFrame
		description: 'testToColumnsAtApplyElementwise_amp:4.1'.
	self
		assert: df size
		equals: 3
		description: 'testToColumnsAtApplyElementwise_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testTransposed_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false)).
	self
		assert: expected class
		equals: DataFrame
		description: 'testTransposed_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testTransposed_amp:1.2'.
	expected rowNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testTransposed_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testTransposed_amp:2.2'.
	expected columnNames: df rowNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testTransposed_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testTransposed_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testVarSizeInstanceCreation_amp [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new: 3 @ 2.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testVarSizeInstanceCreation_amp:1.1'.
	self
		assert: dataFrame size
		equals: 3
		description: 'testVarSizeInstanceCreation_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testWithIndexCollect_amp [
	<madeBySmallAmp>
	| expectedDf expectedResult actualResult |
	expectedDf := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:1.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testWithIndexCollect_amp:1.2'.
	expectedDf rowNames: #(A B C).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:2.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testWithIndexCollect_amp:2.2'.
	expectedDf columnNames: #(City Population BeenThere).
	self
		assert: expectedDf class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:3.1'.
	self
		assert: expectedDf size
		equals: 3
		description: 'testWithIndexCollect_amp:3.2'.
	expectedResult := DataFrame
		withRows: #(#('BARCELONA' 2) #('DUBAI' 4) #('LONDON' 11)).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:4.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testWithIndexCollect_amp:4.2'.
	expectedResult rowNames: #(A B C).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:5.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testWithIndexCollect_amp:5.2'.
	expectedResult columnNames: #(City Population).
	self
		assert: expectedResult class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:6.1'.
	self
		assert: expectedResult size
		equals: 3
		description: 'testWithIndexCollect_amp:6.2'.
	actualResult := df
		withIndexCollect: [ :row :index | 
			row at: #City put: (row at: #City) asUppercase.
			row at: #Population put: (row at: #Population) asInteger + index.
			row removeAt: #BeenThere.
			row ].
	self
		assert: df class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:7.1'.
	self
		assert: df size
		equals: 3
		description: 'testWithIndexCollect_amp:7.2'.
	self
		assert: actualResult class
		equals: DataFrame
		description: 'testWithIndexCollect_amp:7.1'.
	self
		assert: actualResult size
		equals: 3
		description: 'testWithIndexCollect_amp:7.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testWithIndexDoCanModifyRows_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(Dubai 4.789 true) #(London 11.788 false))
		rowNames: df rowNames
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testWithIndexDoCanModifyRows_amp:1.1'.
	self
		assert: expected size
		equals: 3
		description: 'testWithIndexDoCanModifyRows_amp:1.2'.
	df
		withIndexDo: [ :row :index | 
			row name = 'A'
				ifFalse: [ row at: #Population put: (row at: #Population) + index ] ].
	self
		assert: df class
		equals: DataFrame
		description: 'testWithIndexDoCanModifyRows_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testWithIndexDoCanModifyRows_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testWithIndexDo_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := {(1
		->
			(DataSeries
				withKeys: df columnNames
				values: #(Barcelona 1.609 true)
				name: 'A')).
	(2
		->
			(DataSeries
				withKeys: df columnNames
				values: #(Dubai 2.789 true)
				name: 'B')).
	(3
		->
			(DataSeries
				withKeys: df columnNames
				values: #(London 8.788 false)
				name: 'C'))} asDictionary.
	actual := Dictionary new.
	self
		assert: actual class
		equals: Dictionary
		description: 'testWithIndexDo_amp:2.1'.
	self
		assert: actual size
		equals: 0
		description: 'testWithIndexDo_amp:2.2'.
	df withIndexDo: [ :each :index | actual at: index put: each ].
	self
		assert: df class
		equals: DataFrame
		description: 'testWithIndexDo_amp:3.1'.
	self assert: df size equals: 3 description: 'testWithIndexDo_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testWithIndexReject_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false))
		rowNames: #(A C)
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testWithIndexReject_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testWithIndexReject_amp:1.2'.
	actual := df
		withIndexReject: [ :row :index | (row at: #Population) > 2 and: [ index % 2 = 0 ] ].
	self
		assert: df class
		equals: DataFrame
		description: 'testWithIndexReject_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testWithIndexReject_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testWithIndexReject_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testWithIndexReject_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameTestAmpTest >> testWithIndexSelect_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true))
		rowNames: #(B)
		columnNames: df columnNames.
	self
		assert: expected class
		equals: DataFrame
		description: 'testWithIndexSelect_amp:1.1'.
	self
		assert: expected size
		equals: 1
		description: 'testWithIndexSelect_amp:1.2'.
	actual := df
		withIndexSelect: [ :row :index | (row at: #Population) > 2 and: [ index % 2 = 0 ] ].
	self
		assert: df class
		equals: DataFrame
		description: 'testWithIndexSelect_amp:2.1'.
	self
		assert: df size
		equals: 3
		description: 'testWithIndexSelect_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testWithIndexSelect_amp:2.1'.
	self
		assert: actual size
		equals: 1
		description: 'testWithIndexSelect_amp:2.2'
]
