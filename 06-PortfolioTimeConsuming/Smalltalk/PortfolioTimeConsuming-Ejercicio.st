Object subclass: #AccountSummaryWithAllInvestmentInformation
	
	account := aReceptiveAccount ! !

	^ self new initializeFor: aReceptiveAccount ! !
	
	account := aReceptiveAccount ! !

	^ self new initializeFor: aReceptiveAccount ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !
	
	self subclassResponsibility ! !
	
	self subclassResponsibility ! !
	
	self subclassResponsibility ! !
	
	self subclassResponsibility ! !
	
	self subclassResponsibility ! !

	lines add: 'Extraccion por ', aWithdraw value printString ! !
	
	^ lines add: 'Transferencia por ', aTransferWithdraw value negated printString ! !
	
	lines add: 
		'Plazo fijo por ', aCertificateOfDeposit value printString, 
		' durante ', aCertificateOfDeposit days printString, 
		' dias a una tna de ', (aCertificateOfDeposit tna * 100) printString, '%'! !
	
	^ lines add: 'Transferencia por ', aTransferDeposit value  printString ! !
	
	lines add: 'Deposito por ', aDeposit value printString ! !
	
	account := aReceptiveAccount 
	! !
	
	(Delay forSeconds: 1) wait.
	
	lines := OrderedCollection new.
	
	account visitTransactionsWith: self.
	
	^ lines! !

	^ self new initializeFor: aReceptiveAccount ! !
	
	! !
	
	value := value - aTransferWithdraw value! !
	
	! !

	value := value + aTransferDeposit value! !
	
	! !

	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !
	
	account := aReceptiveAccount ! !
	
	^self new initializeFor: aReceptiveAccount   ! !
	
	value := value - aWithdraw value! !
	
	value := value - aTransferWithdraw value! !
	
	value := value - aCertificateOfDeposit value! !
	
	value := value + aTransferDeposit value! !
	
	^ value := value + aDeposit value! !

	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value! !
	
	account := aReceptiveAccount ! !

	^ self new initializeOf: aReceptiveAccount ! !

	^ aTransactionVisitor visitCertificateOfDeposit: self! !

	^ value*(tna/360)*numberOfDays
	! !
	
	^numberOfDays ! !
	^ tna! !

	^ value! !

	value := aValue.
	numberOfDays := aNumberOfDay.
	tna := aTNA.
	account := anAccount ! !

	| certificateOfDeposit |
	
	certificateOfDeposit := self for: aValue during: aNumberOfDay at: aTNA on: anAccount.
	anAccount register: certificateOfDeposit.
	
	^ certificateOfDeposit   ! !

	^ self new initializeFor: aValue during: aNumberOfDay at: aTNA on: anAccount! !

	value := aValue ! !

	^aBalance + value! !

	^ value! !

	^ aTransactionVisitor visitDeposit: self! !

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !

	^ self new initializeFor: aValue ! !

	(Delay forSeconds: 1) wait.
	
	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !
	
	account := aReceptiveAccount ! !
	
	value := value + aCertificateOfDeposit earnings ! !
	
	^ self new initializeFor: aReceptiveAccount   ! !
	! !
	! !
	
	value := value + aCertificateOfDeposit value! !
	! !

	(Delay forSeconds: 1) wait.
	
	value := 0.
	
	account visitTransactionsWith: self.
	
	^ value  ! !
	
	account := aReceptiveAccount ! !
	
	^ self new initializeFor: aReceptiveAccount ! !

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 360 at: 1/10 on: fromAccount.
		
	self 
		should: [ lines := (AccountSummaryWithAllInvestmentInformation for: fromAccount) lines ]
		notTakeMoreThanMilliseconds: 1100.
		
	self assert: 6 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 360 dias a una tna de 10%' = (lines at: 4).
	self assert: 'Ganancias por 100' = (lines at: 5).
	self assert: 'Inversiones por 1000' = (lines at: 6)! !

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

	| account1 |
	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: -50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: -50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 360 at: 1/10 on: fromAccount.
		
	self 
		should: [ lines := (AccountSummaryWithInvestmentEarnings for: fromAccount) lines ]
		notTakeMoreThanMilliseconds: 1100.	
		
	self assert: 5 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 360 dias a una tna de 10%' = (lines at: 4).
	self assert: 'Ganancias por 100' = (lines at: 5).
	! !

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !
	
	^ (AccountTransferNetVisitor for: aReceptiveAccount) value! !
	
	^ (InvestmentEarningVisitor for: aReceptiveAccount) value! !
	
	| summary |
	
	summary := AccountSummary for: aReceptiveAccount.
	^ summary lines
