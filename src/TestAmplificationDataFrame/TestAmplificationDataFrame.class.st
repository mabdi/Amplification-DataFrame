Class {
	#name : #TestAmplificationDataFrame,
	#superclass : #AmplificationHelper,
	#category : #TestAmplificationDataFrame
}

{ #category : #'as yet unclassified' }
TestAmplificationDataFrame >> amplifyAndVisualize [
	<script: 'self new amplifyAndVisualize'>
	| runs |
	ASTHelper uniqueInstance clearTempClasses.
	runs := super amplifyAll.
	Transcript show: (super createMdTable: runs).
	self visualizeAmplification2: runs
]

{ #category : #'as yet unclassified' }
TestAmplificationDataFrame >> testTargtsMapping [
"generatedBy: `AmplificationHelper getStringPairsForPackagePrefix: 'DataFrame.*'`"
| list |
list := OrderedCollection new.
"list add: DataFrameInternalTest->DataFrameInternal." "good"
"list add: DataFrameHeadTailTest->DataFrame." "good"
"list add: DataFrameStatsTest->DataFrame." "!"
"list add: DataFrameAggrGroupTest->DataFrame." "not bad"
list add: DataFrameCsvWriterTest->DataFrameCsvWriter. 
"list add: DataFrameCsvReaderTest->DataFrameCsvReader."
"list add: DataSeriesTest->DataSeries."

"list add: DataFrameTypeDetectorTest->DataFrameTypeDetector." "error"


"list add: DataFrameTest->DataFrame." "Error"
^ list.
]
