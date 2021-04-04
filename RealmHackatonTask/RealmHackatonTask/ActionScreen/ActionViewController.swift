import UIKit

enum TransactionType {
    case cashWithdrawal
    case topUpDeposit
    case topUpPhoneAccount
}

class ActionViewController: UIViewController {
    @IBOutlet private weak var decreaseByOneButton: UIButton!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var increaseByOneButton: UIButton!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private let model = Core.accountModel
    
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
        updateLabel()
        cancelButton.setTitle(__("as_cancel_button_title"), for: .normal)
    }
    
    @IBAction func decreaseByOneButtonDidTap(_ sender: Any) {
        model.reduceAccaount(by: 1)
        updateLabel()
    }
    
    @IBAction func increaseByOneButtonDidTap(_ sender: UIButton) {
        model.increaseAccount(by: 1)
        updateLabel()
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: Helpers
private extension ActionViewController {
    func updateLabel() {
        amountLabel.text = "$ \(model.balance)"
    }
}
