import UIKit

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhoneAccount
}

class ActionViewController: UIViewController {
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private var type: TransactionType? {
        switch self.title {
        case __("as_cash_withdrawal_bar_title"):
            return .cashWithdrawal
        case __("as_top_up_deposit_bar_title"):
            return .topUpDeposit
        case __("as_top_up_phone_bar_title"):
            return .topUpPhoneAccount
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.setTitle(__("as_cancel_button_title"), for: .normal)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
