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

	^'Customer already exists'! !TestCase subclass: #IdiomTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/6/2017 11:19'!tryBlock: aBlock withException: aException assert: assertBlock	[aBlock value.	self fail]	on: aException	do: assertBlock ! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:44'!test01AddingCustomerShouldNotTakeMoreThan50Milliseconds	| customerBook |	customerBook := CustomerBook new.	self assertTimeBlock: [ customerBook addCustomerNamed: 'John Lennon' ] takeLess: 50! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:42'!assertTimeBlock: aBlock takeLess: aTime	| millisecondsBeforeRunning millisecondsAfterRunning |	millisecondsBeforeRunning := Time millisecondClockValue.	aBlock value.	millisecondsAfterRunning := Time millisecondClockValue.	self assert: millisecondsAfterRunning - millisecondsBeforeRunning < aTime! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/2/2017 12:43'!test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds	| customerBook paulMcCartney |	customerBook := CustomerBook new.	paulMcCartney := 'Paul McCartney'.	customerBook addCustomerNamed: paulMcCartney.	self assertTimeBlock: [ customerBook removeCustomerNamed: paulMcCartney ] takeLess: 100.! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/6/2017 11:21'!test03CanNotAddACustomerWithEmptyName	| customerBook |	customerBook := CustomerBook new.	self tryBlock: [ customerBook addCustomerNamed: ''] withException: Error  assert:[ :anError | 			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.			self assert: customerBook isEmpty ]! !!IdiomTest methodsFor: 'testing' stamp: 'MarceloFerranti 9/6/2017 11:22'!test04CanNotRemoveAnInvalidCustomer	| customerBook johnLennon |	customerBook := CustomerBook new.	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.		self tryBlock: [ customerBook removeCustomerNamed: 'Paul McCartney'] withException: NotFound assert: [ :anError | 			self assert: customerBook numberOfCustomers = 1.			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !Error subclass: #NotFound	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CodigoRepetido-Ejercicio'!