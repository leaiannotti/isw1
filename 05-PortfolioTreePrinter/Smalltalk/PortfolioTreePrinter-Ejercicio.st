Object subclass: #AccountTransaction	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!AccountTransaction methodsFor: 'evaluating' stamp: 'LeandroIannotti 9/25/2017 21:46'!accountSummaryLine	self subclassResponsibility ! !!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!value

	self subclassResponsibility ! !!AccountTransaction methodsFor: 'initialization' stamp: 'MarceloFerranti 9/28/2017 02:10'!add: aTransactionCalculator to: aCalculus	self subclassResponsibility! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!AccountTransaction class	instanceVariableNames: ''!!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !AccountTransaction subclass: #CertificateOfDeposit	instanceVariableNames: 'value tna numberOfDays account'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!CertificateOfDeposit methodsFor: 'initialization' stamp: 'LeandroIannotti 9/26/2017 17:49'!initializeWithAmount: anAmount andDuration:aNumberOfDays withInterest:anInterest on:anAccount	value := anAmount.	tna := anInterest.	account := anAccount.	numberOfDays := aNumberOfDays.! !!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'MarceloFerranti 9/28/2017 01:57'!numberOfDays	^ numberOfDays! !!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'MarceloFerranti 9/27/2017 20:46'!accountSummaryLine	^ 'Plazo fijo por ' , value asString , ' durante ' , numberOfDays asString , ' dias a una tna de ' , (tna * 100) asString, '%'.
! !!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'MarceloFerranti 9/28/2017 01:56'!tna	^ tna! !!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'LeandroIannotti 9/26/2017 17:52'!value	^ value! !!CertificateOfDeposit methodsFor: 'evaluating' stamp: 'MarceloFerranti 9/28/2017 02:09'!add: aTransactionCalculator to: aCalculus	^ aTransactionCalculator addCertificateOfDeposit: self to: aCalculus ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CertificateOfDeposit class	instanceVariableNames: ''!!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'MarceloFerranti 9/27/2017 20:20'!register: anAmount during: aNumberOfDays at: anInterest on: anAccount	| aCertificateOfDeposit |	aCertificateOfDeposit := CertificateOfDeposit new		initializeWithAmount: anAmount		andDuration: aNumberOfDays		withInterest: anInterest		on: anAccount.	anAccount register: aCertificateOfDeposit! !AccountTransaction subclass: #Deposit	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!value

	^ value! !!Deposit methodsFor: 'initialization' stamp: 'LeandroIannotti 9/25/2017 21:47'!accountSummaryLine	^'Deposito por ', value asString  ! !!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!initializeFor: aValue

	value := aValue ! !!Deposit methodsFor: 'initialization' stamp: 'MarceloFerranti 9/28/2017 02:08'!add: aTransactionCalculator to: aCalculus	^ aTransactionCalculator addDeposit: self to: aCalculus ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Deposit class	instanceVariableNames: ''!!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:41'!register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!for: aValue

	^ self new initializeFor: aValue ! !Deposit subclass: #DepositByTransfer	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!DepositByTransfer methodsFor: 'converting' stamp: 'LeandroIannotti 9/25/2017 21:47'!accountSummaryLine	^'Transaccion por ',value asString! !!DepositByTransfer methodsFor: 'converting' stamp: 'MarceloFerranti 9/28/2017 02:07'!add: aTransactionCalculator to: aCalculus	^ aTransactionCalculator addDepositByTransfer: self to: aCalculus! !TestCase subclass: #PortfolioTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!PortfolioTest methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:21'!investmentNetOf: aReceptiveAccount	^ (InvestmentNetCalculator with: aReceptiveAccount transactions) calculate ! !!PortfolioTest methodsFor: 'test support' stamp: 'MarceloFerranti 9/27/2017 23:36'!reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary	^ (aPortfolio treeSummaryWith: aDictionary) reversed.! !!PortfolioTest methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 00:07'!portofolioTreeOf: aPortfolio namingAccountWith: aDictionary	^ aPortfolio treeSummaryWith: aDictionary! !!PortfolioTest methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:20'!accountTransferNetOf: aReceptiveAccount	^ (BalanceTransferCalculator with: aReceptiveAccount transactions) calculate! !!PortfolioTest methodsFor: 'test support' stamp: 'LeandroIannotti 9/25/2017 21:47'!accountSummaryLinesOf: aReceptiveAccount 
	
	^aReceptiveAccount transactions collect:[:aTransaction | aTransaction accountSummaryLine]. ! !!PortfolioTest methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:21'!investmentEarningsOf: aReceptiveAccount	^ (InvestmentEarningsCalculator with: aReceptiveAccount transactions) calculate ! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

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
	self assert: (composedPortfolio registers: deposit3).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

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
	self assert: ' account3' = (lines at: 5).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

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
	! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!test26AccountSummaryShouldWorkWithCertificateOfDeposit

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
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!test17PortfolioKnowsItsPortfoliosTransactions 

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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:28'!test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |
	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

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
	self assert: (composedPortfolio registers: deposit3).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:06'!test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 3 = lines size.
	self assert: 'Deposito por 100' = (lines at: 1).
	self assert: 'Extraccion por 50' = (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!test13PortfolioManagesComposedAccountsAndPortfolios 

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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

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
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !Object subclass: #SummarizingAccount	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!SummarizingAccount methodsFor: 'testing' stamp: 'MarceloFerranti 9/27/2017 21:23'!treeSummaryWith: aDictionary	self subclassResponsibility! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!manages: anAccount

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!registers: aTransaction

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!transactions

	self subclassResponsibility ! !!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!balance

	self subclassResponsibility ! !SummarizingAccount subclass: #Portfolio	instanceVariableNames: 'accounts'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Portfolio methodsFor: 'initialization' stamp: 'LeandroIannotti 9/23/2017 14:27'!initialize		accounts := OrderedCollection new.! !!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !!Portfolio methodsFor: 'accessing' stamp: 'LeandroIannotti 9/23/2017 15:02'!accounts	^ accounts! !!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:22'!manages: anAccount

	^ self = anAccount  or: [ accounts anySatisfy: [ :managedAccount | managedAccount manages: anAccount  ]  ]! !!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !!Portfolio methodsFor: 'testing' stamp: 'MarceloFerranti 9/27/2017 23:35'!treeSummaryWith: aDictionary	| summary |	summary := OrderedCollection new.	summary add: (aDictionary at: self).	self accounts		collect: [ :anAccount | summary addAll: ((anAccount treeSummaryWith: aDictionary) collect: [ :aSummaryAccount | ' ' , aSummaryAccount ]) ].	^ summary! !!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!balance

	^ accounts sum: [ :account | account balance ]
! !!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Portfolio class	instanceVariableNames: ''!!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !!Portfolio class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:48'!with: anAccount1 with: anAccount2

	^ self withAll: (Array with: anAccount1 with: anAccount2 )! !!Portfolio class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:40'!withAll: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size ifFalse: [ self error: self accountAlreadyManagedErrorMessage  ].
	
	aCollectionOfAccounts do: [ :sourceAccount | 
		aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ]]]].
	
	^self new initializeWithAll: aCollectionOfAccounts ! !!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!accountNotManagedMessageDescription
	
	^ 'Account not managed'! !!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !SummarizingAccount subclass: #ReceptiveAccount	instanceVariableNames: 'transactions'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!manages: anAccount

	^ self = anAccount 
