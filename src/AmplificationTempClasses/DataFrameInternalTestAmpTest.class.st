Class {
	#name : #DataFrameInternalTestAmpTest,
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
DataFrameInternalTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> setUp [

	df := DataFrameInternal withRows: #(
		('Barcelona' 1.609 true)
   		('Dubai' 2.789 true)
   		('London' 8.788 false)).
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAddColumnAtPositionSizeMismatch_amp [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addColumn: #(1 2 3 4) atPosition: 3 ]
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAddColumnAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows:
			#(#('Barcelona' 1.609 4 true) #('Dubai' 2.789 3 true) #('London' 8.788 4 false)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testAddColumnAtPosition_amp:1.1'.
	self
		assert: expected size
		equals: 12
		description: 'testAddColumnAtPosition_amp:1.2'.
	df addColumn: #(4 3 4) atPosition: 3.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testAddColumnAtPosition_amp:2.1'.
	self
		assert: df size
		equals: 12
		description: 'testAddColumnAtPosition_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAddRowAtPositionSizeMismatch_amp [
	<madeBySmallAmp>
	| aBlock |
	aBlock := [ df addRow: #(1 2) atPosition: 3 ]
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAddRowAtPosition_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows:
			#(#('Barcelona' 1.609 true) #('Dubai' 2.789 true) #('Lviv' 0.724 true) #('London' 8.788 false)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testAddRowAtPosition_amp:1.1'.
	self
		assert: expected size
		equals: 12
		description: 'testAddRowAtPosition_amp:1.2'.
	df addRow: #('Lviv' 0.724 true) atPosition: 3.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testAddRowAtPosition_amp:2.1'.
	self
		assert: df size
		equals: 12
		description: 'testAddRowAtPosition_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAsArrayOfColumns_amp [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 'Dubai' 'London') #(1.609 2.789 8.788) #(true true false))
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAsArrayOfRows_amp [
	<madeBySmallAmp>
	| expected |
	expected := #(#('Barcelona' 1.609 true) #('Dubai' 2.789 true) #('London' 8.788 false))
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAtAtPut_amp [
	<madeBySmallAmp>
	| array2D expected actual tmp_uGyjpZsUb51 tmp_789S3eCJ452 |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	self
		assert: array2D class
		equals: Array2D
		description: 'testAtAtPut_amp:1.1'.
	self
		assert: array2D size
		equals: 6
		description: 'testAtAtPut_amp:1.2'.
	actual := DataFrameInternal fromArray2D: array2D.
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testAtAtPut_amp:2.1'.
	self assert: actual size equals: 6 description: 'testAtAtPut_amp:2.2'.
	tmp_uGyjpZsUb51 := actual at: 2 at: 2 put: 10.
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testAtAtPut_amp:3.1'.
	self assert: actual size equals: 6 description: 'testAtAtPut_amp:3.2'.
	self
		assert: tmp_uGyjpZsUb51 class
		equals: SmallInteger
		description: 'testAtAtPut_amp:3.1'.
	self
		assert: tmp_uGyjpZsUb51
		equals: 10
		description: 'testAtAtPut_amp:3.2'.
	tmp_789S3eCJ452 := array2D at: 2 at: 2 put: 10.
	self
		assert: array2D class
		equals: Array2D
		description: 'testAtAtPut_amp:4.1'.
	self
		assert: array2D size
		equals: 6
		description: 'testAtAtPut_amp:4.2'.
	self
		assert: tmp_789S3eCJ452 class
		equals: SmallInteger
		description: 'testAtAtPut_amp:4.1'.
	self
		assert: tmp_789S3eCJ452
		equals: 10
		description: 'testAtAtPut_amp:4.2'.
	expected := DataFrameInternal fromArray2D: array2D.
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testAtAtPut_amp:5.1'.
	self
		assert: expected size
		equals: 6
		description: 'testAtAtPut_amp:5.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testAtAt_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testCollect_amp [
	<madeBySmallAmp>
	| dfInternal dfActual dfExpected |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testCollect_amp:1.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testCollect_amp:1.2'.
	dfExpected := DataFrameInternal
		withRows: #(#(10 20) #(30 40) #(50 60)).
	self
		assert: dfExpected class
		equals: DataFrameInternal
		description: 'testCollect_amp:2.1'.
	self
		assert: dfExpected size
		equals: 6
		description: 'testCollect_amp:2.2'.
	dfActual := dfInternal collect: [ :each | each * 10 ].
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testCollect_amp:3.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testCollect_amp:3.2'.
	self
		assert: dfActual class
		equals: DataFrameInternal
		description: 'testCollect_amp:3.1'.
	self
		assert: dfActual size
		equals: 6
		description: 'testCollect_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testColumnAtPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrameInternal
		withRows: #(#('X' 1.609 0) #('Y' 2.789 1) #('Z' 8.788 0)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testColumnAtPut_amp:1.1'.
	self
		assert: expected size
		equals: 9
		description: 'testColumnAtPut_amp:1.2'.
	actual := df.
	actual columnAt: 1 put: #(X Y Z).
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testColumnAtPut_amp:3.1'.
	self
		assert: actual size
		equals: 9
		description: 'testColumnAtPut_amp:3.2'.
	actual columnAt: 3 put: #(0 1 0).
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testColumnAtPut_amp:4.1'.
	self
		assert: actual size
		equals: 9
		description: 'testColumnAtPut_amp:4.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testColumnAt_amp [
	<madeBySmallAmp>
	| actualColumn expectedColumn |
	actualColumn := df columnAt: 2.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testColumnAt_amp:1.1'.
	self assert: df size equals: 9 description: 'testColumnAt_amp:1.2'.
	self
		assert: actualColumn class
		equals: Array
		description: 'testColumnAt_amp:1.1'.
	self
		assert: actualColumn size
		equals: 3
		description: 'testColumnAt_amp:1.2'.
	expectedColumn := #(1.609 2.789 8.788)
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testColumnsAt_amp [
	<madeBySmallAmp>
	| columnNumbers dfActual dfExpected |
	columnNumbers := #(1 3).
	dfExpected := DataFrameInternal
		withRows: #(#('Barcelona' true) #('Dubai' true) #('London' false)).
	self
		assert: dfExpected class
		equals: DataFrameInternal
		description: 'testColumnsAt_amp:2.1'.
	self
		assert: dfExpected size
		equals: 6
		description: 'testColumnsAt_amp:2.2'.
	dfActual := df columnsAt: columnNumbers.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testColumnsAt_amp:3.1'.
	self assert: df size equals: 9 description: 'testColumnsAt_amp:3.2'.
	self
		assert: dfActual class
		equals: DataFrameInternal
		description: 'testColumnsAt_amp:3.1'.
	self
		assert: dfActual size
		equals: 6
		description: 'testColumnsAt_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testCreateDataFrameInternalWithColumns_amp [
	<madeBySmallAmp>
	| array2D expected actual |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	self
		assert: array2D class
		equals: Array2D
		description: 'testCreateDataFrameInternalWithColumns_amp:1.1'.
	self
		assert: array2D size
		equals: 6
		description: 'testCreateDataFrameInternalWithColumns_amp:1.2'.
	expected := DataFrameInternal fromArray2D: array2D.
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testCreateDataFrameInternalWithColumns_amp:2.1'.
	self
		assert: expected size
		equals: 6
		description: 'testCreateDataFrameInternalWithColumns_amp:2.2'.
	actual := DataFrameInternal withColumns: #(#(1 3 5) #(2 4 6)).
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testCreateDataFrameInternalWithColumns_amp:3.1'.
	self
		assert: actual size
		equals: 6
		description: 'testCreateDataFrameInternalWithColumns_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testCreateDataFrameInternalWithRows_amp [
	<madeBySmallAmp>
	| array2D actual expected |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	self
		assert: array2D class
		equals: Array2D
		description: 'testCreateDataFrameInternalWithRows_amp:1.1'.
	self
		assert: array2D size
		equals: 6
		description: 'testCreateDataFrameInternalWithRows_amp:1.2'.
	expected := DataFrameInternal fromArray2D: array2D.
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testCreateDataFrameInternalWithRows_amp:2.1'.
	self
		assert: expected size
		equals: 6
		description: 'testCreateDataFrameInternalWithRows_amp:2.2'.
	actual := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testCreateDataFrameInternalWithRows_amp:3.1'.
	self
		assert: actual size
		equals: 6
		description: 'testCreateDataFrameInternalWithRows_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testDeepCopy_amp [
	<madeBySmallAmp>
	| dfCopy |
	dfCopy := df deepCopy.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testDeepCopy_amp:1.1'.
	self assert: df size equals: 9 description: 'testDeepCopy_amp:1.2'.
	self
		assert: dfCopy class
		equals: DataFrameInternal
		description: 'testDeepCopy_amp:1.1'.
	self
		assert: dfCopy size
		equals: 9
		description: 'testDeepCopy_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testDo_amp [
	<madeBySmallAmp>
	| dfInternal sum tmp_fD6IlbEugZ1 |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testDo_amp:1.1'.
	self assert: dfInternal size equals: 6 description: 'testDo_amp:1.2'.
	sum := 0.
	tmp_fD6IlbEugZ1 := dfInternal do: [ :each | sum := sum + each ].
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testDo_amp:3.1'.
	self assert: dfInternal size equals: 6 description: 'testDo_amp:3.2'.
	self
		assert: tmp_fD6IlbEugZ1 class
		equals: Array2D
		description: 'testDo_amp:3.1'.
	self
		assert: tmp_fD6IlbEugZ1 size
		equals: 6
		description: 'testDo_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testFromArray2D_amp [
	<madeBySmallAmp>
	| dfi array2D |
	array2D := Array2D rows: 3 columns: 2 contents: #(1 2 3 4 5 6).
	self
		assert: array2D class
		equals: Array2D
		description: 'testFromArray2D_amp:1.1'.
	self
		assert: array2D size
		equals: 6
		description: 'testFromArray2D_amp:1.2'.
	dfi := DataFrameInternal fromArray2D: array2D.
	self
		assert: dfi class
		equals: DataFrameInternal
		description: 'testFromArray2D_amp:2.1'.
	self
		assert: dfi size
		equals: 6
		description: 'testFromArray2D_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testPrintOn_amp [
	<madeBySmallAmp>
	| expected actual tmp_X2vUTALPPi2 tmp_8ZCQbKEvwy3 tmp_pyIT4W0koI5 |
	expected := String new writeStream.
	tmp_8ZCQbKEvwy3 := expected nextPutAll: '(''Barcelona'' 1.609 true'.
	self
		assert: expected class
		equals: WriteStream
		description: 'testPrintOn_amp:2.1'.
	self
		assert: expected size
		equals: 3
		description: 'testPrintOn_amp:2.2'.
	self
		assert: tmp_8ZCQbKEvwy3 class
		equals: ByteString
		description: 'testPrintOn_amp:2.1'.
	self
		assert: tmp_8ZCQbKEvwy3
		equals: '(''Barcelona'' 1.609 true'
		description: 'testPrintOn_amp:2.2'.
	expected cr.
	self
		assert: expected class
		equals: WriteStream
		description: 'testPrintOn_amp:3.1'.
	self
		assert: expected size
		equals: 3
		description: 'testPrintOn_amp:3.2'.
	tmp_pyIT4W0koI5 := expected nextPutAll: '''Dubai'' 2.789 true'.
	self
		assert: expected class
		equals: WriteStream
		description: 'testPrintOn_amp:4.1'.
	self
		assert: expected size
		equals: 3
		description: 'testPrintOn_amp:4.2'.
	self
		assert: tmp_pyIT4W0koI5 class
		equals: ByteString
		description: 'testPrintOn_amp:4.1'.
	self
		assert: tmp_pyIT4W0koI5
		equals: '''Dubai'' 2.789 true'
		description: 'testPrintOn_amp:4.2'.
	self
		should: [ df printOn: actual ]
		raise: MessageNotUnderstood
		description: 'testPrintOn_amp:5.1'.
	tmp_X2vUTALPPi2 := expected nextPutAll: '''London'' 8.788 false )'.
	self
		assert: expected class
		equals: WriteStream
		description: 'testPrintOn_amp:6.1'.
	self
		assert: expected size
		equals: 3
		description: 'testPrintOn_amp:6.2'.
	self
		assert: tmp_X2vUTALPPi2 class
		equals: ByteString
		description: 'testPrintOn_amp:6.1'.
	self
		assert: tmp_X2vUTALPPi2
		equals: '''London'' 8.788 false )'
		description: 'testPrintOn_amp:6.2'.
	expected := expected contents.
	self
		assert: expected class
		equals: ByteString
		description: 'testPrintOn_amp:7.1'.
	self
		assert: expected
		equals:
			'(''Barcelona'' 1.609 true
''Dubai'' 2.789 true''London'' 8.788 false )'
		description: 'testPrintOn_amp:7.2'.
	actual := String new writeStream.
	df printOn: actual.
	actual := actual contents.
	self
		assert: actual class
		equals: ByteString
		description: 'testPrintOn_amp:10.1'.
	self
		assert: actual
		equals:
			'(''Barcelona'' 1.609 true
''Dubai'' 2.789 true
''London'' 8.788 false )'
		description: 'testPrintOn_amp:10.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testRemoveColumnAt_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows: #(#('Barcelona' true) #('Dubai' true) #('London' false)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testRemoveColumnAt_amp:1.1'.
	self
		assert: expected size
		equals: 6
		description: 'testRemoveColumnAt_amp:1.2'.
	df removeColumnAt: 2.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testRemoveColumnAt_amp:2.1'.
	self
		assert: df size
		equals: 6
		description: 'testRemoveColumnAt_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testRemoveRowAt_amp [
	<madeBySmallAmp>
	| expected |
	expected := DataFrameInternal
		withRows: #(#('Barcelona' 1.609 true) #('London' 8.788 false)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testRemoveRowAt_amp:1.1'.
	self
		assert: expected size
		equals: 6
		description: 'testRemoveRowAt_amp:1.2'.
	df removeRowAt: 2.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testRemoveRowAt_amp:2.1'.
	self assert: df size equals: 6 description: 'testRemoveRowAt_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testRowAtPut_amp [
	<madeBySmallAmp>
	| actual expected |
	expected := DataFrameInternal
		withRows: #(#('Barcelona' 1.609 true) #('X' 'Y' 'Z') #('London' 8.788 false)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testRowAtPut_amp:1.1'.
	self
		assert: expected size
		equals: 9
		description: 'testRowAtPut_amp:1.2'.
	actual := df.
	actual rowAt: 2 put: #(X Y Z).
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testRowAtPut_amp:3.1'.
	self
		assert: actual size
		equals: 9
		description: 'testRowAtPut_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testRowAt_amp [
	<madeBySmallAmp>
	| actualRow expectedRow |
	actualRow := df rowAt: 2.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testRowAt_amp:1.1'.
	self assert: df size equals: 9 description: 'testRowAt_amp:1.2'.
	self
		assert: actualRow class
		equals: Array
		description: 'testRowAt_amp:1.1'.
	self
		assert: actualRow size
		equals: 3
		description: 'testRowAt_amp:1.2'.
	expectedRow := #('Dubai' 2.789 true)
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testRowsAt_amp [
	<madeBySmallAmp>
	| rowNumbers dfActual dfExpected |
	rowNumbers := #(1 3).
	dfExpected := DataFrameInternal
		withRows: #(#('Barcelona' 1.609 true) #('London' 8.788 false)).
	self
		assert: dfExpected class
		equals: DataFrameInternal
		description: 'testRowsAt_amp:2.1'.
	self
		assert: dfExpected size
		equals: 6
		description: 'testRowsAt_amp:2.2'.
	dfActual := df rowsAt: rowNumbers.
	self
		assert: df class
		equals: DataFrameInternal
		description: 'testRowsAt_amp:3.1'.
	self assert: df size equals: 9 description: 'testRowsAt_amp:3.2'.
	self
		assert: dfActual class
		equals: DataFrameInternal
		description: 'testRowsAt_amp:3.1'.
	self
		assert: dfActual size
		equals: 6
		description: 'testRowsAt_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testVarSizeInstanceCreation_amp [
	<madeBySmallAmp>
	| dfActual |
	dfActual := DataFrameInternal new: 6 @ 8.
	self
		assert: dfActual class
		equals: DataFrameInternal
		description: 'testVarSizeInstanceCreation_amp:1.1'.
	self
		assert: dfActual size
		equals: 48
		description: 'testVarSizeInstanceCreation_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testWithIndicesCollect_amp [
	<madeBySmallAmp>
	| dfInternal actual expected |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testWithIndicesCollect_amp:1.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testWithIndicesCollect_amp:1.2'.
	expected := DataFrameInternal
		withRows: #(#(true true) #(true true) #(true true)).
	self
		assert: expected class
		equals: DataFrameInternal
		description: 'testWithIndicesCollect_amp:2.1'.
	self
		assert: expected size
		equals: 6
		description: 'testWithIndicesCollect_amp:2.2'.
	actual := dfInternal
		withIndicesCollect: [ :each :i :j | each = ((i - 1) * 2 + j) ].
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testWithIndicesCollect_amp:3.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testWithIndicesCollect_amp:3.2'.
	self
		assert: actual class
		equals: DataFrameInternal
		description: 'testWithIndicesCollect_amp:3.1'.
	self
		assert: actual size
		equals: 6
		description: 'testWithIndicesCollect_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestAmpTest >> testWithIndicesDo_amp [
	<madeBySmallAmp>
	| dfInternal tmp_EUUPzSGzHQ1 |
	dfInternal := DataFrameInternal withRows: #(#(1 2) #(3 4) #(5 6)).
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testWithIndicesDo_amp:1.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testWithIndicesDo_amp:1.2'.
	tmp_EUUPzSGzHQ1 := dfInternal withIndicesDo: [ :each :i :j |  ].
	self
		assert: dfInternal class
		equals: DataFrameInternal
		description: 'testWithIndicesDo_amp:2.1'.
	self
		assert: dfInternal size
		equals: 6
		description: 'testWithIndicesDo_amp:2.2'.
	self
		assert: tmp_EUUPzSGzHQ1 class
		equals: Array2D
		description: 'testWithIndicesDo_amp:2.1'.
	self
		assert: tmp_EUUPzSGzHQ1 size
		equals: 6
		description: 'testWithIndicesDo_amp:2.2'
]
