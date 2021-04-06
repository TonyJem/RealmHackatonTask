import UIKit

class TopUpDeposit: Operation {
    override func onActionButtonTap(selectedAmount: Int) {
        super.onActionButtonTap(selectedAmount: selectedAmount)
        
        if !hasError() {
            Core.transactionModel.topUpDeposit(with: selectedAmount)
        }
    }
    
    override func alertTitle() -> String {
        return "Selected transaction is:\nTopup Deposit"
    }
    
    override func hasError() -> Bool {
        return (selectedAmount + Core.transactionModel.balance) > maxLimitForAmount
    }
    
    override func errorMessage() -> String {
        return "With \(selectedAmount) amount your balance will exceed the allowed maximum: \(maxLimitForAmount). Maximal topup amount can be: \(maxLimitForAmount - Core.transactionModel.balance) only."
    }
    
    override func successMessage() -> String {
        return "All Ok! Your recently toped up your deposit with \(String(selectedAmount).asCurrency()). Balance now is \(Core.transactionModel.balance). "
    }
}
