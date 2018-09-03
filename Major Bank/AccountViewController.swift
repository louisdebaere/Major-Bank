import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var accessLevelLabel: UILabel!
    
    var accountData: Data!
    
    var account: Account?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        if let account =
            try? JSONDecoder().decode(Account.self, from: accountData) {
            navigationItem.title = "Welcome, \(account.id)!"
            accessLevelLabel.text =
            "You have \(account.accessLevel) privileges."
        } else {
            navigationItem.title = "Error"
            accessLevelLabel.text = "Failed to decode JSON"
        }
    }
}

struct Account: Codable {
    let id: String
    let pin: String
    let accessLevel: AccessLevel
}

enum AccessLevel: String, Codable {
    case `default`, admin
}

extension AccessLevel: CustomStringConvertible {
    var description: String {
        switch self {
        case .admin:
            return "administrator"
        case .default:
            return "regular"
        }
    }
}

