!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:19:54'!
initialize

	items := OrderedCollection new.
	items addFirst: BaseElement new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:20:12'!
isEmpty
	^ items first isBaseElement! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/15/2017 17:02:26'!
items
	^items! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/15/2017 16:30:38'!
items: aCollectionOfItems

	items := aCollectionOfItems ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:20:41'!
pop

	^items first popFromContainer:self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:21:32'!
popBaseElement

	^Error signal: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:22:13'!
popNonBaseElement: aNonBaseElement

	items removeFirst.
	^aNonBaseElement ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:23:10'!
push: anElement
	items addFirst: (NonBaseElement asElement:anElement)! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:23:37'!
size
	^items size - 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:23:57'!
top
	^ items first topFromContainer:self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:25:10'!
topWIthBaseElement
	^ Error signal: OOStack stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:25:56'!
topWIthNonBaseElement: aNonStackElement
	^ aNonStackElement ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:16:27'!
isBaseElement 
	self subclassResponsibility ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:17:12'!
popFromContainer: aContainer 
	self subclassResponsibility ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:17:17'!
topFromContainer: aContainer 
	self subclassResponsibility ! !


!classDefinition: #BaseElement category: #'Stack-Exercise'!
StackElement subclass: #BaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:17:53'!
isBaseElement
	^true! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:26:59'!
popFromContainer: aContainer
^aContainer popBaseElement ! !

!BaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:27:19'!
topFromContainer: aContainer
^aContainer topWIthBaseElement ! !


!classDefinition: #NonBaseElement category: #'Stack-Exercise'!
StackElement subclass: #NonBaseElement
	instanceVariableNames: 'stackElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonBaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:27:33'!
isBaseElement
^false! !

!NonBaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:28:34'!
nonStackElement
^	stackElement ! !

!NonBaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:29:18'!
popFromContainer: aContainer
	^aContainer popNonBaseElement: stackElement ! !

!NonBaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:30:01'!
topFromContainer: aContainer
	^aContainer topWIthNonBaseElement: stackElement ! !

!NonBaseElement methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:30:29'!
withElement: aStackElement
^ stackElement  := aStackElement ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonBaseElement class' category: #'Stack-Exercise'!
NonBaseElement class
	instanceVariableNames: ''!

!NonBaseElement class methodsFor: 'as yet unclassified' stamp: 'LI 9/17/2017 13:32:41'!
asElement: anElement
	
	|aNonBaseElement|
	aNonBaseElement := self new.
	aNonBaseElement withElement: anElement.
	^aNonBaseElement 
	! !
