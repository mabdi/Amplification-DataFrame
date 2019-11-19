Class {
	#name : #DataFrameInternalTestMinAddAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> setUp [

	df := DataFrameInternal withRows: #(
		('Barcelona' 1.609 true)
   		('Dubai' 2.789 true)
   		('London' 8.788 false)).
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAddColumnAtPosition [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows:
			#(#('Barcelona' 1.609 4 true) #('Dubai' 2.789 3 true) #('London' 8.788 4 false)).
	df addColumn: #(4 3 4) atPosition: 3.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAddColumnAtPositionSizeMismatch [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addColumn: #(1 2 3 4) atPosition: 3 ].
	self should: aBlock raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAddRowAtPosition [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows:
			#(#('Barcelona' 1.609 true) #('Dubai' 2.789 true) #('Lviv' 0.724 true) #('London' 8.788 false)).
	df addRow: #('Lviv' 0.724 true) atPosition: 3.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAddRowAtPositionSizeMismatch [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addRow: #(1 2) atPosition: 3 ].
	self should: aBlock raise: SizeMismatch
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAsArrayOfColumns [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false)).
	self assert: df asArrayOfColumns equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAsArrayOfRows [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 1.609 true) #('Dubai' 2.789 true) #('London' 8.788 false)).
	self assert: df asArrayOfRows equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAtAt [
	<madeBySmallAmp>
	self assert: (df at: 2 at: 2) closeTo: 2.789
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testAtAtPut [
	<madeBySmallAmp>
	| array2D expected actual |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	actual := DataFrameInternal fromArray2D: array2D.
	actual at: 2 at: 2 put: 10.
	array2D at: 2 at: 2 put: 10.
	expected := DataFrameInternal fromArray2D: array2D.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testCollect [
	<madeBySmallAmp>
	| dfInternal dfActual dfExpected |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	dfExpected := DataFrameInternal
		withRows: #(#(10 20) #(30 40) #(50 60)).
	dfActual := dfInternal collect: [ :each | each * 10 ].
	self assert: dfActual equals: dfExpected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testColumnAt [
	<madeBySmallAmp>
	| actualColumn expectedColumn |
	actualColumn := df columnAt: 2.
	expectedColumn := #(1.609 2.789 8.788).
	self assert: actualColumn equals: expectedColumn
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testColumnAtPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrameInternal
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	actual := df.
	actual columnAt: 1 put: #(X Y Z).
	actual columnAt: 3 put: #(0 1 0).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testColumnsAt [
	<madeBySmallAmp>
	| columnNumbers dfActual dfExpected |
	columnNumbers := #(1 3).
	dfExpected := DataFrameInternal
		withRows: #(#('Barcelona' true) #('Dubai' true) #('London' false)).
	dfActual := df columnsAt: columnNumbers.
	self assert: dfActual equals: dfExpected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testCreateDataFrameInternalWithColumns [
	<madeBySmallAmp>
	| array2D expected actual |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	expected := DataFrameInternal fromArray2D: array2D.
	actual := DataFrameInternal withColumns: #(#(1 3 5) #(2 4 6)).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testCreateDataFrameInternalWithRows [
	<madeBySmallAmp>
	| array2D actual expected |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	expected := DataFrameInternal fromArray2D: array2D.
	actual := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testDeepCopy [
	<madeBySmallAmp>
	| dfCopy |
	dfCopy := df deepCopy.
	self assert: df equals: dfCopy.
	self deny: df == dfCopy
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testDo [
	<madeBySmallAmp>
	| dfInternal sum |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	sum := 0.
	dfInternal do: [ :each | sum := sum + each ].
	self assert: sum equals: 21
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testFromArray2D [
	<madeBySmallAmp>
	| dfi array2D |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	dfi := DataFrameInternal fromArray2D: array2D.
	self assert: dfi asArray2D equals: array2D
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testPrintOn [
	<madeBySmallAmp>
	| expected actual |
	expected := String new writeStream.
	expected
		nextPutAll: '(''Barcelona'' 1.609 true';
		cr;
		nextPutAll: '''Dubai'' 2.789 true';
		cr;
		nextPutAll: '''London'' 8.788 false )'.
	expected := expected contents.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testPrintOn_amp [
	<madeBySmallAmp>
	| expected actual tmp_X2vUTALPPi2 tmp_8ZCQbKEvwy3 tmp_pyIT4W0koI5 |
	expected := String new writeStream.
	tmp_8ZCQbKEvwy3 := expected nextPutAll: '(''Barcelona'' 1.609 true'.
	self assert: expected size equals: 3.
	self assert: tmp_8ZCQbKEvwy3 equals: '(''Barcelona'' 1.609 true'.
	expected cr.
	tmp_pyIT4W0koI5 := expected nextPutAll: '''Dubai'' 2.789 true'.
	tmp_X2vUTALPPi2 := expected nextPutAll: '''London'' 8.788 false )'.
	expected := expected contents.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testRemoveColumnAt [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows: #(#('Barcelona' true) #('Dubai' true) #('London' false)).
	df removeColumnAt: 2.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testRemoveRowAt [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows: #(#('Barcelona' 1.609 true) #('London' 8.788 false)).
	df removeRowAt: 2.
	self assert: df equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testRowAt [
	<madeBySmallAmp>
	| actualRow expectedRow |
	actualRow := df rowAt: 2.
	expectedRow := #('Dubai' 2.789 true).
	self assert: actualRow equals: expectedRow
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testRowAtPut [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrameInternal
		withRows:
			#(#('Barcelona' 1.609 true) #('X' 'Y' 'Z') #('London' 8.788 false)).
	actual := df.
	actual rowAt: 2 put: #(X Y Z).
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testRowsAt [
	<madeBySmallAmp>
	| rowNumbers dfActual dfExpected |
	rowNumbers := #(1 3).
	dfExpected := DataFrameInternal
		withRows: #(#('Barcelona' 1.609 true) #('London' 8.788 false)).
	dfActual := df rowsAt: rowNumbers.
	self assert: dfActual equals: dfExpected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testVarSizeInstanceCreation [
	<madeBySmallAmp>
	| dfActual |
	dfActual := DataFrameInternal new: 6 @ 8.
	self assert: dfActual numberOfRows equals: 6.
	self assert: dfActual numberOfColumns equals: 8
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testWithIndicesCollect [
	<madeBySmallAmp>
	| dfInternal actual expected |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	expected := DataFrameInternal
		withRows: #(#(true true) #(true true) #(true true)).
	actual := dfInternal
		withIndicesCollect: [ :each :i :j | each = ((i - 1) * 2 + j) ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAddAmpTest >> testWithIndicesDo [
	<madeBySmallAmp>
	| dfInternal |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	dfInternal
		withIndicesDo: [ :each :i :j | self assert: each equals: (i - 1) * 2 + j ]
]
