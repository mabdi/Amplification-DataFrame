Class {
	#name : #DataFrameAggrGroupTestAmpTest,
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
DataFrameAggrGroupTestAmpTest class >> logs [ ^ smallamp_logs ifNil: [ smallamp_logs:= OrderedCollection new ]  
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> assert: actual equals: expected description: description [ ^ self
		assert: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> deny: actual equals: expected description: description [ ^ self
		deny: actual = expected
		description: description
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> isLogging [ ^true
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> logFailure: aString [ self class logs add: aString
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> setUp [

	df := DataFrame withRows: #(
		(16.99 1.01 Female No Sun Dinner 2)
		(10.34 1.66 Male No Sun Dinner 3)
		(21.01 3.5 Male No Sun Dinner 3)
		(23.68 3.31 Male No Sun Dinner 2)
		(24.59 3.61 Female No Sun Dinner 4)).
		
	df columnNames: #(total_bill tip sex smoker day time size).
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> should: aBlock notTakeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: false
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> should: aBlock takeMoreThan: aDuration description: description [ ^ aBlock
		valueWithin: aDuration
		onTimeout: [ self
				assert: true
				description: description ]
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayMultipleUsingAsSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns:
			#(#(41.58 55.03) #(20.79 18.343333333333334) #(2.31 2.8233333333333337))
		rowNames: #(Female Male)
		columnNames: #(total average averageTip).
	self
		assert: expected class
		equals: DataFrame
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:1.2'.
	actual := df
		groupBy: #sex
		aggregate:
			{(#total_bill using: #sum as: #total).
			(#total_bill using: #average as: #average).
			(#tip using: #average as: #averageTip)}.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateArrayMultipleUsingAsSelector_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingAsBlock_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(20.79 18.343333333333334))
		rowNames: #(Female Male)
		columnNames: #(total).
	self
		assert: expected class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:1.2'.
	actual := df
		groupBy: #sex
		aggregate:
			{(#total_bill using: [ :column | column sum / column size ] as: #total)}.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateArrayUsingAsBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingAsNoSuchAggregateColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingAsNoSuchGroupColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingAsSameColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingAsSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(41.58 55.03))
		rowNames: #(Female Male)
		columnNames: #(total).
	self
		assert: expected class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:1.2'.
	actual := df
		groupBy: #sex
		aggregate: {(#total_bill using: #sum as: #total)}.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateArrayUsingAsSelector_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingBlock_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(20.79 18.343333333333334))
		rowNames: #(Female Male)
		columnNames: #(total_bill).
	self
		assert: expected class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingBlock_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateArrayUsingBlock_amp:1.2'.
	actual := df
		groupBy: #sex
		aggregate: {(#total_bill using: [ :column | column sum / column size ])}.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingBlock_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateArrayUsingBlock_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingBlock_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateArrayUsingBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateArrayUsingSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataFrame
		withColumns: #(#(41.58 55.03))
		rowNames: #(Female Male)
		columnNames: #(total_bill).
	self
		assert: expected class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingSelector_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateArrayUsingSelector_amp:1.2'.
	actual := df groupBy: #sex aggregate: {(#total_bill using: #sum)}.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingSelector_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateArrayUsingSelector_amp:2.2'.
	self
		assert: actual class
		equals: DataFrame
		description: 'testGroupByAggregateArrayUsingSelector_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateArrayUsingSelector_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingAsBlock_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(20.79 18.343333333333334)
		name: #total.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsBlock_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsingAsBlock_amp:1.2'.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: [ :column | column sum / column size ]
		as: #total.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateUsingAsBlock_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateUsingAsBlock_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsBlock_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsingAsBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingAsNoSuchAggregateColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingAsNoSuchGroupColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingAsSameColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingAsSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(41.58 55.03)
		name: #total.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsSelector_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsingAsSelector_amp:1.2'.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: #sum
		as: #total.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateUsingAsSelector_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateUsingAsSelector_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsingAsSelector_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsingAsSelector_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingBlock_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(20.79 18.343333333333334)
		name: #total_bill.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsingBlock_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsingBlock_amp:1.2'.
	actual := df
		group: #total_bill
		by: #sex
		aggregateUsing: [ :column | column sum / column size ].
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateUsingBlock_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateUsingBlock_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsingBlock_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsingBlock_amp:2.2'
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingNoSuchAggregateColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingNoSuchGroupColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingSameColumnError_amp [
	<madeBySmallAmp>
	
]

{ #category : #'as yet unclassified' }
DataFrameAggrGroupTestAmpTest >> testGroupByAggregateUsingSelector_amp [
	<madeBySmallAmp>
	| expected actual |
	expected := DataSeries
		withKeys: #(Female Male)
		values: #(41.58 55.03)
		name: #total_bill.
	self
		assert: expected class
		equals: DataSeries
		description: 'testGroupByAggregateUsingSelector_amp:1.1'.
	self
		assert: expected size
		equals: 2
		description: 'testGroupByAggregateUsingSelector_amp:1.2'.
	actual := df group: #total_bill by: #sex aggregateUsing: #sum.
	self
		assert: df class
		equals: DataFrame
		description: 'testGroupByAggregateUsingSelector_amp:2.1'.
	self
		assert: df size
		equals: 5
		description: 'testGroupByAggregateUsingSelector_amp:2.2'.
	self
		assert: actual class
		equals: DataSeries
		description: 'testGroupByAggregateUsingSelector_amp:2.1'.
	self
		assert: actual size
		equals: 2
		description: 'testGroupByAggregateUsingSelector_amp:2.2'
]
