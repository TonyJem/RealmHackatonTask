import UIKit

class HomeViewController: UIViewController {
    
    //TODO: Currently is set as Constant, need to Replace with value comming from DB:
    let currentBalance = 888
    
    private var actionViewController: UIViewController {
        actionStoryboard.instantiateViewController(identifier: "ActionViewController")
    }
    
    private lazy var actionStoryboard: UIStoryboard = {
        UIStoryboard(name: "ActionScreen", bundle: nil)
    }()
    
    //TODO: Currently not used:
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: -IBActions:
    @IBAction func cashWithdrawalButtonDidTap(_ sender: UIButton) {
        proceedToActionView()
    }
    
    @IBAction func topUpDepositButtonDidTap(_ sender: UIButton) {
        proceedToActionView()
    }
    
    @IBAction func topUpPhoneAccountButtonDidTap(_ sender: UIButton) {
        proceedToActionView()
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
    func proceedToActionView() {
        self.show(actionViewController, sender: nil)
    }
}
