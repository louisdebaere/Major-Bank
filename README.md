# Security Challenge

Demo banking application

When signing up, there is an input validation weakness

## Incorrect Fix

Hardcoding the convenient outcome doesn't change a thing.

```    
-            accessLevelLabel.text = "You have \(account.accessLevel) privileges."
+            accessLevelLabel.text = "You have \(AccessLevel.default) privileges."
```

Attack the root of the problem. You will learn more this way!
Hint: Try a different way of serializing the JSON data string.
