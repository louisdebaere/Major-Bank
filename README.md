# Security Challenge

Demo banking application

When signing up, there is an input validation weakness

### Incomplete solution

Limiting the amount of characters allowed for the data strings won't cut it.

This solution does not guarantee escaping.

An attacker can still insert extraneous characters and make JSONEncoder throw an error.

```    
guard inputText.count < 10 else {
    return nil
}
```
