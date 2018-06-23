# Security Challenge

Demo banking application

When signing up, there is an input validation weakness

## Vulnerability

Input from an untrusted source is possible via the user id AND pin code fields.

Malicious JSON injection is still possible from the other text field.

Escaping the " character is a good start!

Although there is a better way: whitelisting what is allowed gives for a surefire way to validate input data.

```    
@IBAction func tapContinueButton(_ sender: UIButton) {
    if !userIDTextField.text!.contains("\"") {
        performSegue(withIdentifier: "sign up", sender: self)
    }
}
```
This late check is also confusing, since there is no feedback to the user signaling what he did wrong.
