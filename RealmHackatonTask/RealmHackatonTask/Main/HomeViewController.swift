import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var showBalanceButton: UIButton!
    @IBOutlet private weak var showTransactionsButton: UIButton!
    @IBOutlet private weak var cashWithdrawalButton: UIButton!
    @IBOutlet private weak var topUpDepositButton: UIButton!
    @IBOutlet private weak var topUpPhoneButton: UIButton!
    
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    let currentBalance = 888
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBalanceButton.setTitle(__("show_balance_button_title"), for: .normal)
        showTransactionsButton.setTitle(__("show_transactions_button_title"), for: .normal)
        cashWithdrawalButton.setTitle(__("cash_withdrawal_button_title"), for: .normal)
        topUpDepositButton.setTitle(__("top_up_deposit_button_title"), for: .normal)
        topUpPhoneButton.setTitle(__("top_up_phone_button_title"), for: .normal)
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
                destinationVC.balanceToDisplay = currentBalance
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
        case __("cash_withdrawal_button_title"):
            destinationVC.title = __("cash_withdrawal_bar_title")
        case __("top_up_deposit_button_title"):
            destinationVC.title = __("top_up_deposit_bar_title")
        case __("top_up_phone_button_title"):
            destinationVC.title = __("top_up_phone_bar_title")
        default:
            break
        }
        
        show(destinationVC, sender: nil)
    }
}
