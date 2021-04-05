import UIKit

class ActionViewController: UIViewController {
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var button11: DefaultAmountButton!
    @IBOutlet private weak var button12: DefaultAmountButton!
    @IBOutlet private weak var button13: DefaultAmountButton!
    @IBOutlet private weak var button14: DefaultAmountButton!
    @IBOutlet private weak var button21: DefaultAmountButton!
    @IBOutlet private weak var button22: DefaultAmountButton!
    @IBOutlet private weak var button23: DefaultAmountButton!
    @IBOutlet private weak var button24: DefaultAmountButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    private let subtractAndAddButtonStep = 1
    private let buttonValues = [5, 10, 15, 20, 50, 100, 200, 500]
    private let model = Core.accountModel
    
    private var selectedTransaction: Transaction?
    private var defaultButtons: [DefaultAmountButton] = []
    
    private var labelValue = 0 {
        didSet {
            amountLabel.text = String(labelValue).addCurrency()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelValue = model.balance
        defaultButtons = [button11, button12, button13, button14,
                          button21, button22, button23, button24]
        for (index, button) in defaultButtons.enumerated() {
            button.amount = buttonValues[index]
            button.setTitle(String(button.amount).addCurrency(), for: .normal)
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
        updateLabelValue(with: -subtractAndAddButtonStep)
    }
    
    @IBAction func addButtonDidTap(_ sender: UIButton) {
        updateLabelValue(with: subtractAndAddButtonStep)
    }
    
    @IBAction func defaultAmountButtonDidTap(_ sender: DefaultAmountButton) {
        defaultButtons.forEach { $0.backgroundColor = .clear }
        sender.backgroundColor = .purple
        updateLabelValue(with: sender.amount)
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
