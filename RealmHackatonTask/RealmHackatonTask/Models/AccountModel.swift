import Foundation

class AccountModel {
//   TODO: temporary value provided as constant, need to replace with value from DB
    var balance = 0

    func increaseAccount(by value: Int) {
        balance += value
    }
    
    func reduceAccaount(by value: Int) {
        balance -= value
    }
}
