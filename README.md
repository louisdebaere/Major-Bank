# Security Challenge

Demo banking application

When signing up, there is an input validation weakness

## Vulnerability

Input from an untrusted source is possible via the user id and pin code fields.

A potential attacker can insert arbitrary attributes into a JSON entity because the input is not properly validated.

![Example](https://i.imgur.com/JYclYJm.png)

Because the JSON serialization is performed using string interpolation, the untrusted string data in the user id and pin code text fields will not be validated to escape JSON-related special characters. 

```    
var json: String? {

        ...
        
        return """
        {
        "id": "\(userID)",
        "pin": "\(pinCode)",
        "accessLevel": "default"
        }
        """
}
```
This would grant him administrator access instead of the default user access assigned through signup.
