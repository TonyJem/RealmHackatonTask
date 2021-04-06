import UIKit

enum OperationType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhone
}

struct Action {
    let operationType: OperationType
}

class Operation {
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
    
    func alertTitle() -> String { return "" }
    
    func hasError() -> Bool {
        return selectedAmount > Core.accountModel.balance
    }
    
    func errorMessage() -> String { return "" }
    func successMessage() -> String { return "" }
}

class CashWithdrawal: Operation {
    
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.accountModel.withdraw(selectedAmount)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nCash Withdrawal"
    }
    
    override func errorMessage() -> String {
        return "Can't withdraw \(selectedAmount) amount.\nThere are only \(String(Core.accountModel.balance).asCurrency()) are available on balance now!"
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently withdrawed amount is: \(String(selectedAmount).asCurrency())"
    }
}

class TopUpDeposit: Operation {
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.accountModel.topUpDeposit(with: selectedAmount)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nTopup Deposit"
    }
    
    override func hasError() -> Bool {
        return (selectedAmount + Core.accountModel.balance) > maxLimitForAmount
    }
    
    override func errorMessage() -> String {
        return "With \(selectedAmount) amount your balance will exceed the allowed maximum: \(maxLimitForAmount). Maximal topup amount can be: \(maxLimitForAmount - Core.accountModel.balance) only."
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently toped up your deposit with \(String(selectedAmount).asCurrency()). Balance now is \(Core.accountModel.balance). "
    }
}

class TopUpPhone: Operation {
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.accountModel.topUpPhone(with: selectedAmount)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nTopup Phone Account"
    }
    
    override func errorMessage() -> String {
        return "Can't topup phone with \(selectedAmount) amount.\nThere are only \(String(Core.accountModel.balance).asCurrency()) are available on balance now!"
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently topedup phone account with: \(String(selectedAmount).asCurrency()) amount."
    }
}
