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
    var alertTitle = ""
    func onActionButtonTap(selectedAmount: Int) {}
    
    let action: Action
    let actionButtonTitle: String
    
    init(action: Action, actionButtonTitle: String) {
        self.action = action
        self.actionButtonTitle = actionButtonTitle
    }
    
}

class CashWithdrawal: Transaction {
    private var _alertTitle = "Selected transaction is:\nCash Withdrawal"
    override var alertTitle: String {
        get {
            return _alertTitle
        }
        set {
            _alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.withdraw(selectedAmount)
    }
}

class TopUpDeposit: Transaction {
    private var _alertTitle = "Selected transaction is:\nTop Up Deposit"
    override var alertTitle: String {
        get {
            return _alertTitle
        }
        set {
            _alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.topUpAccount(with: selectedAmount)
    }
}

class TopUpPhone: Transaction {
    private var _alertTitle = "Selected transaction is:\nTop Up Phone"
    override var alertTitle: String {
        get {
            return _alertTitle
        }
        set {
            _alertTitle = newValue
        }
    }
    
    override func onActionButtonTap(selectedAmount: Int) {
        Core.accountModel.topUpPhone(with: selectedAmount)
    }
}
