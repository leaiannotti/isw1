Object subclass: #Cabin	instanceVariableNames: 'status door'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Cabin methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 15:41'!initialize	status := CabinStatusStop new.	door := CabinDoor create.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Cabin class	instanceVariableNames: ''!!Cabin class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/10/2017 15:40'!createWithController: anElevatorController	|cabin|	cabin := self new.	cabin initialize.	^ cabin ! !Object subclass: #CabinDoor	instanceVariableNames: 'status'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoor methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 15:42'!initialize	status := CabinDoorStatusOpen new.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinDoor class	instanceVariableNames: ''!!CabinDoor class methodsFor: 'operations' stamp: 'LeandroIannotti 10/10/2017 15:41'!create	|door|	door := self new.	door initialize.	^ door.! !Object subclass: #CabinDoorStatus	instanceVariableNames: 'closed closing'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:55'!isOpened	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isOpening	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosing	^self subclassResponsibility ! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:31'!initialize	closed := false.! !!CabinDoorStatus methodsFor: 'initialization' stamp: 'LeandroIannotti 10/2/2017 19:56'!isClosed	^self subclassResponsibility ! !CabinDoorStatus subclass: #CabinDoorStatusClose	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isOpened	^false! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^true! !!CabinDoorStatusClose methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !CabinDoorStatus subclass: #CabinDoorStatusClosing	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorStatusClosing methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^true! !CabinDoorStatus subclass: #CabinDoorStatusOpen	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^true! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^false! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorStatusOpen methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !CabinDoorStatus subclass: #CabinDoorStatusOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpened	^false! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:06'!isOpening	^true! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:04'!isClosed	^false! !!CabinDoorStatusOpening methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:05'!isClosing	^false! !Object subclass: #CabinStatus	instanceVariableNames: 'stopped'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:16'!initialize	stopped := true.! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isStopped	^self subclassResponsibility ! !!CabinStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:09'!isMoving	^self subclassResponsibility ! !CabinStatus subclass: #CabinStatusMoving	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^false! !!CabinStatusMoving methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^true ! !CabinStatus subclass: #CabinStatusStop	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isStopped	^true! !!CabinStatusStop methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:10'!isMoving	^false! !Object subclass: #ElevatorController	instanceVariableNames: 'motor cabin floor'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'accessing' stamp: 'LeandroIannotti 10/2/2017 18:56'!cabinFloorNumber	^ cabinFloorNumber ! !!ElevatorController methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/2/2017 19:35'!goUpPushedFromFloor: aNumberOfFloor 	cabinFloorNumber += aNumberOfFloor.	self startElevator.	   ! !!ElevatorController methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 11:27'!initialize	motor := MotorElevator createWithController: self.	cabin := Cabin createWithController: self.	floor := 0.	! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/10/2017 15:38'!isIdle	 ^motor isIdle.! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:08'!isWorking	^ state isWorking! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:42'!isCabinDoorOpening	^cabinDoorState isOpening.! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:30'!isCabinMoving	^ cabinState isMoving.! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:37'!startElevator	state turnOn.	cabinDoorState startToClose.	cabinState move.	! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:30'!isCabinDoorOpened	^cabinDoorState isOpened  .! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:30'!isCabinStopped	^cabinState isStopped .! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/10/2017 11:23'!isCabinDoorClosed	^cabinDoorState! !!ElevatorController methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:32'!isCabinDoorClosing	^false.! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test04CabinStopsAndStartsOpeningDoorWhenGetsToDestination

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor: 1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor: 1.

	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.
	
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.
			
	self deny: elevatorController isCabinDoorOpened.
	self assert: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.

	self assert: elevatorController cabinFloorNumber = 1
! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test05ElevatorGetsIdleWhenDoorGetOpened

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:53'!test02CabinDoorStartsClosingWhenElevatorGetsCalled

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
! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:36'!test08CanNotOpenDoorWhenCabinIsMoving

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:51'!test09DoorKeepsOpeneingWhenItIsOpeneing

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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:35'!test06DoorKeepsOpenedWhenOpeningIsRequested

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
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test14CloseDoorDoesNothingWhenOpeningTheDoorToWaitForPeople

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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test10CabinDoorStartClosingAfterWaitingForPeople

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
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test11StopsWaitingForPeopleIfCloseDoorIsPressed

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
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test13CloseDoorDoesNothingWhenCabinIsMoving

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
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:38'!test09RequestToGoUpAreEnqueueWhenRequestedWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:51'!test24CabinHasToStopAndWaitForPeopleOnFloorsOnItsWayNoMatterHowTheyWellCalled

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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test23CabinHasToStopOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinOnFloor:1.
		
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test22ElevatorCompletesAllTheRequests
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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test17ElevatorHasToEnterEmergencyIfJumpsFloors

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:3.
	elevatorController cabinDoorClosed.
	self 
		should: [ elevatorController cabinOnFloor: 3 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:49'!test20ElevatorHasToEnterEmergencyIfDoorClosesWhenOpening
	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'.]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test18ElevatorHasToEnterEmergencyIfDoorClosesAutomatically
	| elevatorController |
	elevatorController := ElevatorController new.
	
	self 
		should: [ elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test16ElevatorHasToEnterEmergencyIfFalling

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test19ElevatorHasToEnterEmergencyIfDoorClosedSensorTurnsOnWhenClosed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'. ]! !Object subclass: #MotorElevator	instanceVariableNames: 'status'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevator methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 11:30'!initialize	status := MotorElevatorStatusIdle new.! !!MotorElevator methodsFor: 'initialization' stamp: 'LeandroIannotti 10/10/2017 15:38'!isIdle	status isIdle.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!MotorElevator class	instanceVariableNames: ''!!MotorElevator class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 10/10/2017 11:30'!createWithController: anElevatorController	|motorElevator|	motorElevator := self new.	motorElevator initialize.	^ motorElevator ! !Object subclass: #MotorElevatorStatus	instanceVariableNames: 'working'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 19:13'!initialize	working := false.! !!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^self subclassResponsibility ! !!MotorElevatorStatus methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^self subclassResponsibility ! !MotorElevatorStatus subclass: #MotorElevatorStatusIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^true! !!MotorElevatorStatusIdle methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^false! !MotorElevatorStatus subclass: #MotorElevatorStatusWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!MotorElevatorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isIdle	^false! !!MotorElevatorStatusWorking methodsFor: 'testing' stamp: 'LeandroIannotti 10/2/2017 20:12'!isWorking	^true! !