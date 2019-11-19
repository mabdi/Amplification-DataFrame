Class {
	#name : #DataFrameAggrGroupTestMinAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAmpTest >> setUp [

	df := DataFrame withRows: #(
		(16.99 1.01 Female No Sun Dinner 2)
		(10.34 1.66 Male No Sun Dinner 3)
		(21.01 3.5 Male No Sun Dinner 3)
		(23.68 3.31 Male No Sun Dinner 2)
		(24.59 3.61 Female No Sun Dinner 4)).
		
	df columnNames: #(total_bill tip sex smoker day time size).
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAmpTest >> testGroupByAggregateArrayMultipleUsingAsSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns:
			#(#(41.58 55.03) #(20.79 18.343333333333334) #(2.31 2.8233333333333337))
		rowNames: #(Female Male)
		columnNames: #(total average averageTip).
	self assert: expected class equals: DataFrame.
	actual := df
		groupBy: #sex
		aggregate:
			{(#total_bill using: #sum as: #total).
			(#total_bill using: #average as: #average).
			(#tip using: #average as: #averageTip)}.
	self assert: df size equals: 5.
	self assert: actual size equals: 2
]
