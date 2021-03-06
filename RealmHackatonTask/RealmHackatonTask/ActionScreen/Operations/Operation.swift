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
    let maxLimitForAmount = Core.maxLimitForAmount
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
        return selectedAmount > Core.transactionModel.balance
    }
    
    func errorMessage() -> String { return "" }
    func successMessage() -> String { return "" }
}
