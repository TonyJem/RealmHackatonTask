import Foundation

struct Action {
    let transactionType: TransactionType
}

class Transaction {
    let action: Action
    
    init(action: Action) {
        self.action = action
    }
    
    func runTransaction() {}
}

class Withdrawal: Transaction {
    
}

class TopUpDeposit: Transaction {
    
}

class TopUpPhone: Transaction {
    
}
