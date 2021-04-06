import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var operationLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(model: Transaction) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        dateLabel.text = dateFormatter.string(from: model.date)
        
        operationLabel.text = model.description
        amountLabel.text = String(model.amount)
    }
}
