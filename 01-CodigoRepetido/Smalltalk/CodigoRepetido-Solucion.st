Object subclass: #CustomerBook

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

	self error: self class customerCanNotBeEmptyErrorMessage ! !
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !
	
	^customers size! !

	self error: self class customerAlreadyExistsErrorMessage! !

	super initialize.
	customers := OrderedCollection new! !

	^customers includes: aName ! !
	
	^customers isEmpty  ! !

	^'Customer name cannot be empty'! !

	^'Customer already exists'! !