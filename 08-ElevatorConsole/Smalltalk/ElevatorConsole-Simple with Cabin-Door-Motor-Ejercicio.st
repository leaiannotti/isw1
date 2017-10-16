Object subclass: #Cabin

	self assertIsMovingCorrectly: aFloorNumber.
		
	currentFloorNumber := aFloorNumber.
	elevator hasToStopOnCurrentFloor ifTrue: [self reachedFloorToStop ]
! !
	
	self startClosingDoor.
	self makeStopped.! !
	
	"Esto sirve solo porque siempre se esta yendo para arriba :-)"
	motor moveClockwise.
	self makeMoving.! !
	
	self hasToWaitForPeople ifTrue: [ self waitForPeople ] ifFalse: [ elevator jobDone]! !
	
	state := CabinMovingState for: self.
	
	state := CabinWaitingForPeopleState for: self.
	
	state := CabinStoppedState for: self.
	
	^motor isStopped! !
	
	^motor isMovingClockwise ! !
	
	"TODO: Faltan tests, por ejemplo para asertar que solo lo puede hacer si esta parada - Hernan"
	self makeWaitingForPeople
! !
	
	motor stop.
	self makeStopped! !
	
	^state isWaitingForPeople ! !
	
	^elevator hasFloorsToGo ! !

	^state isStopped! !
	
	^state isMoving! !
	
	self error: self sensorDesincronizedErrorMessage! !
	
	^self class sensorDesincronizedErrorMessage! !

	^door! !

	^currentFloorNumber! !
	
	elevator reachedFloorToStop.
	self stop.
	door startOpening! !
	
	door startClosing! !
	
	^state closeDoor! !
	
	"La puerta ya esta cerrada, no hay que hacer nada con este pedido - Hernan"! !
	
	door startClosing.
	self makeStopped! !
	
	"Si estoy parado no me pueden cerrar la puerta - Hernan"! !

	"Esta implementacion es muy sencilla y asume que se esta yendo para arriba siempre"
	currentFloorNumber+1 ~=aFloorNumber ifTrue: [ self signalSensorDesincronized ]! !

	elevator := anElevator.
	door := CabinDoor of: self.
	motor := Motor new.
	currentFloorNumber := 0.
	state := CabinStoppedState for: self
	! !
	
	^'Sensor de cabina desincronizado'! !

	^self new initializeOf: anElevator! !
	
	self error: self sensorDesincronizedErrorMessage! !
	
	^self class sensorDesincronizedErrorMessage ! !
	
	self signalSensorDesincronized ! !
	
	motor stop.
	self makeClosed.
	
	cabin doorClosed.! !
	
	self signalSensorDesincronized! !
	
	self signalSensorDesincronized ! !
	
	motor moveCounterClockwise.
	self makeOpening	! !

	cabin closeDoor.
	
	! !
	
	motor moveClockwise.
	self makeClosing	! !
	
	state open! !

	^state isOpened ! !
	
	^state isOpening ! !
	
	^state isClosed! !
	
	^state isClosing! !
	
	"TODO: Faltan tests para reaccionar distinto dependiendo del estado - Hernan"
	
	motor stop.
	self makeOpened.
	
	cabin doorOpened ! !
	
	state closed.! !
	
	^motor isStopped! !
	
	^motor isMovingCounterClockwise! !
	
	^motor isMovingClockwise! !
	
	"Ya estoy abierta, no hago nada - Hernan"! !
	
	motor stop.
	self startOpening
	! !
	
	"Cuando la puerta esta cerrada no se puede abrir - Hernan"! !
	
	"No hago nada porque ya me estoy abriendo - Hernan"! !
	
	state := CabinDoorClosedState for: self.
	
	state := CabinDoorClosingState for: self.
	
	state := CabinDoorOpenedState for: self.
	
	state := CabinDoorOpeningState for: self.

	cabin := aCabin.
	motor := Motor new.
	state :=CabinDoorOpenedState for: self.! !
	
	^'Sensor de puerta desincronizado'! !

	^self new initializeOf: aCabin ! !

	door := aCabinDoor ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	^self new initializeFor: aCabinDoor ! !

	aVisitor visitCabinDoorClosed: self! !
	
	^door openWhenClosed! !
	
	^door closedWhenClosed! !
	
	^false! !
	
	^false! !
	
	^true! !
	
	^false! !
	
	^door openWhenClosing! !
	
	^door closedWhenClosing! !
	
	^false! !
	
	^false! !
	
	^false! !
	
	^true! !

	aVisitor visitCabinDoorClosing: self! !
	
	^door closedWhenOpened! !

	aVisitor visitCabinDoorOpened: self! !
	
	^door openWhenOpened! !

	^true! !
	
	^false! !
	
	^false! !
	
	^false! !
	
	^door openWhenOpening! !
	
	^door closedWhenOpening! !

	aVisitor visitCabinDoorOpening: self! !
	
	^false! !
	
	^true! !
	
	^false! !
	
	^false! !

	self subclassResponsibility 
	! !

	self subclassResponsibility 
	! !

	self subclassResponsibility 
	! !

	cabin := aCabin ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	^self new initializeFor: aCabin! !

	aVisitor visitCabinMoving: self! !

	^false! !
	
	^false! !
	
	^true! !
	
	cabin closeDoorWhenMoving! !
	
	cabin closeDoorWhenStopped! !

	^false! !

	^true! !
	
	^false! !

	aVisitor visitCabinStopped: self! !

	aVisitor visitCabinWaitingForPeople: self! !
	
	cabin closeDoorWhenWaitingForPeople! !
	
	^true! !

	^false! !

	^false! !

	self startWorkingGoingTo: aFloorNumber ! !

	self queFloorToGo: aFloorNumber.
	self makeWorking.
	cabin startClosingDoor.! !

	floorsToGo add: aFloorNumber ! !

	self queFloorToGo: aFloorNumber ! !
	
	self makeIdle ! !
	
	floorsToGo removeFirst ! !

	cabin := Cabin of: self.
	floorsToGo := SortedCollection new.
	state := ElevatorIdleState for: self.
	! !
	
	state := ElevatorWorkingState for: self! !
	
	state := ElevatorIdleState for: self! !
	
	^cabin! !
	
	^floorsToGo first = cabin currentFloorNumber ! !
	
	^state isWorking! !
	
	^floorsToGo notEmpty! !

	^state isIdle! !

	^state goUpPushedFromFloor: aFloorNumber! !
	
	stream 
		nextPutAll: 'Puerta Cerrandose';
		nextPut: Character cr.! !

	stream 
		nextPutAll: 'Puerta Cerrada';
		nextPut: Character cr.! !

	stream 
		nextPutAll: 'Puerta Abriendose'  ;
		nextPut: Character cr.! !
	
	! !
	
	stream 
		nextPutAll: 'Cabina Detenida' ;
		nextPut: Character cr.! !
