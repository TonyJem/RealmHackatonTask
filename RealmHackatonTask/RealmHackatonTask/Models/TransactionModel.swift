import UIKit

struct Operation {
    let date: String
    let operation: String
    let type: String
    let amount: Int
}

class OperationModel {
    
    var transactions:[Operation] = [Operation(date: "2020-03", operation: "Wthdrawal", type: "minus", amount: 205),
                                    Operation(date: "2020-07", operation: "Wthdrawal1", type: "minus", amount: 888),
                                    Operation(date: "2020-09", operation: "Wthdrawal2", type: "minus", amount: 999),
                                    Operation(date: "2020-10", operation: "Wthdrawal3", type: "minus", amount: 100)]
    
    func addTransaction() {
    }
    
    func sortTransactions() {
    }
}
