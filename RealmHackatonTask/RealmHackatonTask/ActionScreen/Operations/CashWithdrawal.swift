import UIKit

class CashWithdrawal: Operation {
    
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            let transaction = Transaction(amount: selectedAmount,
                                          date: Date(), operation: .cashWithdrawal)
            Core.transactionModel.runWithdrawal(via: transaction)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nCash Withdrawal"
    }
    
    override func errorMessage() -> String {
        return "Can't withdraw \(selectedAmount) amount.\nThere are only \(String(Core.transactionModel.balance).asCurrency()) are available on balance now!"
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently withdrawed amount is: \(String(selectedAmount).asCurrency())"
    }
}
