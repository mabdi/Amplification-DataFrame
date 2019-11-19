Class {
	#name : #DataFrameAggrGroupTestMinAddAmpTest,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #AmplificationTempClasses
}

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> setUp [

	df := DataFrame withRows: #(
		(16.99 1.01 Female No Sun Dinner 2)
		(10.34 1.66 Male No Sun Dinner 3)
		(21.01 3.5 Male No Sun Dinner 3)
		(23.68 3.31 Male No Sun Dinner 2)
		(24.59 3.61 Female No Sun Dinner 4)).
		
	df columnNames: #(total_bill tip sex smoker day time size).
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayMultipleUsingAsSelector [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns:
			#(#(41.58 55.03) #(20.79 18.343333333333334) #(2.31 2.8233333333333337))
		rowNames: #(Female Male)
		columnNames: #(total average averageTip).
	actual := df
		groupBy: #sex
		aggregate:
			{(#total_bill using: #sum as: #total).
			(#total_bill using: #average as: #average).
			(#tip using: #average as: #averageTip)}.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayMultipleUsingAsSelector_amp [
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

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingAsBlock [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(20.79 18.343333333333334))
		rowNames: #(Female Male)
		columnNames: #(total).
	actual := df
		groupBy: #sex
		aggregate:
			{(#total_bill using: [ :column | column sum / column size ] as: #total)}.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingAsNoSuchAggregateColumnError [
	<madeBySmallAmp>
	self
		should:
			[ df groupBy: #sex aggregate: {(#NoSuchColumn using: #sum as: #total)} ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingAsNoSuchGroupColumnError [
	<madeBySmallAmp>
	self
		should: [ df
				groupBy: #NoSuchColumn
				aggregate: {(#total_bill using: #sum as: #total)} ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingAsSameColumnError [
	<madeBySmallAmp>
	self
		should: [ df groupBy: #sex aggregate: {(#sex using: #sum as: #total)} ]
		raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingAsSelector [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(41.58 55.03))
		rowNames: #(Female Male)
		columnNames: #(total).
	actual := df
		groupBy: #sex
		aggregate: {(#total_bill using: #sum as: #total)}.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingBlock [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(20.79 18.343333333333334))
		rowNames: #(Female Male)
		columnNames: #(total_bill).
	actual := df
		groupBy: #sex
		aggregate: {(#total_bill using: [ :column | column sum / column size ])}.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateArrayUsingSelector [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(41.58 55.03))
		rowNames: #(Female Male)
		columnNames: #(total_bill).
	actual := df groupBy: #sex aggregate: {(#total_bill using: #sum)}.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingAsBlock [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(20.79 18.343333333333334)
		name: #total.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: [ :column | column sum / column size ]
		as: #total.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingAsNoSuchAggregateColumnError [
	<madeBySmallAmp>
	self
		should: [ df
				group: #NoSuchColumn
				by: #sex
				aggregateUsing: #sum
				as: #total ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingAsNoSuchGroupColumnError [
	<madeBySmallAmp>
	self
		should: [ df
				group: #sex
				by: #NoSuchColumn
				aggregateUsing: #sum
				as: #total ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingAsSameColumnError [
	<madeBySmallAmp>
	self
		should: [ df
				group: #sex
				by: #sex
				aggregateUsing: #sum
				as: #total ]
		raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingAsSelector [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(41.58 55.03)
		name: #total.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: #sum
		as: #total.
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingBlock [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(20.79 18.343333333333334)
		name: #total_bill.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: [ :column | column sum / column size ].
	self assert: actual equals: expected
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingNoSuchAggregateColumnError [
	<madeBySmallAmp>
	self
		should: [ df group: #NoSuchColumn by: #sex aggregateUsing: #sum ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingNoSuchGroupColumnError [
	<madeBySmallAmp>
	self
		should: [ df group: #sex by: #NoSuchColumn aggregateUsing: #sum ]
		raise: NotFoundError
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingSameColumnError [
	<madeBySmallAmp>
	self
		should: [ df group: #sex by: #sex aggregateUsing: #sum ]
		raise: Error
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestMinAddAmpTest >> testGroupByAggregateUsingSelector [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(41.58 55.03)
		name: #total_bill.
	actual := df group: #total_bill by: #sex aggregateUsing: #sum.
	self assert: actual equals: expected
]
