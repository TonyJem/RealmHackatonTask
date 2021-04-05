import UIKit

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhone
}

struct Action {
    let transactionType: TransactionType
}

class Transaction {
    let maxLimitForAmount = 9999999
    let action: Action
    let actionButtonTitle: String
    
    var selectedAmount = 0
    
    init(action: Action, actionButtonTitle: String) {
        self.action = action
        self.actionButtonTitle = actionButtonTitle
    }
    
    func onActionButtonTap(selectedAmount: Int) {
        self.selectedAmount = selectedAmount
    }
    
    func transactionAlertTitle() -> String { return "" }
    func hasError() -> Bool { return true}
    func errorMessage() -> String { return "" }
    func successMessage() -> String { return "" }
}

class CashWithdrawal: Transaction {
    
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.accountModel.withdraw(selectedAmount)
        }
    }
    
    override func transactionAlertTitle() -> String {
        return "Selected transaction is:\nCash Withdrawal"
    }
    
    override func hasError() -> Bool {
        return selectedAmount > Core.accountModel.balance
    }
    
    override func errorMessage() -> String {
        return "Can't withdraw \(selectedAmount) amount.\nThere are only \(String(Core.accountModel.balance).addCurrency()) on balance now!"
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently withdrawed amount is: \(String(selectedAmount).addCurrency())"
    }
}

class TopUpDeposit: Transaction {
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.accountModel.topUpDeposit(with: selectedAmount)
        }
    }
    
    override func transactionAlertTitle() -> String {
        return "Selected transaction is:\nTopup Deposit"
    }
    
    override func hasError() -> Bool {
        return (selectedAmount + Core.accountModel.balance) > maxLimitForAmount
    }
    
    override func errorMessage() -> String {
        return "With \(selectedAmount) amount your balance will exceed the allowed maximum: \(maxLimitForAmount). Maximal topup amount can be: \(maxLimitForAmount - Core.accountModel.balance) only."
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently toped up your deposit with \(String(selectedAmount).addCurrency()). Balance now is \(Core.accountModel.balance). "
    }
}

//TODO: Finish this class same as CashWithdrawal class
class TopUpPhone: Transaction {
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.topUpPhone(with: selectedAmount)
    }
}