! !
	
	stream 
		nextPutAll: 'Cabina Moviendose'  ;
		nextPut: Character cr .
	
	^ ReadStream on: stream contents ! !
	
	stream := WriteStream on: String new.
! !

	^ self new initializeOf: anElevator  ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	elevator := anElevator ! !

	^self new initializeFor: anElevator ! !

	^true! !
	
	^false! !

	^elevator goUpPushedFromFloorWhenIdle: aFloorNumber! !
	
	^ cabinFieldModel! !
	
	^ cabinDoorFieldModel! !
	

	cabinDoorFieldModel := 'Closed'! !
	
	cabinDoorFieldModel := 'Closing'! !

	cabinDoorFieldModel := 'Opening'! !
	
	cabinFieldModel := 'Waiting for People'! !
	
	cabinFieldModel := 'Stopped'! !

	cabinDoorFieldModel := 'Opened'! !
	
	cabinFieldModel := 'Moving'! !

	^ self new initializeOf: anElevator! !

	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor:  1.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self deny: door isOpened.
	self assert: door isOpening.
	self deny: door isClosing.
	self deny: door isClosed.

	self assert: cabin currentFloorNumber = 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped.

! !

	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor:  1.
	door opened.

	self assert: elevator isIdle.
	self deny: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self assert: door isOpened.
	self deny: door isOpening.
	self deny: door isClosing.
	self deny: door isClosed.

	self assert: cabin currentFloorNumber = 1.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped.
! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self deny: cabin isStopped.
	self assert: cabin isMoving.

	self deny: door isOpened.
	self deny: door isOpening.
	self deny: door isClosing.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise.! !

	self assert: elevator isIdle.
	self assert: cabin isStopped.
	self assert: door isOpened.
	self assert: cabin currentFloorNumber = 0
! !

	elevator goUpPushedFromFloor: 1.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self deny: door isOpened.
	self deny: door isOpening.
	self assert: door isClosing.
	self deny: door isClosed.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	door open.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise
	! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	door open.
	
	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	self assert: door isOpened.

	door open.

	self assert: door isOpened.! !

	elevator goUpPushedFromFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	door open.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped

! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
	! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.
	cabin waitForPeopleTimedOut.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.

	self assert: elevator isWorking.
	self assert: cabin isWaitingForPeople.
	self assert: door isOpened.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped

! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise! !

	door close.

	self assert: elevator isIdle.
	self assert: cabin isStopped.
	self assert: door isOpened.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.

	self assert: elevator isWorking.
	self assert: cabin isWaitingForPeople.
	self assert: door isOpened.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped
! !

	elevator := Elevator new.
	cabin := elevator cabin.
	door := cabin door.! !

	elevator goUpPushedFromFloor:2.
	door closed.
	elevator goUpPushedFromFloor:1.
	cabin onFloor: 1.
	door opened.
	cabin waitForPeopleTimedOut.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	elevator goUpPushedFromFloor:2.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:2.
	door closed.
	elevator goUpPushedFromFloor:1.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	elevator goUpPushedFromFloor:2.
	cabin onFloor: 1.
	door opened.
	cabin waitForPeopleTimedOut.
	door closed.
	cabin onFloor: 2.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 2.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self
		should: [ cabin onFloor: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:3.
	door closed.

	self
		should: [ cabin onFloor:  3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:2.
	door closed.
	cabin onFloor: 1.

	self
		should: [ cabin onFloor: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
			
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: readStream atEnd
! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
				
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: readStream atEnd! !
 
	| elevatorConsole readStream elevatorStatusView |
	
	elevatorConsole := ElevatorConsole of: elevator.
	elevatorStatusView := ElevatorStatusView of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor: 1.  
		
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: 'Cabina Detenida' = readStream nextLine.
	self assert: 'Puerta Abriendose' = readStream nextLine.
	self assert: readStream atEnd.

	self assert: 'Stopped' = elevatorStatusView cabinFieldModel.
	self assert: 'Opening' = elevatorStatusView cabinDoorFieldModel! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor: 1.  
					
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: 'Cabina Detenida' = readStream nextLine.
	self assert: 'Puerta Abriendose' = readStream nextLine.
	self assert: readStream atEnd
! !

	elevator := Elevator new.
	cabin := elevator cabin.
	door := cabin door.! !

	^elevator goUpPushedFromFloorWhenWorking: aFloorNumber ! !
	
	^false! !
	
	^true! !
	
	self isMoving ifTrue: [ self signalMotorMustBeStoppedBeforeMovingAgain]! !

	^self class motorMustBeStoppedBeforeMovingAgainErrorMessage
! !

	self error: self motorMustBeStoppedBeforeMovingAgainErrorMessage! !

	state := #stopped! !
	
	self assertIsNotMoving.
	
	state := #movingClockwise! !
	
	self assertIsNotMoving.
	
	state := #movingCounterClockwise! !
	
	state := #stopped! !
	
	^state = #movingCounterClockwise ! !
	
	^state = #movingClockwise! !
	
	^state = #stopped! !
	
	^self isStopped not! !

	^'El motor debe estar parado antes de que se empiece a mover'! !