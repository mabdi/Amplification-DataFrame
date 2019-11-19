Class {
	#name : #DataFrameCsvReaderTestAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'directory',
		'commaCsvFile',
		'tabCsvFile',
		'emptyCsvFile',
		'expectedDataFrame',
		'dataFrameWithoutRowNames',
		'dataFrameWithRowNames'
	],
	#classInstVars : [
		'smallamp_logs'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> createFile: aFileReference withContents: aString [
	| stream |
	stream := aFileReference writeStream.
	stream nextPutAll: aString.
	stream close.
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> setUp [
	directory := FileSystem memory workingDirectory / 'testData'.
	directory createDirectory.
	
	commaCsvFile := directory / 'comma.csv'.
	tabCsvFile :=  directory / 'tab.csv'.
	emptyCsvFile :=  directory / 'empty.csv'.
	
	self createFile: commaCsvFile withContents: TestCsvStrings commaCsvString.
	self createFile: tabCsvFile withContents: TestCsvStrings tabCsvString.
	self createFile: emptyCsvFile withContents: TestCsvStrings emptyCsvString.
	
	dataFrameWithRowNames := DataFrame withRows: #(
		(2.4 true 'rain')
		(0.5 true 'rain')
		(-1.2 true 'snow')
		(-2.3 false '-')
		(3.2 true 'rain')).
		
	dataFrameWithRowNames columnNames: #(temperature precipitation type).
	dataFrameWithRowNames rowNames: (#('01:10' '01:30' '01:50' '02:10' '02:30')
		collect: #asTime).
		
	dataFrameWithoutRowNames := DataFrame withRows: {
		{ '01:10' asTime . 2.4 . true . 'rain' } .
		{ '01:30' asTime . 0.5 . true . 'rain' } .
		{ '01:50' asTime . -1.2 . true . 'snow' } .
		{ '02:10' asTime . -2.3 . false . '-' } . 
		{ '02:30' asTime . 3.2 . true . 'rain' }}.
		
	dataFrameWithoutRowNames columnNames: #(nil temperature precipitation type).
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> testReadCsvWithRowNamesWithSeparatorTab_amp [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame
		readFromCsvWithRowNames: tabCsvFile
		separator: Character tab.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testReadCsvWithRowNamesWithSeparatorTab_amp:1.1'.
	self
		assert: actualDataFrame size
		equals: 5
		description: 'testReadCsvWithRowNamesWithSeparatorTab_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> testReadCsvWithRowNames_amp [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame readFromCsvWithRowNames: commaCsvFile.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testReadCsvWithRowNames_amp:1.1'.
	self
		assert: actualDataFrame size
		equals: 5
		description: 'testReadCsvWithRowNames_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> testReadCsvWithSeparatorTab_amp [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame
		readFromCsv: tabCsvFile
		withSeparator: Character tab.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testReadCsvWithSeparatorTab_amp:1.1'.
	self
		assert: actualDataFrame size
		equals: 5
		description: 'testReadCsvWithSeparatorTab_amp:1.2'
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestAmpTest >> testReadCsv_amp [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame readFromCsv: commaCsvFile.
	self
		assert: actualDataFrame class
		equals: DataFrame
		description: 'testReadCsv_amp:1.1'.
	self
		assert: actualDataFrame size
		equals: 5
		description: 'testReadCsv_amp:1.2'
]
