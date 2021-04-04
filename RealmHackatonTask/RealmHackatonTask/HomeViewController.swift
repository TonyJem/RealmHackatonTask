import UIKit

class HomeViewController: UIViewController {
    
    private var actionViewController: UIViewController {
        actionStoryboard.instantiateViewController(identifier: "ActionViewController")
    }
    
    private lazy var actionStoryboard: UIStoryboard = {
        UIStoryboard(name: "ActionScreen", bundle: nil)
    }()
    
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
}

//MARK: -Helpers:
private extension HomeViewController {
    func proceedToActionView() {
        self.show(actionViewController, sender: nil)
    }
}
