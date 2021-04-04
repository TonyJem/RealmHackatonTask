import UIKit

class BalanceViewController: UIViewController {
    @IBOutlet private weak var balanceButton: UIButton!
    
    @IBAction func balanceButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
