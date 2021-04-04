import UIKit

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhoneAccount
}

class ActionViewController: UIViewController {
 
    var type: TransactionType? {
        switch self.title {
        case "Cash Withdrawal":
            return .cashWithdrawal
        case "Top Up Deposit":
            return .topUpDeposit
        case "Top Up Phone Account":
            return .topUpPhoneAccount
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
