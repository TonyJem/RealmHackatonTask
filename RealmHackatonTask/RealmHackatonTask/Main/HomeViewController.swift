import UIKit

class HomeViewController: UIViewController {
    
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    let currentBalance = 888
    
    //TODO: Currently not used:
    override func viewDidLoad() {
        super.viewDidLoad()
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
        case "Cash Withdrawal":
            destinationVC.title = "Cash Withdrawal"
        case "Top Up Deposit":
            destinationVC.title = "Top Up Deposit"
        case "Top Up Phone Account":
            destinationVC.title = "Top Up Phone Account"
        default:
            break
        }
        
        show(destinationVC, sender: nil)
    }
}
