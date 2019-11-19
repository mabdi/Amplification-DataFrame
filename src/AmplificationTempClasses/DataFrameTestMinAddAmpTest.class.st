Class {
	#name : #DataFrameTestMinAddAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> setUp [

	df := DataFrame withRows: #(
		(Barcelona 1.609 true)
   		(Dubai 2.789 true)
   		(London 8.788 false)).
		
	df rowNames: #(A B C).
	df columnNames: #(City Population BeenThere).
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAdd [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	df add: row.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	expected rowNames: #(A B C X).
	expected columnNames: #(City Population BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumn [
	<madeBySmallAmp>
	| column expected |
	column := DataSeries withValues: #(2015 2010 2017) name: #Year.
	df addColumn: column.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true 2015) #(Dubai 2.789 true 2010) #(London 8.788 false 2017)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere Year).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumnAtPosition [
	<madeBySmallAmp>
	| column expected |
	column := DataSeries withValues: #(2015 2010 2017) name: #Year.
	df addColumn: column atPosition: 3.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 2015 true) #(Dubai 2.789 2010 true) #(London 8.788 2017 false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population Year BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumnNameMustBeDistinct [
	<madeBySmallAmp>
	| series |
	series := DataSeries withValues: #(1 2 3) name: #City.
	self should: [ df addColumn: series ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumnNamed [
	<madeBySmallAmp>
	| expected |
	df addColumn: #(2015 2010 2017) named: #Year.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true 2015) #(Dubai 2.789 true 2010) #(London 8.788 false 2017)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere Year).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumnNamedAtPosition [
	<madeBySmallAmp>
	| expected |
	df addColumn: #(2015 2010 2017) named: #Year atPosition: 3.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 2015 true) #(Dubai 2.789 2010 true) #(London 8.788 2017 false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population Year BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddColumnNamedNameMustBeDistinct [
	<madeBySmallAmp>
	self should: [ df addColumn: #(1 2 3) named: #City ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddEmptyColumnNamed [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true nil) #(Dubai 2.789 true nil) #(London 8.788 false nil)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere EmptyColumn).
	df addEmptyColumnNamed: #EmptyColumn.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddEmptyColumnNamedAtPosition [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 nil true) #(Dubai 2.789 nil true) #(London 8.788 nil false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population EmptyColumn BeenThere).
	df addEmptyColumnNamed: #EmptyColumn atPosition: 3.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddEmptyRowNamed [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(nil nil nil)).
	expected rowNames: #(A B C X).
	expected columnNames: #(City Population BeenThere).
	df addEmptyRowNamed: #X.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddEmptyRowNamedAtPosition [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(nil nil nil) #(London 8.788 false)).
	expected rowNames: #(A B X C).
	expected columnNames: #(City Population BeenThere).
	df addEmptyRowNamed: #X atPosition: 3.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRow [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	df addRow: row.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	expected rowNames: #(A B C X).
	expected columnNames: #(City Population BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowAtPosition [
	<madeBySmallAmp>
	| row expected |
	row := DataSeries withValues: #(Paris 2.141 true) name: #X.
	df addRow: row atPosition: 2.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Paris 2.141 true) #(Dubai 2.789 true) #(London 8.788 false)).
	expected rowNames: #(A X B C).
	expected columnNames: #(City Population BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowNameMustBeDistinct [
	<madeBySmallAmp>
	| series |
	series := DataSeries withValues: #(1 2 3) name: #A.
	self should: [ df addRow: series ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowNamed [
	<madeBySmallAmp>
	| expected |
	df addRow: #(Paris 2.141 true) named: #X.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false) #(Paris 2.141 true)).
	expected rowNames: #(A B C X).
	expected columnNames: #(City Population BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowNamedAtPosition [
	<madeBySmallAmp>
	| expected |
	df addRow: #(Paris 2.141 true) named: #X atPosition: 2.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Paris 2.141 true) #(Dubai 2.789 true) #(London 8.788 false)).
	expected rowNames: #(A X B C).
	expected columnNames: #(City Population BeenThere).
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowNamedNameMustBeDistinct [
	<madeBySmallAmp>
	self should: [ df addRow: #(1 2 3) named: #A ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAddRowSizeMismatch [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addRow: #(1 2) named: #TooSmall ].
	self should: aBlock raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAsArrayOfColumns [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false)).
	self assert: df asArrayOfColumns equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAsArrayOfRows [
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
		yourself)}.
	self assert: df asArrayOfRows equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAt [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries withValues: #('Dubai' 2.789 true).
	expected name: #B.
	expected keys: df columnNames.
	actual := df at: 2.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAtAt [
	<madeBySmallAmp>
	self assert: (df at: 2 at: 1) equals: 'Dubai'
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAtAtPut [
	<madeBySmallAmp>
	| expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 1000 false)).
	expectedDataFrame rowNames: df rowNames.
	expectedDataFrame columnNames: df columnNames.
	df at: 3 at: 2 put: 1000.
	self assert: df equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAtAtTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df at: 2 at: 2 transform: [ :value | value floor ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAtAtTransform_amp [
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
DataFrameTestMinAddAmpTest >> testAtTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		at: 2
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testAt_amp [
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
DataFrameTestMinAddAmpTest >> testCollect [
	<madeBySmallAmp>
	| expectedDf expectedResult actualResult |
	expectedDf := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
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
	self assert: actualResult equals: expectedResult.
	self assert: df equals: expectedDf
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCollect_amp [
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
DataFrameTestMinAddAmpTest >> testColumn [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #(Barcelona Dubai London).
	expectedSeries name: #City.
	expectedSeries keys: df rowNames.
	actualSeries := df column: #City.
	self assert: actualSeries equals: expectedSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnAt [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #(Barcelona Dubai London).
	expectedSeries name: #City.
	expectedSeries keys: df rowNames.
	actualSeries := df columnAt: 1.
	self assert: actualSeries equals: expectedSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnAtPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	actual := df.
	actual columnAt: 1 put: #('X' 'Y' 'Z').
	actual columnAt: 3 put: #(0 1 0).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnAtTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		columnAt: 2
		transform: [ :column | 
			column
				at: #B put: 0;
				yourself ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnIfAbsent [
	<madeBySmallAmp>
	| exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	df
		column: #NoSuchColumn
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnNames [
	<madeBySmallAmp>
	| newNames |
	newNames := #(X Y Z).
	df columnNames: newNames.
	self assert: df columnNames equals: newNames asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnNamesMustBeDistinct [
	<madeBySmallAmp>
	| newNames |
	newNames := #(x y y).
	self should: [ df columnNames: newNames ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnNamesSizeMismatch [
	<madeBySmallAmp>
	| tooManyNames notEnoughNames |
	tooManyNames := #(W X Y Z).
	notEnoughNames := #(Y Z).
	self should: [ df columnNames: tooManyNames ] raise: SizeMismatch.
	self should: [ df columnNames: notEnoughNames ] raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnNotFound [
	<madeBySmallAmp>
	self should: [ df column: #NoSuchColumn ] raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	actual := df.
	actual column: #City put: #('X' 'Y' 'Z').
	actual column: #BeenThere put: #(0 1 0).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnPutIfAbsent [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		column: #NoSuchColumn
		put: #(0 0 0)
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: df equals: expected.
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnPutNotFound [
	<madeBySmallAmp>
	self
		should: [ df column: #NoSuchColumn put: #(0 0 0) ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		column: #Population
		transform: [ :column | 
			column
				at: #B put: 0;
				yourself ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnTransformIfAbsent [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		column: #NoSuchColumn
		transform: [ :column | column at: #B put: 0 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: df equals: expected.
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnTransformNotFound [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		should: [ df
				column: #NoSuchColumn
				transform: [ :column | column at: #B put: 0 ] ]
		raise: NotFoundError.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumns [
	<madeBySmallAmp>
	| columnNames actualDataFrame expectedDataFrame |
	columnNames := #(City BeenThere).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	expectedDataFrame rowNames: df rowNames.
	expectedDataFrame columnNames: columnNames.
	actualDataFrame := df columns: columnNames.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnsAt [
	<madeBySmallAmp>
	| columnNumbers actualDataFrame expectedDataFrame |
	columnNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	expectedDataFrame rowNames: df rowNames.
	expectedDataFrame
		columnNames: (columnNumbers collect: [ :i | df columnNames at: i ]).
	actualDataFrame := df columnsAt: columnNumbers.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnsAtPut [
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
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows:
			#(#(2 true 1) #(2 true 1) #(2 true 1) #(2 false 1) #(2 true 1))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame columnsAt: #(3 1) put: newColumns.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnsAt_amp [
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
DataFrameTestMinAddAmpTest >> testColumnsFromTo [
	<madeBySmallAmp>
	| actualDataFrame expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(1.609 true) #(2.789 true) #(8.788 false)).
	expectedDataFrame rowNames: df rowNames.
	expectedDataFrame columnNames: #(Population BeenThere).
	actualDataFrame := df columnsFrom: 2 to: 3.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnsFromToPut [
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
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows: #(#(2.4 2 1) #(0.5 2 1) #(-1.2 2 1) #(-2.3 2 1) #(3.2 2 1))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame columnsFrom: 3 to: 2 put: newColumns.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testColumnsPut [
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
	newColumns := #(#(1 1 1 1 1) #(2 2 2 2 2)).
	expected := DataFrame
		withRows:
			#(#(2 true 1) #(2 true 1) #(2 true 1) #(2 false 1) #(2 true 1))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame columns: #(type temperature) put: newColumns.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWith3ColumnsAndNoRows [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new: 0 @ 3.
	self assert: dataFrame class equals: DataFrame.
	self assert: dataFrame dimensions equals: 0 @ 3.
	self assert: dataFrame rowNames equals: #() asOrderedCollection.
	self
		assert: dataFrame columnNames
		equals: #(1 2 3) asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumns [
	<madeBySmallAmp>
	| columns dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	dataFrame := DataFrame withColumns: columns.
	self assert: dataFrame rowNames equals: #(1 2 3) asOrderedCollection.
	self
		assert: dataFrame columnNames
		equals: #(1 2 3) asOrderedCollection.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withColumns: columns.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsColumnNames [
	<madeBySmallAmp>
	| columns columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns columnNames: columnNames.
	self assert: dataFrame rowNames equals: #(1 2 3) asOrderedCollection.
	self assert: dataFrame columnNames equals: columnNames.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withColumns: columns.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsColumnNames_amp [
	<madeBySmallAmp>
	| columns columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withColumns: columns
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsRowNames [
	<madeBySmallAmp>
	| columns rowNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns rowNames: rowNames.
	self assert: dataFrame rowNames equals: rowNames.
	self
		assert: dataFrame columnNames
		equals: #(1 2 3) asOrderedCollection.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withColumns: columns.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsRowNamesColumnNames [
	<madeBySmallAmp>
	| columns rowNames columnNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withColumns: columns
		rowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame rowNames equals: rowNames.
	self assert: dataFrame columnNames equals: columnNames.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withColumns: columns.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsRowNamesColumnNames_amp [
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
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithColumnsRowNames_amp [
	<madeBySmallAmp>
	| columns rowNames dataFrame expectedValues |
	columns := #(#('Robb Stark' 'Jon Snow' 'Eddard Stark') #(3 4 1) #(true false true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withColumns: columns rowNames: rowNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withColumns: columns
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithDataFrameInternalRowNamesColumnNames [
	<madeBySmallAmp>
	| rows dataFrameInternal rowNames columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	dataFrameInternal := DataFrameInternal withRows: rows.
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withDataFrameInternal: dataFrameInternal
		rowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame rowNames equals: rowNames.
	self assert: dataFrame columnNames equals: columnNames.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withRows: rows.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRows [
	<madeBySmallAmp>
	| rows dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	dataFrame := DataFrame withRows: rows.
	self assert: dataFrame rowNames equals: #(1 2 3) asOrderedCollection.
	self
		assert: dataFrame columnNames
		equals: #(1 2 3) asOrderedCollection.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withRows: rows.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRowsColumnNames [
	<madeBySmallAmp>
	| rows columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withRows: rows columnNames: columnNames.
	self assert: dataFrame rowNames equals: #(1 2 3) asOrderedCollection.
	self assert: dataFrame columnNames equals: columnNames.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withRows: rows.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRowsColumnNames_amp [
	<madeBySmallAmp>
	| rows columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame withRows: rows columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withRows: rows
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRowsRowNames [
	<madeBySmallAmp>
	| rows rowNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRows: rows rowNames: rowNames.
	self assert: dataFrame rowNames equals: rowNames.
	self
		assert: dataFrame columnNames
		equals: #(1 2 3) asOrderedCollection.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withRows: rows.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRowsRowNamesColumnNames [
	<madeBySmallAmp>
	| rows rowNames columnNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Book IsAlive) asOrderedCollection.
	dataFrame := DataFrame
		withRows: rows
		rowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame rowNames equals: rowNames.
	self assert: dataFrame columnNames equals: columnNames.

	"We know that it works, because we have tests for it in DataFrameInternalTests"
	expectedValues := DataFrameInternal withRows: rows.
	self assert: dataFrame contents equals: expectedValues
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateDataFrameWithRowsRowNames_amp [
	<madeBySmallAmp>
	| rows rowNames dataFrame expectedValues |
	rows := #(#('Robb Stark' 3 true) #('Jon Snow' 4 false) #('Eddard Stark' 1 true)).
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRows: rows rowNames: rowNames.
	self assert: dataFrame class equals: DataFrame.
	expectedValues := DataFrameInternal withRows: rows
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrame [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new.
	self assert: dataFrame class equals: DataFrame.
	self assert: dataFrame dimensions equals: 0 @ 0.
	self assert: dataFrame rowNames equals: #() asOrderedCollection.
	self assert: dataFrame columnNames equals: #() asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrameWithColumnNames [
	<madeBySmallAmp>
	| columnNames dataFrame |
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame withColumnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	self assert: dataFrame dimensions equals: 0 @ 3.
	self assert: dataFrame rowNames equals: #() asOrderedCollection.
	self assert: dataFrame columnNames equals: columnNames
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrameWithColumnNames_amp [
	<madeBySmallAmp>
	| columnNames dataFrame |
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame withColumnNames: columnNames.
	self assert: dataFrame class equals: DataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrameWithRowNames [
	<madeBySmallAmp>
	| rowNames dataFrame |
	rowNames := #(A B C) asOrderedCollection.
	dataFrame := DataFrame withRowNames: rowNames.
	self assert: dataFrame class equals: DataFrame.
	self assert: dataFrame dimensions equals: 3 @ 0.
	self assert: dataFrame rowNames equals: rowNames.
	self assert: dataFrame columnNames equals: #() asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrameWithRowNamesColumnNames [
	<madeBySmallAmp>
	| rowNames columnNames dataFrame |
	rowNames := #(A B C) asOrderedCollection.
	columnNames := #(Name Age Nationality) asOrderedCollection.
	dataFrame := DataFrame
		withRowNames: rowNames
		columnNames: columnNames.
	self assert: dataFrame class equals: DataFrame.
	self assert: dataFrame dimensions equals: 3 @ 3.
	self assert: dataFrame rowNames equals: rowNames.
	self assert: dataFrame columnNames equals: columnNames
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testCreateEmptyDataFrameWithRowNamesColumnNames_amp [
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
DataFrameTestMinAddAmpTest >> testCrossTabulation [
	<madeBySmallAmp>
	| dataFrame expected |
	dataFrame := DataFrame
		withRows:
			#(#(Male Young) #(Female Old) #(Female Young) #(Female Young) #(Male Old)).
	dataFrame columnNames: #(Gender Age).
	expected := DataFrame withRows: #(#(1 2) #(1 1)).
	expected rowNames: #(Female Male).
	expected columnNames: #(Old Young).
	self
		assert: (dataFrame crossTabulate: #Gender with: #Age)
		equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDetect [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: df columnNames
		values: #(London 8.788 false)
		name: #C.
	actual := df detect: [ :row | (row at: #BeenThere) not ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDetectIfNone [
	<madeBySmallAmp>
	| actual expected |
	expected := DataSeries
		withKeys: df columnNames
		values: #(London 8.788 false)
		name: #C.
	actual := df
		detect: [ :row | (row at: #BeenThere) not ]
		ifNone: [ 'not found' ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDetectIfNoneNotFound [
	<madeBySmallAmp>
	| actual expected |
	expected := 'not found'.
	actual := df
		detect: [ :row | (row at: #City) = 'Paris' ]
		ifNone: [ 'not found' ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDetectNotFound [
	<madeBySmallAmp>
	self
		should: [ df detect: [ :row | row at: #City = 'Paris' ] ]
		raise: NotFound
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDo [
	<madeBySmallAmp>
	| actual expected |
	expected := OrderedCollection
		with: #(Barcelona 1.609 true) asDataSeries
		with: #(Dubai 2.789 true) asDataSeries
		with: #(London 8.788 false) asDataSeries.
	expected
		doWithIndex: [ :each :i | 
			each keys: #(City Population BeenThere).
			each name: (#(A B C) at: i) ].
	actual := OrderedCollection new.
	df do: [ :each | actual add: each ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testDoCanModifyRows [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(BARCELONA 1.609 true) #(DUBAI 2.789 true) #(LONDON 8.788 false))
		rowNames: df rowNames
		columnNames: df columnNames.
	df do: [ :row | row at: #City put: (row at: #City) asUppercase ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testEquality [
	<madeBySmallAmp>
	| df1 df2 |
	df1 := DataFrame withRows: #(#(1 2) #(3 4)).
	df2 := DataFrame withRows: #(#(1 2) #(3 4)).
	self assert: df1 equals: df2.
	self assert: df1 = df2
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfColumnNamed [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfColumnNamed: #Population.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfColumnNamedIfAbsent [
	<madeBySmallAmp>
	| expected actual exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := 2.
	actual := df
		indexOfColumnNamed: #Population
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: actual equals: expected.
	self deny: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfColumnNamedIfAbsentNotFound [
	<madeBySmallAmp>
	| exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	df
		indexOfColumnNamed: #NoSuchColumn
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfColumnNamedNotFound [
	<madeBySmallAmp>
	self
		should: [ df indexOfColumnNamed: #NoSuchColumn ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfRowNamed [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfRowNamed: #B.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfRowNamedIfAbsent [
	<madeBySmallAmp>
	| expected actual exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := 2.
	actual := df
		indexOfRowNamed: #B
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: actual equals: expected.
	self deny: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfRowNamedIfAbsentNotFound [
	<madeBySmallAmp>
	| exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	df
		indexOfRowNamed: #NoSuchRow
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfRowNamedIfAbsentNotFound_amp [
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
DataFrameTestMinAddAmpTest >> testIndexOfRowNamedNotFound [
	<madeBySmallAmp>
	self should: [ df indexOfRowNamed: #NoSuchRow ] raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testIndexOfRowNamed_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 2.
	actual := df indexOfRowNamed: #B.
	self assert: df class equals: DataFrame.
	self assert: actual class equals: SmallInteger
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testInequality [
	<madeBySmallAmp>
	| df1 df2 df3 df4 df5 |
	"Other data frames will be compared to this one"
	df1 := DataFrame withRows: #(#(1 2) #(3 4)).
	df1 rowNames: #(a b).
	df1 columnNames: #(x y).

	"This one has different row names"
	df2 := DataFrame withRows: #(#(1 2) #(3 4)).
	df2 rowNames: #(c b).
	df2 columnNames: #(x y).

	"This one has different column names"
	df3 := DataFrame withRows: #(#(1 2) #(3 4)).
	df3 rowNames: #(a b).
	df3 columnNames: #(x z).

	"This one has different dimensions"
	df4 := DataFrame withRows: #(#(1 2) #(3 4) #(5 6)).
	df4 rowNames: #(a b c).
	df4 columnNames: #(x z).

	"This one has different values"
	df5 := DataFrame withRows: #(#(1 2) #(3 5)).
	df5 rowNames: #(a b).
	df5 columnNames: #(x z).
	self assert: (df2 = df1) not.
	self assert: (df3 = df1) not.
	self assert: (df4 = df1) not.
	self assert: (df5 = df1) not
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testInjectInto [
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
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testInjectInto_amp [
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
DataFrameTestMinAddAmpTest >> testPrintOn [
	<madeBySmallAmp>
	| expected actual |
	expected := 'a DataFrame (3@3)'.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testPrintOn_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := 'a DataFrame (3@3)'.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents.
	self assert: actual equals: 'a DataFrame (3@3)'
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testReject [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(B C)
		columnNames: df columnNames.
	actual := df reject: [ :row | (row at: #Population) < 2 ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testReject_amp [
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
DataFrameTestMinAddAmpTest >> testRemoveColumn [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City BeenThere).
	df removeColumn: #Population.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveColumnAt [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona true) #(Dubai true) #(London false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City BeenThere).
	df removeColumnAt: 2.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveColumnAtOutOfRange [
	<madeBySmallAmp>
	self should: [ df removeColumnAt: 100 ] raise: SubscriptOutOfBounds
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveColumnNotFound [
	<madeBySmallAmp>
	self should: [ df removeColumn: #NoSuchColumn ] raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveRow [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expected rowNames: #(A C).
	expected columnNames: #(City Population BeenThere).
	df removeRow: #B.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveRowAt [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expected rowNames: #(A C).
	expected columnNames: #(City Population BeenThere).
	df removeRowAt: 2.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveRowAtOutOfRange [
	<madeBySmallAmp>
	self should: [ df removeRowAt: 100 ] raise: SubscriptOutOfBounds
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRemoveRowNotFound [
	<madeBySmallAmp>
	self should: [ df removeRow: #NoSuchRow ] raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRenameColumnTo [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population Visited).
	df renameColumn: #BeenThere to: #Visited.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRenameColumnToNotFound [
	<madeBySmallAmp>
	self
		should: [ df renameColumn: #NoSuchColumn to: #Sth ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRenameRowTo [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A X C)
		columnNames: #(City Population BeenThere).
	df renameRow: #B to: #X.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRenameRowToNotFound [
	<madeBySmallAmp>
	self
		should: [ df renameRow: #NoSuchRow to: #Sth ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRow [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #('Dubai' 2.789 true).
	expectedSeries name: #B.
	expectedSeries keys: df columnNames.
	actualSeries := df row: #B.
	self assert: actualSeries equals: expectedSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowAt [
	<madeBySmallAmp>
	| actualSeries expectedSeries |
	expectedSeries := DataSeries withValues: #('Dubai' 2.789 true).
	expectedSeries name: #B.
	expectedSeries keys: df columnNames.
	actualSeries := df rowAt: 2.
	self assert: actualSeries equals: expectedSeries
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowAtPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(X Y Z) #(London 8.788 false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	actual := df.
	actual rowAt: 2 put: #(X Y Z).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowAtTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		rowAt: 2
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowIfAbsent [
	<madeBySmallAmp>
	| exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	df row: #NoSuchRow ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowNames [
	<madeBySmallAmp>
	| newNames |
	newNames := #(X Y Z).
	df rowNames: newNames.
	self assert: df rowNames equals: newNames asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowNamesMustBeDistinct [
	<madeBySmallAmp>
	| newNames |
	newNames := #(x y y).
	self should: [ df rowNames: newNames ] raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowNamesSizeMismatch [
	<madeBySmallAmp>
	| tooManyNames notEnoughNames |
	tooManyNames := #(W X Y Z).
	notEnoughNames := #(Y Z).
	self should: [ df rowNames: tooManyNames ] raise: SizeMismatch.
	self should: [ df rowNames: notEnoughNames ] raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowNotFound [
	<madeBySmallAmp>
	self should: [ df row: #NoSuchRow ] raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(X Y Z) #(London 8.788 false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	actual := df.
	actual row: #B put: #(X Y Z).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowPutIfAbsent [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		row: #NoSuchRow
		put: #(0 0 0)
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: df equals: expected.
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowPutNotFound [
	<madeBySmallAmp>
	self
		should: [ df row: #NoSuchRow put: #(0 0 0) ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowTransform [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 0 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		row: #B
		transform: [ :row | 
			row
				at: #Population put: 0;
				yourself ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowTransformIfAbsent [
	<madeBySmallAmp>
	| expected exceptionBlockEvaluated |
	exceptionBlockEvaluated := false.
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	df
		row: #NoSuchRow
		transform: [ :row | row at: #Population put: 0 ]
		ifAbsent: [ exceptionBlockEvaluated := true ].
	self assert: df equals: expected.
	self assert: exceptionBlockEvaluated
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowTransformNotFound [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(A B C)
		columnNames: #(City Population BeenThere).
	self
		should:
			[ df row: #NoSuchRow transform: [ :row | row at: #Population put: 0 ] ]
		raise: NotFoundError.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRows [
	<madeBySmallAmp>
	| rowNames actualDataFrame expectedDataFrame |
	rowNames := #(A C).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expectedDataFrame rowNames: rowNames.
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rows: rowNames.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowsAt [
	<madeBySmallAmp>
	| rowNumbers actualDataFrame expectedDataFrame |
	rowNumbers := #(1 3).
	expectedDataFrame := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false)).
	expectedDataFrame
		rowNames: (rowNumbers collect: [ :i | df rowNames at: i ]).
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rowsAt: rowNumbers.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowsAtPut [
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
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows:
			#(#(2.4 true rain) #(3 3 3) #(1 1 1) #(-2.3 false -) #(2 2 2))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame rowsAt: #(3 5 2) put: newRows.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowsAt_amp [
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
DataFrameTestMinAddAmpTest >> testRowsFromTo [
	<madeBySmallAmp>
	| actualDataFrame expectedDataFrame |
	expectedDataFrame := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false)).
	expectedDataFrame rowNames: #(B C).
	expectedDataFrame columnNames: df columnNames.
	actualDataFrame := df rowsFrom: 2 to: 3.
	self assert: actualDataFrame equals: expectedDataFrame
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowsFromToPut [
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
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows:
			#(#(2.4 true rain) #(3 3 3) #(2 2 2) #(1 1 1) #(3.2 true rain))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame rowsFrom: 4 to: 2 put: newRows.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRowsFromTo_amp [
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
DataFrameTestMinAddAmpTest >> testRowsPut [
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
	newRows := #(#(1 1 1) #(2 2 2) #(3 3 3)).
	expected := DataFrame
		withRows:
			#(#(2.4 true rain) #(3 3 3) #(1 1 1) #(-2.3 false -) #(2 2 2))
		rowNames: rowNames
		columnNames: columnNames.
	dataFrame
		rows:
			{'01:50' asTime.
			'02:30' asTime.
			'01:30' asTime}
		put: newRows.
	self assert: dataFrame equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testRows_amp [
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
DataFrameTestMinAddAmpTest >> testSelect [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true) #(London 8.788 false))
		rowNames: #(B C)
		columnNames: df columnNames.
	actual := df select: [ :row | (row at: #Population) > 2 ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testSortBy [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	actual := df sortBy: #Population.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testSortByUsing [
	"Sort by second letter of city name"

	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(London 8.788 false) #(Dubai 2.789 true)).
	expected rowNames: #(A C B).
	expected columnNames: #(City Population BeenThere).
	actual := df
		sortBy: #City
		using: [ :name1 :name2 | name1 second <= name2 second ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testSortDescendingBy [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows:
			#(#(London 8.788 false) #(Dubai 2.789 true) #(Barcelona 1.609 true)).
	expected rowNames: #(C B A).
	expected columnNames: #(City Population BeenThere).
	actual := df sortDescendingBy: #Population.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testToColumnApplyElementwise [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' true) #(Dubai '2.789' true) #(London '8.788' false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	df toColumn: #Population applyElementwise: [ :each | each asString ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testToColumnAtApplyElementwise [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' true) #(Dubai '2.789' true) #(London '8.788' false)).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	df toColumnAt: 2 applyElementwise: [ :each | each asString ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testToColumnsApplyElementwise [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' 'true') #(Dubai '2.789' 'true') #(London '8.788' 'false')).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	df
		toColumns: #(Population BeenThere)
		applyElementwise: [ :each | each asString ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testToColumnsAtApplyElementwise [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona '1.609' 'true') #(Dubai '2.789' 'true') #(London '8.788' 'false')).
	expected rowNames: #(A B C).
	expected columnNames: #(City Population BeenThere).
	df toColumnsAt: #(2 3) applyElementwise: [ :each | each asString ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testTransposed [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false)).
	expected rowNames: df columnNames.
	expected columnNames: df rowNames.
	self assert: df transposed equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testVarSizeInstanceCreation [
	<madeBySmallAmp>
	| dataFrame |
	dataFrame := DataFrame new: 3 @ 2.
	self assert: dataFrame numberOfRows equals: 3.
	self assert: dataFrame numberOfColumns equals: 2.
	self assert: dataFrame rowNames equals: #(1 2 3) asOrderedCollection.
	self assert: dataFrame columnNames equals: #(1 2) asOrderedCollection
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexCollect [
	<madeBySmallAmp>
	| expectedDf expectedResult actualResult |
	expectedDf := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 2.789 true) #(London 8.788 false)).
	expectedDf rowNames: #(A B C).
	expectedDf columnNames: #(City Population BeenThere).
	expectedResult := DataFrame
		withRows: #(#('BARCELONA' 2) #('DUBAI' 4) #('LONDON' 11)).
	expectedResult rowNames: #(A B C).
	expectedResult columnNames: #(City Population).
	actualResult := df
		withIndexCollect: [ :row :index | 
			row at: #City put: (row at: #City) asUppercase.
			row at: #Population put: (row at: #Population) asInteger + index.
			row removeAt: #BeenThere.
			row ].
	self assert: actualResult equals: expectedResult.
	self assert: df equals: expectedDf
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexDo [
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
	df withIndexDo: [ :each :index | actual at: index put: each ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexDoCanModifyRows [
	<madeBySmallAmp>
	| expected |
	expected := DataFrame
		withRows:
			#(#(Barcelona 1.609 true) #(Dubai 4.789 true) #(London 11.788 false))
		rowNames: df rowNames
		columnNames: df columnNames.
	df
		withIndexDo: [ :row :index | 
			row name = 'A'
				ifFalse: [ row at: #Population put: (row at: #Population) + index ] ].
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexReject [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Barcelona 1.609 true) #(London 8.788 false))
		rowNames: #(A C)
		columnNames: df columnNames.
	actual := df
		withIndexReject: [ :row :index | (row at: #Population) > 2 and: [ index % 2 = 0 ] ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexReject_amp [
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

{ #category : #'as yet unclassified' }
DataFrameTestMinAddAmpTest >> testWithIndexSelect [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrame
		withRows: #(#(Dubai 2.789 true))
		rowNames: #(B)
		columnNames: df columnNames.
	actual := df
		withIndexSelect: [ :row :index | (row at: #Population) > 2 and: [ index % 2 = 0 ] ].
	self assert: actual equals: expected
]
