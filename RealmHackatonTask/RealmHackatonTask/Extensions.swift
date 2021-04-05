import UIKit

extension String {
    func asCurrency() -> String {
        "\(__("currencySign")) \(self)"
    }
}
