import UIKit

struct Core {
    static let transactionModel = TransactionModel()
}

struct Transaction {
    let date: String
    let operation: String
    let type: String
    let amount: Int
}

class TransactionModel {
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    var balance = 10
    
    var transactions:[Transaction] = [Transaction(date: "2020-03", operation: "Wthdrawal", type: "minus", amount: 205),
                                    Transaction(date: "2020-07", operation: "Wthdrawal1", type: "minus", amount: 888),
                                    Transaction(date: "2020-09", operation: "Wthdrawal2", type: "minus", amount: 999),
                                    Transaction(date: "2020-10", operation: "Wthdrawal3", type: "minus", amount: 100)]
    
    func withdraw(_ amount: Int) {
        balance -= amount
        print("🟢 Withdraw amount: \(amount).\nCurrent balance is: \(balance).")
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
