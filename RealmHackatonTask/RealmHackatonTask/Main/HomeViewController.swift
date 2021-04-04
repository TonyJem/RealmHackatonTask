import UIKit

class HomeViewController: UIViewController {
    
//    TODO: currentBalance is not used yet
    var currentBalance = 888
    
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

/* TODO:
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
