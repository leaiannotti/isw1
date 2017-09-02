Object subclass: #CustomerBook	instanceVariableNames: 'customers'	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!numberOfCustomers
	
	^customers size! !!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!initialize

	super initialize.
	customers := OrderedCollection new! !!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!includesCustomerNamed: aName

	^customers includes: aName ! !!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!isEmpty
	
	^customers isEmpty  ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CustomerBook class	instanceVariableNames: ''!!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!customerAlreadyExistsErrorMessage

	^'Customer already exists'! !TestCase subclass: #IdiomTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:21'!assertTime: beforeTime differenceWith: afterTime lessThan: time	self assert: beforeTime - afterTime < time! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:36'!assertCustomerBook: aCustomerBook withMessage: anMessage withArg: anArg takeLess: aTime	| millisecondsBeforeRunning millisecondsAfterRunning |	millisecondsBeforeRunning := Time millisecondClockValue.	aCustomerBook perform: anMessage with: anArg.	millisecondsAfterRunning := Time millisecondClockValue.	self assert: millisecondsAfterRunning - millisecondsBeforeRunning < aTime! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:44'!test01AddingCustomerShouldNotTakeMoreThan50Milliseconds	| customerBook |	customerBook := CustomerBook new.	self assertTimeBlock: [ customerBook addCustomerNamed: 'John Lennon' ] takeLess: 50! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:42'!assertTimeBlock: aBlock takeLess: aTime	| millisecondsBeforeRunning millisecondsAfterRunning |	millisecondsBeforeRunning := Time millisecondClockValue.	aBlock value.	millisecondsAfterRunning := Time millisecondClockValue.	self assert: millisecondsAfterRunning - millisecondsBeforeRunning < aTime! !!IdiomTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:43'!test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds	| customerBook paulMcCartney |	customerBook := CustomerBook new.	paulMcCartney := 'Paul McCartney'.	customerBook addCustomerNamed: paulMcCartney.	self assertTimeBlock: [ customerBook removeCustomerNamed: paulMcCartney ] takeLess: 100.! !!IdiomTest methodsFor: 'testing' stamp: 'HAW 8/28/2017 08:57:25'!test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !Error subclass: #NotFound	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!