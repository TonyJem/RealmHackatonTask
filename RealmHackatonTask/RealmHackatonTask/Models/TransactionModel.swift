import UIKit

struct Transaction {
    let date: String
    let operation: String
    let type: String
    let amount: Int
}

class TransactionModel {
    
    var transactions:[Transaction] = [Transaction(date: "2020-03", operation: "Wthdrawal", type: "minus", amount: 205),
                                    Transaction(date: "2020-07", operation: "Wthdrawal1", type: "minus", amount: 888),
                                    Transaction(date: "2020-09", operation: "Wthdrawal2", type: "minus", amount: 999),
                                    Transaction(date: "2020-10", operation: "Wthdrawal3", type: "minus", amount: 100)]
    
    func addTransaction() {
        
        
    }
    
    func sortTransactions() {
    }
}
