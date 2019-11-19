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
