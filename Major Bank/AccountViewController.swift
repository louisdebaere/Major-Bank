import UIKit

final class AccountViewController: UIViewController {
    
    @IBOutlet private var accessLevelLabel: UILabel!
    
    var accountData: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        guard let account = try? JSONDecoder().decode(Account.self, from: accountData) else {
            navigationItem.title = "Error"
            accessLevelLabel.text = "Failed to decode JSON"
            return
        }
        navigationItem.title = "Welcome, \(account.id)!"
        accessLevelLabel.text = "You have \(account.accessLevel) privileges."
    }
}

struct Account: Codable {
    let id: String
    let pin: String
    let accessLevel: AccessLevel
    
    enum AccessLevel: String, Codable {
        case `default`, admin
    }
}

extension Account.AccessLevel: CustomStringConvertible {
    var description: String {
        switch self {
        case .admin:
            return "administrator"
        case .default:
            return "regular"
        }
    }
}