! !!ReceptiveAccount methodsFor: 'testing' stamp: 'MarceloFerranti 9/27/2017 20:21'!registers: aTransaction	^ transactions includes: aTransaction! !!ReceptiveAccount methodsFor: 'testing' stamp: 'MarceloFerranti 9/27/2017 23:33'!treeSummaryWith: aDictionary	^ OrderedCollection with: (aDictionary at: self)! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!transactions 

	^ transactions copy! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'MarceloFerranti 9/28/2017 02:20'!balance	^ (BalanceCalculator with: transactions) calculate! !!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!register: aTransaction

	transactions add: aTransaction 
! !!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!initialize

	super initialize.
	transactions := OrderedCollection new.! !Object subclass: #TransactionCalculator	instanceVariableNames: 'transactions'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 00:08'!initializeWith: aTransactions	transactions := aTransactions.! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 01:59'!addWithdrawByTransfer: aTransaction to: aCalculus	^ aCalculus + 0! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:18'!calculateWithBlock: aCumulativeBlock	^ transactions inject: 0 into: aCumulativeBlock! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:24'!addCertificateOfDeposit: aTransaction to: aCalculus	^ aCalculus + 0! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 01:59'!addWithdraw: aTransaction to: aCalculus	^ aCalculus + 0! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:19'!calculate	^ self calculateWithBlock: [ :aCalculus :aTransaction | aTransaction add: self to: aCalculus ]! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:22'!addDeposit: aTransaction to: aCalculus	^ aCalculus + 0! !!TransactionCalculator methodsFor: 'test support' stamp: 'MarceloFerranti 9/28/2017 02:22'!addDepositByTransfer: aTransaction to: aCalculus	^ aCalculus + 0! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!TransactionCalculator class	instanceVariableNames: 'transactions'!!TransactionCalculator class methodsFor: 'instance creation' stamp: 'MarceloFerranti 9/28/2017 00:11'!with: aTransactions	^self new initializeWith: aTransactions.! !TransactionCalculator subclass: #BalanceCalculator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!BalanceCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:04'!addDepositByTransfer: aDepositTransfer to: aBalance	^ aBalance + aDepositTransfer value! !!BalanceCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:04'!addWithdraw: aWithdraw to: aBalance	^ aBalance - aWithdraw value! !!BalanceCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:23'!addCertificateOfDeposit: aCertificateOfDeposit to: aBalance	^ aBalance - aCertificateOfDeposit value! !!BalanceCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:03'!addDeposit: aDeposit to: aBalance	^ aBalance + aDeposit value! !!BalanceCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:04'!addWithdrawByTransfer: aWithdrawTransfer to: aBalance	^ aBalance - aWithdrawTransfer value! !TransactionCalculator subclass: #BalanceTransferCalculator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!BalanceTransferCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 01:51'!addDepositByTransfer: aDepositTransfer to: aBalance	^ aBalance + aDepositTransfer value! !!BalanceTransferCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 01:52'!addWithdrawByTransfer: aWithdrawTransfer to: aBalance	^ aBalance - aWithdrawTransfer value! !TransactionCalculator subclass: #InvestmentEarningsCalculator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!InvestmentEarningsCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:09'!addCertificateOfDeposit: aCertificateOfDeposit to: anInvestmentEarnings	^ anInvestmentEarnings + (aCertificateOfDeposit value * (aCertificateOfDeposit tna / 360) * aCertificateOfDeposit numberOfDays)! !TransactionCalculator subclass: #InvestmentNetCalculator	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!InvestmentNetCalculator methodsFor: 'adding' stamp: 'MarceloFerranti 9/28/2017 02:23'!addCertificateOfDeposit: aCertificateOfDeposit to: anInvestmentNet	^ anInvestmentNet + aCertificateOfDeposit value! !Object subclass: #Transfer	instanceVariableNames: 'value sourceAccount targetAccount'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Transfer methodsFor: 'converting' stamp: 'LeandroIannotti 9/26/2017 17:25'!initializeWithAmount: anAmount from: aFromAccount to: aToAccount	value := anAmount.	sourceAccount := aFromAccount.	targetAccount := aToAccount.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Transfer class	instanceVariableNames: ''!!Transfer class methodsFor: 'as yet unclassified' stamp: 'LeandroIannotti 9/26/2017 12:05'!register: anAmount from: aFromAccount to: aToAccount 		|aTransfer|		aTransfer := Transfer new initializeWithAmount: anAmount from: aFromAccount to: aToAccount.		WithdrawByTransfer  register: anAmount  on: aFromAccount.	DepositByTransfer  register: anAmount  on: aToAccount. ! !AccountTransaction subclass: #Withdraw	instanceVariableNames: 'value'	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!Withdraw methodsFor: 'initialization' stamp: 'MarceloFerranti 9/28/2017 02:07'!add: aTransactionCalculator to: aCalculus	^ aTransactionCalculator addWithdraw: self to: aCalculus ! !!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!initializeFor: aValue

	value := aValue ! !!Withdraw methodsFor: 'converting' stamp: 'LeandroIannotti 9/25/2017 21:47'!accountSummaryLine	^'Extraccion por ', value asString  ! !!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!value

	^ value ! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Withdraw class	instanceVariableNames: ''!!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !!Withdraw class methodsFor: 'instance creation' stamp: 'LeandroIannotti 9/25/2017 21:19'!m	^'Extraccion por '! !!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!for: aValue

	^ self new initializeFor: aValue ! !Withdraw subclass: #WithdrawByTransfer	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'PortfolioTreePrinter-Ejercicio'!!WithdrawByTransfer methodsFor: 'converting' stamp: 'LeandroIannotti 9/25/2017 21:47'!accountSummaryLine	^'Transferencia por -',value asString! !!WithdrawByTransfer methodsFor: 'converting' stamp: 'MarceloFerranti 9/28/2017 02:07'!add: aTransactionCalculator to: aCalculus	^ aTransactionCalculator addWithdrawByTransfer: self to: aCalculus ! !