import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var showBalanceButton: UIButton!
    @IBOutlet private weak var showTransactionsButton: UIButton!
    @IBOutlet private weak var cashWithdrawalButton: UIButton!
    @IBOutlet private weak var topUpDepositButton: UIButton!
    @IBOutlet private weak var topUpPhoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBalanceButton.setTitle(__("hs_show_balance_button_title"), for: .normal)
        showTransactionsButton.setTitle(__("hs_show_transactions_button_title"), for: .normal)
        cashWithdrawalButton.setTitle(__("hs_cash_withdrawal_button_title"), for: .normal)
        topUpDepositButton.setTitle(__("hs_top_up_deposit_button_title"), for: .normal)
        topUpPhoneButton.setTitle(__("hs_top_up_phone_button_title"), for: .normal)
    }
    
    //MARK: -IBActions:
    @IBAction func cashWithdrawalButtonDidTap(_ sender: UIButton) {
        proceedToActionView(sender: sender)
    }
    
    @IBAction func topUpDepositButtonDidTap(_ sender: UIButton) {
        proceedToActionView(sender: sender)
    }
    
    @IBAction func topUpPhoneAccountButtonDidTap(_ sender: UIButton) {
        proceedToActionView(sender: sender)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBalance" {
            if let destinationVC = segue.destination as? BalanceViewController {
                destinationVC.balanceToDisplay = Core.transactionModel.balance
            }
        }
    }
}

//MARK: -Helpers:
private extension HomeViewController {
    func proceedToActionView(sender: UIButton) {
        let actionStoryboard = UIStoryboard(name: "ActionScreen", bundle: nil)
        let destinationVC = actionStoryboard.instantiateViewController(identifier: "ActionViewController")
        
        guard let buttonTitle = sender.currentTitle else { return }
        switch buttonTitle {
        case __("hs_cash_withdrawal_button_title"):
            destinationVC.title = __("as_cash_withdrawal_bar_title")
        case __("hs_top_up_deposit_button_title"):
            destinationVC.title = __("as_top_up_deposit_bar_title")
        case __("hs_top_up_phone_button_title"):
            destinationVC.title = __("as_top_up_phone_bar_title")
        default:
            break
        }
        
        show(destinationVC, sender: nil)
    }
}
