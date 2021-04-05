import UIKit

extension String {
    func addCurrency() -> String {
        "\(__("currencySign")) \(self)"
    }
}
