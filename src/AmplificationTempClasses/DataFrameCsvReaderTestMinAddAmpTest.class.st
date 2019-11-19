Class {
	#name : #DataFrameCsvReaderTestMinAddAmpTest,
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
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> createFile: aFileReference withContents: aString [
	| stream |
	stream := aFileReference writeStream.
	stream nextPutAll: aString.
	stream close.
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> setUp [
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
DataFrameCsvReaderTestMinAddAmpTest >> testReadCsv [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame readFromCsv: commaCsvFile.
	self assert: actualDataFrame equals: dataFrameWithoutRowNames
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> testReadCsvWithRowNames [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame readFromCsvWithRowNames: commaCsvFile.
	self assert: actualDataFrame equals: dataFrameWithRowNames
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> testReadCsvWithRowNamesWithSeparatorTab [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame
		readFromCsvWithRowNames: tabCsvFile
		separator: Character tab.
	self assert: actualDataFrame equals: dataFrameWithRowNames
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> testReadCsvWithRowNamesWithSeparatorTab_amp [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame
		readFromCsvWithRowNames: tabCsvFile
		separator: Character tab.
	self assert: actualDataFrame class equals: DataFrame
]

{ #category : #'as yet unclassified' }
DataFrameCsvReaderTestMinAddAmpTest >> testReadCsvWithSeparatorTab [
	<madeBySmallAmp>
	| actualDataFrame |
	actualDataFrame := DataFrame
		readFromCsv: tabCsvFile
		withSeparator: Character tab.
	self assert: actualDataFrame equals: dataFrameWithoutRowNames
]
