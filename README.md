# Security Challenge

Demo banking application

## Fixed Vulnerability

Input from an untrusted source is possible via the user id and pin code fields.

An object of the Account class is instantiated with the user id and pin code strings as properties.

That instance is then serialized into JSON using the codable protocol provided by its class.

```    
let account = Account(userID: userIDTextField.text!, pinCode: pinCodeTextField.text!)
accountData = try? JSONEncoder().encode(account)
```

This way, the trusted implementation of JSONEncoder will handle encoding of properties into valid JSON syntax by whitelisting and escaping characters when necessary.
