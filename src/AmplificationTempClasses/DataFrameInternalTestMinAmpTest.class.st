Class {
	#name : #DataFrameInternalTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAmpTest >> setUp [

	df := DataFrameInternal withRows: #(
		('Barcelona' 1.609 true)
   		('Dubai' 2.789 true)
   		('London' 8.788 false)).
]

{ #category : #'as yet unclassified' }
DataFrameInternalTestMinAmpTest >> testPrintOn_amp [
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
