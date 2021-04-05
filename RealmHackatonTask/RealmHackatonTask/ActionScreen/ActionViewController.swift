import UIKit

class ActionViewController: UIViewController {
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var defaultAmountButton11: UIButton!
    @IBOutlet private weak var defaultAmountButton12: UIButton!
    @IBOutlet private weak var defaultAmountButton13: UIButton!
    @IBOutlet private weak var defaultAmountButton14: UIButton!
    @IBOutlet private weak var defaultAmountButton21: UIButton!
    @IBOutlet private weak var defaultAmountButton22: UIButton!
    @IBOutlet private weak var defaultAmountButton23: UIButton!
    @IBOutlet private weak var defaultAmountButton24: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private let buttonValues = [5, 10, 15, 20, 50, 100, 200, 500]
    private let model = Core.accountModel
    
    private var selectedTransaction: Transaction?
    private var defaultButtons: [UIButton] = []
    
    private var labelValue = 0 {
        didSet {
            amountLabel.text = String(labelValue).addCurrency()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelValue = model.balance
        defaultButtons = [defaultAmountButton11,
                          defaultAmountButton12,
                          defaultAmountButton13,
                          defaultAmountButton14,
                          defaultAmountButton21,
                          defaultAmountButton22,
                          defaultAmountButton23,
                          defaultAmountButton24]
        for (index, button) in defaultButtons.enumerated() {
            let value = buttonValues[index]
            button.setTitle(String(value).addCurrency(), for: .normal)
        }
        cancelButton.setTitle(__("as_cancel_button_title"), for: .normal)
        
        switch self.title {
        case __("as_cash_withdrawal_bar_title"):
            selectedTransaction = Withdrawal(action: Action(transactionType: .cashWithdrawal),
                                             actionButtonTitle: __("as_withdraw_button_title"))
        case __("as_top_up_deposit_bar_title"):
            selectedTransaction = TopUpDeposit(action: Action(transactionType: .topUpDeposit),
                                             actionButtonTitle: __("as_top_up_deposit_button_title"))
        case __("as_top_up_phone_bar_title"):
            selectedTransaction = TopUpPhone(action: Action(transactionType: .topUpPhoneAccount),
                                             actionButtonTitle: __("as_top_up_phone_button_title"))
        default:
            break
        }
        
        actionButton.setTitle(selectedTransaction?.actionButtonTitle, for: .normal)
    }
    
    @IBAction func subtractButtonDidTap(_ sender: UIButton) {
        updateLabelValue(with: -1)
    }
    
    @IBAction func addButtonDidTap(_ sender: UIButton) {
        updateLabelValue(with: 1)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Helpers
private extension ActionViewController {
    func updateLabelValue(with value: Int) {
        labelValue += value
    }
}
