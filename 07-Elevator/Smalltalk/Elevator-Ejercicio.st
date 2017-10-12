Object subclass: #Cabin	instanceVariableNames: 'status door floorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 16:17'!closing	door := door closing.	status := status closing.! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 14:47'!initialize	status := CabinStatusStop new.	door := CabinDoorOpen new.	floorNumber := 0! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:52'!isMoving	^ status isMoving ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 17:10'!close	door := door close.	status := status close! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:52'!isStopped	^ status isStopped! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isClosed	^ door isClosed! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isClosing	^ door isClosing! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 17:00'!moveTo: aFloorNumber	floorNumber ~~ (aFloorNumber - 1)		ifTrue: [ (ElevatorEmergency for: 'Sensor de cabina desincronizado') signal ].	floorNumber := aFloorNumber.	door := door opening.	status := CabinStatusStop new! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:54'!floorNumber	^ floorNumber ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 16:57'!opening	self isStopped		ifTrue: [ door := door opening.			status := status opening ]! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isOpening	^ door isOpening! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 15:43'!open	door := door open.	status := status open.	"door := CabinDoorOpen new.	status := CabinStatusStop new"! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:49'!isOpened	^door isOpened ! !!Cabin methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:58'!floorNumber: aFlooNumber	floorNumber := aFlooNumber! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Cabin class	instanceVariableNames: ''!!Cabin class methodsFor: 'operations' stamp: 'MarceloFerranti 10/12/2017 14:51'!create	^self new initialize.! !!Cabin class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/10/2017 15:40'!createWithController: anElevatorController	|cabin|	cabin := self new.	cabin initialize.	^ cabin ! !!Cabin class methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 14:51'!createWithController	| cabin |	cabin := self new.	cabin initialize.	^ cabin! !Object subclass: #CabinDoor	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosed	^self subclassResponsibility ! !!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isOpening	^self subclassResponsibility ! !!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosing	^self subclassResponsibility ! !!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:55'!isOpened	^self subclassResponsibility ! !CabinDoor subclass: #CabinDoorClose	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^true! !!CabinDoorClose methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:47'!close	^ (ElevatorEmergency for: 'Sensor de puerta desincronizado') signal! !!CabinDoorClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorClose methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:54'!opening	^ CabinDoorOpening new! !!CabinDoorClose methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:18'!closing	^ self! !!CabinDoorClose methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:44'!open	^ self! !!CabinDoorClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isOpened	^false! !CabinDoor subclass: #CabinDoorClosing	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorClosing methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:46'!close	^ CabinDoorClose new	! !!CabinDoorClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^true! !!CabinDoorClosing methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:48'!opening	^ CabinDoorOpening new! !!CabinDoorClosing methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:19'!closing	^ self! !!CabinDoorClosing methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:44'!open	^ self! !!CabinDoorClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !CabinDoor subclass: #CabinDoorOpen	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorOpen methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:47'!close	^ (ElevatorEmergency for: 'Sensor de puerta desincronizado') signal! !!CabinDoorOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorOpen methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:35'!opening	^ self! !!CabinDoorOpen methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:19'!closing	^ CabinDoorClosing new! !!CabinDoorOpen methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:45'!open	^ self! !!CabinDoorOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^true! !CabinDoor subclass: #CabinDoorOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorOpening methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:48'!close	^ (ElevatorEmergency for: 'Sensor de puerta desincronizado') signal! !!CabinDoorOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^true! !!CabinDoorOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !!CabinDoorOpening methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:59'!opening	^ self! !!CabinDoorOpening methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:19'!closing	^ self! !!CabinDoorOpening methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:46'!open	^ CabinDoorOpen new! !!CabinDoorOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !Object subclass: #CabinStatus	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:16'!initialize	stopped := true.! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isStopped	^self subclassResponsibility ! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isMoving	^self subclassResponsibility ! !!CabinStatus methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:41'!opening	^ self subclassResponsibility! !CabinStatus subclass: #CabinStatusMoving	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusMoving methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:10'!open	^ self! !!CabinStatusMoving methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:59'!close	^ self! !!CabinStatusMoving methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:41'!opening	^self	"^ CabinStatusStop new"! !!CabinStatusMoving methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:18'!closing	^ self! !!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^false! !!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^true ! !CabinStatus subclass: #CabinStatusStop	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusStop methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:45'!open	^ self! !!CabinStatusStop methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 15:59'!close	^ CabinStatusMoving new! !!CabinStatusStop methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:33'!opening	^ self! !!CabinStatusStop methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 16:18'!closing	^ self! !!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^true! !!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^false! !Object subclass: #ElevatorController	instanceVariableNames: 'motor cabin targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 16:45'!cabinDoorClosed	cabin close! !!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 13:13'!cabinDoorOpened	cabin open.	self isCabinWaitingForPeople ifFalse: [	motor off]! !!ElevatorController methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 10/12/2017 16:44'!goUpPushedFromFloor: aNumberOfFloor	targetFloorNumber := aNumberOfFloor.	cabin closing.	motor on! !!ElevatorController methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 14:54'!initialize	motor := Motor create.	cabin := Cabin create.	targetFloorNumber := 0! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorClosed	^ cabin isClosed! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 13:14'!isCabinWaitingForPeople	^cabin floorNumber ~~ targetFloorNumber! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/10/2017 15:38'!isIdle	 ^motor isIdle.! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorOpening	^ cabin isOpening! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 12:03'!isWorking	^ motor isWorking! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinDoorOpened	^ cabin isOpened! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinMoving	^ cabin isMoving! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 12:12'!isCabinDoorClosing	^ cabin isClosing ! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 13:43'!waitForPeopleTimedOut	targetFloorNumber := cabin floorNumber.	cabin closing. motor on! !!ElevatorController methodsFor: 'testing' stamp: 'MarceloFerranti 10/12/2017 11:48'!isCabinStopped	^ cabin isStopped! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 11:53'!cabinFloorNumber	^ cabin floorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 15:36'!openCabinDoorcabin opening! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 17:09'!closeCabinDoor	motor isIdle		ifFalse: [ self waitForPeopleTimedOut ]! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 16:56'!cabinOnFloor: aFloorNumber	cabin moveTo: aFloorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 12:18'!cabinOnFloor	^ cabin floorNumber! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorEmergency methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 13:57'!messageText	^messageText ! !!ElevatorEmergency methodsFor: 'accessing' stamp: 'MarceloFerranti 10/12/2017 14:06'!initialize: aMessage	messageText:= aMessage ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorEmergency class	instanceVariableNames: 'messageText'!!ElevatorEmergency class methodsFor: 'instance creation' stamp: 'MarceloFerranti 10/12/2017 14:07'!for: aMessage	^self new initialize: aMessage! !TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

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
	self assert: elevatorController isCabinDoorOpened.! !Object subclass: #Motor	instanceVariableNames: 'status'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Motor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 11:47'!isIdle	^status isIdle! !!Motor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 14:53'!off	status := MotorStatusIdle new! !!Motor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 12:04'!isWorking	^ status isWorking! !!Motor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 14:53'!on	status := MotorStatusWorking new! !!Motor methodsFor: 'initialization' stamp: 'MarceloFerranti 10/12/2017 14:53'!initialize	status := MotorStatusIdle new.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Motor class	instanceVariableNames: ''!!Motor class methodsFor: 'operations' stamp: 'MarceloFerranti 10/12/2017 14:54'!create^self new initialize.! !Object subclass: #MotorStatus	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^self subclassResponsibility ! !!MotorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^self subclassResponsibility ! !MotorStatus subclass: #MotorStatusIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^false! !!MotorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^true! !MotorStatus subclass: #MotorStatusWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^true! !!MotorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^false! !