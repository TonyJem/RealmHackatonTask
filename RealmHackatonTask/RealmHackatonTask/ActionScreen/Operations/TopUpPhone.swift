import UIKit

class TopUpPhone: Operation {
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.transactionModel.topUpPhone(with: selectedAmount)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nTopup Phone Account"
    }
    
    override func errorMessage() -> String {
        return "Can't topup phone with \(selectedAmount) amount.\nThere are only \(String(Core.transactionModel.balance).asCurrency()) are available on balance now!"
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently topedup phone account with: \(String(selectedAmount).asCurrency()) amount."
    }
}
