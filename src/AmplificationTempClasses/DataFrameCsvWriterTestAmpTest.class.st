Class {
	#name : #DataFrameCsvWriterTestAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'directory',
		'dataFrame',
		'commaQuoteCsvFile',
		'tabQuoteCsvFile'
	],
	#classInstVars : [
		'smallamp_logs'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> readFile: aFileReference [
	| stream contents |
	stream := aFileReference readStream.
	contents := stream upToEnd.
	stream close.
	^ contents
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> setUp [
	directory := FileSystem memory workingDirectory / 'testData'.
	directory createDirectory.
	
	commaQuoteCsvFile := directory / 'commaQuote.csv'.
	tabQuoteCsvFile :=  directory / 'tabQuote.csv'.
	
	dataFrame := DataFrame withRows: #(
		(2.4 true 'rain')
		(0.5 true 'rain')
		(-1.2 true 'snow')
		(-2.3 false '-')
		(3.2 true 'rain')).
		
	dataFrame columnNames: #(temperature precipitation type).
	dataFrame rowNames: (#('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime).
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> testWriteToCsvLineEndLf_amp [
	<madeBySmallAmp>
	| writer actual expected |
	writer := DataFrameCsvWriter new.
	self
		assert: writer class
		equals: DataFrameCsvWriter
		description: 'testWriteToCsvLineEndLf_amp:1.1'.
	self
		assert: writer size
		equals: 4
		description: 'testWriteToCsvLineEndLf_amp:1.2'.
	writer lineEndConvention: #lf.
	self
		assert: writer class
		equals: DataFrameCsvWriter
		description: 'testWriteToCsvLineEndLf_amp:2.1'.
	self
		assert: writer size
		equals: 4
		description: 'testWriteToCsvLineEndLf_amp:2.2'.
	dataFrame writeTo: commaQuoteCsvFile using: writer.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testWriteToCsvLineEndLf_amp:3.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testWriteToCsvLineEndLf_amp:3.2'.
	actual := self readFile: commaQuoteCsvFile.
	self
		assert: actual class
		equals: ByteString
		description: 'testWriteToCsvLineEndLf_amp:4.1'.
	self
		assert: actual
		equals:
			'"","temperature","precipitation","type"
"1:10 am","2.4","true","rain"
"1:30 am","0.5","true","rain"
"1:50 am","-1.2","true","snow"
"2:10 am","-2.3","false","-"
"2:30 am","3.2","true","rain"
'
		description: 'testWriteToCsvLineEndLf_amp:4.2'.
	expected := String lf join: TestCsvStrings commaQuoteCsvString lines
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> testWriteToCsvWithSeparatorTab_amp [
	<madeBySmallAmp>
	| actual expected |
	dataFrame writeToCsv: tabQuoteCsvFile withSeparator: Character tab.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testWriteToCsvWithSeparatorTab_amp:1.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testWriteToCsvWithSeparatorTab_amp:1.2'.
	actual := self readFile: tabQuoteCsvFile.
	self
		assert: actual class
		equals: ByteString
		description: 'testWriteToCsvWithSeparatorTab_amp:2.1'.
	self
		assert: actual
		equals:
			'""	"temperature"	"precipitation"	"type"
"1:10 am"	"2.4"	"true"	"rain"
"1:30 am"	"0.5"	"true"	"rain"
"1:50 am"	"-1.2"	"true"	"snow"
"2:10 am"	"-2.3"	"false"	"-"
"2:30 am"	"3.2"	"true"	"rain"
'
		description: 'testWriteToCsvWithSeparatorTab_amp:2.2'.
	expected := TestCsvStrings tabQuoteCsvString.
	self
		assert: expected class
		equals: ByteString
		description: 'testWriteToCsvWithSeparatorTab_amp:3.1'.
	self
		assert: expected
		equals:
			'""	"temperature"	"precipitation"	"type"
"1:10 am"	"2.4"	"true"	"rain"
"1:30 am"	"0.5"	"true"	"rain"
"1:50 am"	"-1.2"	"true"	"snow"
"2:10 am"	"-2.3"	"false"	"-"
"2:30 am"	"3.2"	"true"	"rain"
'
		description: 'testWriteToCsvWithSeparatorTab_amp:3.2'
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestAmpTest >> testWriteToCsv_amp [
	<madeBySmallAmp>
	| actual expected |
	dataFrame writeToCsv: commaQuoteCsvFile.
	self
		assert: dataFrame class
		equals: DataFrame
		description: 'testWriteToCsv_amp:1.1'.
	self
		assert: dataFrame size
		equals: 5
		description: 'testWriteToCsv_amp:1.2'.
	actual := self readFile: commaQuoteCsvFile.
	self
		assert: actual class
		equals: ByteString
		description: 'testWriteToCsv_amp:2.1'.
	self
		assert: actual
		equals:
			'"","temperature","precipitation","type"
"1:10 am","2.4","true","rain"
"1:30 am","0.5","true","rain"
"1:50 am","-1.2","true","snow"
"2:10 am","-2.3","false","-"
"2:30 am","3.2","true","rain"
'
		description: 'testWriteToCsv_amp:2.2'.
	expected := TestCsvStrings commaQuoteCsvString.
	self
		assert: expected class
		equals: ByteString
		description: 'testWriteToCsv_amp:3.1'.
	self
		assert: expected
		equals:
			'"","temperature","precipitation","type"
"1:10 am","2.4","true","rain"
"1:30 am","0.5","true","rain"
"1:50 am","-1.2","true","snow"
"2:10 am","-2.3","false","-"
"2:30 am","3.2","true","rain"
'
		description: 'testWriteToCsv_amp:3.2'
]
