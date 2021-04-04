import UIKit

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhoneAccount
}

class ActionViewController: UIViewController {
 
    var type: TransactionType? {
        switch self.title {
        case __("cash_withdrawal_bar_title"):
            return .cashWithdrawal
        case __("top_up_deposit_bar_title"):
            return .topUpDeposit
        case __("top_up_phone_bar_title"):
            return .topUpPhoneAccount
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🟢 Bar Title is: \(String(describing: type))")
        
    }
}
