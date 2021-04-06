import UIKit

class TransactionsListViewContoller: UIViewController {
    
    @IBOutlet private weak var transactionsTableView: UITableView!
    
    private let model = OperationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.dataSource = self
        
        transactionsTableView.register(UINib(nibName: String(describing: TransactionCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: TransactionCell.self))
        transactionsTableView.tableFooterView = UIView()
    }
}

extension TransactionsListViewContoller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = transactionsTableView.dequeueReusableCell(withIdentifier: String(describing: TransactionCell.self), for: indexPath) as? TransactionCell else { return UITableViewCell() }
        cell.fill(model: model.transactions[indexPath.row])
        return cell
    }
}
