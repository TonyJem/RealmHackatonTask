import Foundation

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhoneAccount
}

struct Action {
    let transactionType: TransactionType
}

class Transaction {
    var alertTitle = "Top Up"
    func onActionButtonTap(selectedAmount: Int) {}
    
    let action: Action
    let actionButtonTitle: String
    
    init(action: Action, actionButtonTitle: String) {
        self.action = action
        self.actionButtonTitle = actionButtonTitle
    }
    
}

class CashWithdrawal: Transaction {
    override var alertTitle: String {
        get {
            return "Selected transaction is:\nCash Withdrawal"
        }
        set {
            self.alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.withdraw(selectedAmount)
    }
}

class TopUpDeposit: Transaction {
    override var alertTitle: String {
        get {
            return "Selected transaction is:\nTop Up Deposit"
        }
        set {
            self.alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.topUpAccount(with: selectedAmount)
    }
}

class TopUpPhone: Transaction {
    
    override var alertTitle: String {
        get {
            return "Selected transaction is:\nTop Up Phone"
        }
        set {
            self.alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.topUpPhone(with: selectedAmount)
    }
}
