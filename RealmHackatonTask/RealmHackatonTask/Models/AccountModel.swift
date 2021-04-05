import Foundation

class AccountModel {
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    var balance = 888
    
    func withdraw(_ amount: Int) {
        balance -= amount
        print("🟢 Withdraw amount: \(amount).\nCurrent balance is: \(balance).")
    }
    
    func topUpAccount(with amount: Int) {
        balance += amount
        print("🟢 Top Up Account with amount: \(amount).\nCurrent balance is: \(balance).")
    }
    
    func topUpPhone(with amount: Int) {
        balance -= amount
        print("🟢 Top Up Phone with amount: \(amount).\nCurrent balance is: \(balance).")
    }
}
