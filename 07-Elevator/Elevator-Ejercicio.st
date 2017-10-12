Object subclass: #Cabin	instanceVariableNames: 'status door floorNumber targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:13'!closing	door := CabinDoorStatusClosing new.	status := CabinStatusStop new! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:53'!initialize	status := CabinStatusStop new.	door := CabinDoor create.	floorNumber := 0.! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:52'!isMoving	^ status isMoving ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:17'!close	door := CabinDoorStatusClose new.	status := CabinStatusMoving new! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:52'!isStopped	^ status isStopped! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isClosed	^ door isClosed! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isClosing	^ door isClosing! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 13:32'!moveTo: aFloorNumber	floorNumber := aFloorNumber.	self opening.! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:54'!floorNumber	^ floorNumber ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 13:37'!openingdoor := CabinDoorStatusOpening new.			status := CabinStatusStop new! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isOpening	^ door isOpening! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 13:27'!open	door := CabinDoorStatusOpen new.	status := CabinStatusStop new! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isOpened	^door isOpened ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:58'!floorNumber: aFlooNumber	floorNumber := aFlooNumber! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Cabin class	instanceVariableNames: ''!!Cabin class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/10/2017 15:40'!createWithController: anElevatorController	|cabin|	cabin := self new.	cabin initialize.	^ cabin ! !Object subclass: #CabinDoor	instanceVariableNames: 'status'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:50'!isClosed	^ status isClosed! !!CabinDoor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:50'!isClosing	^ status isClosing! !!CabinDoor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:51'!isOpening	^ status isOpening! !!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 15:42'!initialize	status := CabinDoorStatusOpen new.! !!CabinDoor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:50'!isOpened	^status isOpened! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinDoor class	instanceVariableNames: ''!!CabinDoor class methodsFor: 'operations' stamp: 'LeandroIannotti 10/10/2017 15:41'!create	|door|	door := self new.	door initialize.	^ door.! !Object subclass: #CabinDoorStatus	instanceVariableNames: 'closed closing'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosed	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isOpening	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosing	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:31'!initialize	closed := false.! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:55'!isOpened	^self subclassResponsibility ! !CabinDoorStatus subclass: #CabinDoorStatusClose	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isOpened	^false! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^true! !CabinDoorStatus subclass: #CabinDoorStatusClosing	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^true! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !CabinDoorStatus subclass: #CabinDoorStatusOpen	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^true! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !CabinDoorStatus subclass: #CabinDoorStatusOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^true! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !Object subclass: #CabinStatus	instanceVariableNames: 'stopped'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:16'!initialize	stopped := true.! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isStopped	^self subclassResponsibility ! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isMoving	^self subclassResponsibility ! !CabinStatus subclass: #CabinStatusMoving	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^false! !!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^true ! !CabinStatus subclass: #CabinStatusStop	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^true! !!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^false! !Object subclass: #ElevatorController	instanceVariableNames: 'motor cabin floor targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 12:16'!cabinDoorClosed	cabin close.! !!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 13:13'!cabinDoorOpened	cabin open.	self isCabinWaitingForPeople ifFalse: [	motor off]! !!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 13:00'!goUpPushedFromFloor: aNumberOfFloor	targetFloorNumber := aNumberOfFloor.	cabin isOpened 		ifTrue: [ motor on.			cabin closing ]! !!ElevatorController methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:42'!initialize	motor := MotorElevator createWithController: self.	cabin := Cabin createWithController: self.	targetFloorNumber := 0! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorClosed	^ cabin isClosed! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 13:14'!isCabinWaitingForPeople	^cabin floorNumber ~~ targetFloorNumber! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/10/2017 15:38'!isIdle	 ^motor isIdle.! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorOpening	^ cabin isOpening! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 12:03'!isWorking	^ motor isWorking! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorOpened	^ cabin isOpened! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinMoving	^ cabin isMoving! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 12:12'!isCabinDoorClosing	^ cabin isClosing ! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 13:43'!waitForPeopleTimedOut	targetFloorNumber := cabin floorNumber.	cabin closing. motor on! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinStopped	^ cabin isStopped! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 11:53'!cabinFloorNumber	^ cabin floorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 13:34'!openCabinDoor	^ (cabin isMoving or: cabin isOpened )		ifFalse: [ cabin opening ]! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 13:39'!closeCabinDoor	((motor isIdle or: cabin isMoving) or: cabin isOpening )		ifFalse: [ self waitForPeopleTimedOut ]! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 12:22'!cabinOnFloor: aFloorNumber	^ cabin moveTo: aFloorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 12:18'!cabinOnFloor	^ cabin floorNumber! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:49'!test20ElevatorHasToEnterEmergencyIfDoorClosesWhenOpening
	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'.]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test16ElevatorHasToEnterEmergencyIfFalling

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test18ElevatorHasToEnterEmergencyIfDoorClosesAutomatically
	| elevatorController |
	elevatorController := ElevatorController new.
	
	self 
		should: [ elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test17ElevatorHasToEnterEmergencyIfJumpsFloors

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:3.
	elevatorController cabinDoorClosed.
	self 
		should: [ elevatorController cabinOnFloor: 3 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test19ElevatorHasToEnterEmergencyIfDoorClosedSensorTurnsOnWhenClosed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test22ElevatorCompletesAllTheRequests
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:2.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test23CabinHasToStopOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinOnFloor:1.
		
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:51'!test24CabinHasToStopAndWaitForPeopleOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinOnFloor:1.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test21CabinHasToStopOnTheFloorsOnItsWay
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:36'!test08CanNotOpenDoorWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.

	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:35'!test06DoorKeepsOpenedWhenOpeningIsRequested

	| elevatorController |
	elevatorController := ElevatorController new.
	
	self assert: elevatorController isCabinDoorOpened.
	
	elevatorController openCabinDoor.

	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 6/16/2014 13:24'!test07DoorMustBeOpenedWhenCabinIsStoppedAndClosingDoors

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
		
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.
		
	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.
! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:51'!test09DoorKeepsOpeneingWhenItIsOpeneing

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.

	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test05ElevatorGetsIdleWhenDoorGetOpened

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor: 1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor: 1.
	elevatorController cabinDoorOpened.
		
	self assert: elevatorController isIdle.
	self deny: elevatorController isWorking.
		
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.

	self assert: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.
		
	self assert: elevatorController cabinFloorNumber = 1! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:57'!test03CabinStartsMovingWhenDoorGetsClosed

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	
	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.

	self deny: elevatorController isCabinStopped.
	self assert: elevatorController isCabinMoving.
	
	self deny: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'MarceloFerranti 10/12/2017 12:24'!test04CabinStopsAndStartsOpeningDoorWhenGetsToDestination	| elevatorController |	elevatorController := ElevatorController new.	elevatorController goUpPushedFromFloor: 1.	elevatorController cabinDoorClosed.	elevatorController cabinOnFloor: 1.	self deny: elevatorController isIdle.	self assert: elevatorController isWorking.	self assert: elevatorController isCabinStopped.	self deny: elevatorController isCabinMoving.	self deny: elevatorController isCabinDoorOpened.	self assert: elevatorController isCabinDoorOpening.	self deny: elevatorController isCabinDoorClosing.	self deny: elevatorController isCabinDoorClosed.	self assert: elevatorController cabinFloorNumber = 1! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:53'!test02CabinDoorStartsClosingWhenElevatorGetsCalled

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor: 1.
	
	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.
	
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.
	
	self deny: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self assert: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/10/2011 17:33'!test01ElevatorStartsIdleWithDoorOpenOnFloorZero

	| elevatorController |
		
	elevatorController := ElevatorController new.
		
	self assert: elevatorController isIdle.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpened.
	self assert: elevatorController cabinFloorNumber = 0
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test10CabinDoorStartClosingAfterWaitingForPeople

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test13CloseDoorDoesNothingWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test12CloseDoorDoesNothingIfIdle

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController closeCabinDoor.

	self assert: elevatorController isIdle.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test11StopsWaitingForPeopleIfCloseDoorIsPressed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test14CloseDoorDoesNothingWhenOpeningTheDoorToWaitForPeople

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:38'!test09RequestToGoUpAreEnqueueWhenRequestedWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.! !Object subclass: #MotorElevator	instanceVariableNames: 'status'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevator methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:47'!isIdle	^status isIdle! !!MotorElevator methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:27'!off	status := MotorElevatorStatusIdle new! !!MotorElevator methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:04'!isWorking	^ status isWorking! !!MotorElevator methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:14'!on	status := MotorElevatorStatusWorking new! !!MotorElevator methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 11:30'!initialize	status := MotorElevatorStatusIdle new.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!MotorElevator class	instanceVariableNames: ''!!MotorElevator class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/10/2017 11:30'!createWithController: anElevatorController	|motorElevator|	motorElevator := self new.	motorElevator initialize.	^ motorElevator ! !Object subclass: #MotorElevatorStatus	instanceVariableNames: 'working'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:13'!initialize	working := false.! !!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^self subclassResponsibility ! !!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^self subclassResponsibility ! !MotorElevatorStatus subclass: #MotorElevatorStatusIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^false! !!MotorElevatorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^true! !MotorElevatorStatus subclass: #MotorElevatorStatusWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^true! !!MotorElevatorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^false! !