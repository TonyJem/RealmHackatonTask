import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var operationLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(model: Operation) {
        dateLabel.text = model.date
        operationLabel.text = model.operation
        amountLabel.text = String(model.amount)
    }
}
