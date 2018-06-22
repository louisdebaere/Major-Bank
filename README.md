# Security Challenge

Demo banking application

When signing up, there is an input validation weakness

## Vulnerability

Input from an untrusted source is possible via the user id and pin fields.

A potential attacker can insert arbitrary attributes into a JSON entity because the input is not properly validated.

![Example](https://i.imgur.com/JYclYJm.png)

This would grant him administrator access instead of the default user access assigned through signup.
