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
    private var selectedAmount = 0 {
        didSet {
            amountLabel.text = String(selectedAmount).asCurrency()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = String(selectedAmount).asCurrency()
        defaultButtons = [button11, button12, button13, button14,
                          button21, button22, button23, button24]
        for (index, button) in defaultButtons.enumerated() {
            button.amount = buttonValues[index]
            button.setTitle(String(button.amount).asCurrency(), for: .normal)
        }
        cancelButton.setTitle(__("as_cancel_button_title"), for: .normal)
        
        switch self.title {
        case __("as_cash_withdrawal_bar_title"):
            selectedTransaction = CashWithdrawal(action: Action(transactionType: .cashWithdrawal),
                                             actionButtonTitle: __("as_withdraw_button_title"))
        case __("as_top_up_deposit_bar_title"):
            selectedTransaction = TopUpDeposit(action: Action(transactionType: .topUpDeposit),
                                             actionButtonTitle: __("as_top_up_deposit_button_title"))
        case __("as_top_up_phone_bar_title"):
            selectedTransaction = TopUpPhone(action: Action(transactionType: .topUpPhone),
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
    
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        showConfirmTransactionAlert()
    }
    
}

//MARK: - Helpers
private extension ActionViewController {
    func updateLabelValue(with value: Int) {
        selectedAmount += value
    }
    
    func showConfirmTransactionAlert() {
        guard let transaction =  selectedTransaction else { return }
        let alert = UIAlertController(title: transaction.transactionAlertTitle(),
                                      message: "Please confirm or cancel this transaction. Thank You!",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
            transaction.onActionButtonTap(selectedAmount: selectedAmount)
            if transaction.hasError() {
                showErrorAlert(with: transaction.errorMessage())
            } else {
                showSuccessAlert(with: transaction.successMessage())
            }
        }
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        alert.addAction(cancelAlertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Transaction Error!",
                                      message: message,
                                      preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAlertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showSuccessAlert(with message: String) {
        let alert = UIAlertController(title: "Transaction Success!",
                                      message: message,
                                      preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAlertAction)
        present(alert, animated: true, completion: nil)
    }
}
