import UIKit

struct Core {
    static let transactionModel = TransactionModel()
}

enum transactionType {
    case outcome
    case income
}

struct Transaction {
    let amount: Int
    let date: String
    let operation: OperationType
    
    var description: String {
        switch operation {
        case .cashWithdrawal:
            return "Cash withdrawal"
        case .topUpDeposit:
            return "Topup deposit"
        case .topUpPhone:
            return "Topup Phone's account"
        }
    }
    
    var transactionType: transactionType {
        switch operation {
        case .cashWithdrawal, .topUpPhone:
            return .outcome
        case .topUpDeposit:
            return .income
        }
    }
}

class TransactionModel {
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    var balance = 10
    
    var transactions:[Transaction] = []
    
    func runWithdrawal(with transaction: Transaction) {
        balance -= transaction.amount
        print("🟢 Withdraw amount: \(transaction.amount).\nCurrent balance is: \(balance).")
        addTransaction(transaction: transaction)
    }
    
    func topUpDeposit(with amount: Int) {
        balance += amount
        print("🟢 Top Up Account with amount: \(amount).\nCurrent balance is: \(balance).")
    }
    
    func topUpPhone(with amount: Int) {
        balance -= amount
        print("🟢 Top Up Phone with amount: \(amount).\nCurrent balance is: \(balance).")
    }
}

private extension TransactionModel {
    func addTransaction(transaction: Transaction) {
        transactions.append(transaction)
    }
}
