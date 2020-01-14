import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: Interface Builder
    
    @IBOutlet private var userIDTextField: UITextField!
    @IBOutlet private var pinCodeTextField: UITextField!
    @IBOutlet private var continueButton: UIButton!
    
    @IBAction private func tapContinueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sign up", sender: self)
    }
    
    @IBAction private func signOutUnwind(_ sender: UIStoryboardSegue) {
        userIDTextField.text = nil
        pinCodeTextField.text = nil
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIDTextField.delegate = self
        pinCodeTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sign up":
            guard let destinationAccountVC = segue.destination as? AccountViewController else {
                return
            }
            destinationAccountVC.accountData = Data(json?.utf8 ?? "".utf8)
        default:
            break
        }
    }
    
    private var json: String? {
        guard let userID = userIDTextField.input,
            let pinCode = pinCodeTextField.input else {
            return nil
        }
        return """
        {
        "id": "\(userID)",
        "pin": "\(pinCode)",
        "accessLevel": "default"
        }
        """
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        continueButton.isEnabled = (json != nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField {
        case pinCodeTextField:
            if continueButton.isEnabled {
                performSegue(withIdentifier: "sign up", sender: self)
            }
        default:
            pinCodeTextField.becomeFirstResponder()
        }
        return true
    }
}

private extension UITextField {
    var input: String? {
        guard let inputText = text, !inputText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return nil
        }
        return inputText
    }
}

