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
    let action: Action
    let actionButtonTitle: String
    
    init(action: Action, actionButtonTitle: String) {
        self.action = action
        self.actionButtonTitle = actionButtonTitle
    }
    
}

class Withdrawal: Transaction {
    
}

class TopUpDeposit: Transaction {
    
}

class TopUpPhone: Transaction {
    
}