! !
	
	^ (InvestmentNetVisitor for: aReceptiveAccount) value! !
	
	^ (PortfolioTreePrinter of: aPortfolio namingAccountsWith: aDictionary) lines! !
	
	^ (ReversePortfolioTreePrinter of: aPortfolio namingAccountsWith: aDictionary ) lines! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	^ self = anAccount  or: [ accounts anySatisfy: [ :managedAccount | managedAccount manages: anAccount  ]  ]! !

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !

	^ accounts inject: 0 into: [ :balance :account | balance + account balance ]
! !

	^ accounts inject: OrderedCollection new into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !
	
	accounts do: [ :anAccount | anAccount accept: aPortfolioTreePrinter ]! !

	accounts := aCollectionOfAccounts   ! !

	^ aSummarizingAccountVisitor visitPortfolio: self ! !
	
	^ 'Account not managed'! !

	^ 'Account already managed'! !

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

	^ self withAll: (Array with: anAccount1 with: anAccount2 )! !

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size ifFalse: [ self error: self accountAlreadyManagedErrorMessage  ].
	
	aCollectionOfAccounts do: [ :sourceAccount | 
		aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ]]]].
	
	^self new initializeWithAll: aCollectionOfAccounts ! !

	transactions do: [ :aTransaction | aTransaction accept: aTransactionVisitor ]! !

	super initialize.
	transactions := OrderedCollection new.! !

	^ aSummarizingAccountVisitor visitReceptiveAccount: self! !

	^ transactions copy! !

	^ (BalanceVisitor of: self) value
! !

	transactions add: aTransaction 
! !

	^ self = anAccount 
! !

	^ transactions includes: aTtransaction 
! !
	
	portfolio := aPortfolio.
	accountNames := aDictionary ! !
	
	lines := OrderedCollection new.
	spaces := 0.
	
	portfolio accept: self.
	
	^ lines ! !
	
	lines add: (self lineFor: aPortfolio).
	spaces := spaces + 1.
	aPortfolio visitAccountsWith: self.
	spaces := spaces - 1! !
	
	lines add: (self lineFor: aReceptiveAccount)! !

	| stream |
	
	stream := WriteStream on: String new.
	spaces timesRepeat: [ stream nextPut: $ .].
	stream nextPutAll: (accountNames at: aSummarizingAccount).
	
	^ stream contents! !
	
	^ self new initializeOf: aPortfolio namingAccountsWith: aDictionary 
	! !
	
	portfolio := aPortfolio.
	accountNames := aDictionary ! !
	
	^ (PortfolioTreePrinter of: portfolio namingAccountsWith: accountNames) lines reverse! !
	
	^ self new initializeOf: aPortfolio namingAccountsWith: aDictionary 
	! !

	 ^ value! !
	
	^ TransferWithdraw of: self ! !
	
	^ TransferDeposit of: self ! !

	value := aValue.
	sourceAccount := aSourceAccount.
	targetAccount := aTargetAccount! !

	| transfer |
	
	transfer := self for: aValue from: sourceAccount to: targetAccount.
	sourceAccount register: transfer withdrawLeg.
	targetAccount register: transfer depositLeg.
	
	^ transfer ! !

	^ self new initializeFor: aValue from: sourceAccount to: targetAccount! !

	^ transfer value! !

	transfer := aTransfer.
! !

	 ^ aTransactionVisitor visitTransferDeposit: self! !

	^aBalance + self value! !
	
	^transfer! !

	^ self new initializeOf: aTransfer ! !
	
	^transfer! !

	^aBalance - self value! !

	^ transfer value! !

	transfer := aTransfer.
	! !

	 ^ aTransactionVisitor visitTransferWithdraw: self! !

	^ self new initializeOf: aTransfer! !

	^aBalance - value! !

	value := aValue ! !

	^ value ! !

	^ aTransactionVisitor visitWithdraw: self! !

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !

	^ self new initializeFor: aValue ! !