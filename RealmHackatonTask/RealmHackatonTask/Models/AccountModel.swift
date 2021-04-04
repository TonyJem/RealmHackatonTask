import Foundation

class AccountModel {
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    var balance = 888

    func increaseAccount(by value: Int) {
        balance += value
    }
    
    func reduceAccaount(by value: Int) {
        balance -= value
    }
}
