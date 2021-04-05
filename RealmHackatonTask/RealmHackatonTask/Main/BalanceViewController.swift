import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet private weak var balanceButton: UIButton!
    
    var balanceToDisplay: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentBalance = balanceToDisplay else {
            balanceButton.setTitle("", for: .normal)
            return
        }
        balanceButton.setTitle(String(currentBalance).addCurrency(), for: .normal)
    }
    
    @IBAction func balanceButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
