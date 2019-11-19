Class {
	#name : #DataFrameCsvWriterTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'directory',
		'dataFrame',
		'commaQuoteCsvFile',
		'tabQuoteCsvFile'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestMinAmpTest >> readFile: aFileReference [
	| stream contents |
	stream := aFileReference readStream.
	contents := stream upToEnd.
	stream close.
	^ contents
]

{ #category : #'as yet unclassified' }
DataFrameCsvWriterTestMinAmpTest >> setUp [
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
DataFrameCsvWriterTestMinAmpTest >> testWriteToCsvLineEndLf_amp [
	<madeBySmallAmp>
	| writer actual expected |
	writer := DataFrameCsvWriter new.
	self assert: writer defaultSeparator class equals: Character.
	self assert: writer lineEndConvention class equals: ByteSymbol.
	self assert: writer separator class equals: Character.
	writer lineEndConvention: #lf.
	dataFrame writeTo: commaQuoteCsvFile using: writer.
	actual := self readFile: commaQuoteCsvFile.
	self
		assert: actual
		equals:
			'"","temperature","precipitation","type"
"1:10 am","2.4","true","rain"
"1:30 am","0.5","true","rain"
"1:50 am","-1.2","true","snow"
"2:10 am","-2.3","false","-"
"2:30 am","3.2","true","rain"
'.
	expected := String lf join: TestCsvStrings commaQuoteCsvString lines
]
