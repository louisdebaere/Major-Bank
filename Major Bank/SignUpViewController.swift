import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var pinCodeTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func tapContinueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sign up", sender: self)
    }
    @IBAction func signOutUnwind(_ sender: UIStoryboardSegue) {
        userIDTextField.text = nil
        pinCodeTextField.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIDTextField.delegate = self
        pinCodeTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sign up":
            guard let destinationAccountVC = segue.destination
                as? AccountViewController else {
                return
            }
            let account = Account(
                userID: userIDTextField.text!, pinCode: pinCodeTextField.text!
            )
            destinationAccountVC.accountData =
                try? JSONEncoder().encode(account)
        default:
            break
        }
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
    
    var json: String? {
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

extension UITextField {
    var input: String? {
        guard let inputText =
            text, !inputText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return nil
        }
        return inputText
    }
}

