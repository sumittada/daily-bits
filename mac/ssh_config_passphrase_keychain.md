Add the following to your `.ssh/config` file to ask Mac OSX uses Keychain to save your ssh key passphrase:

```
Host *
    UseKeychain yes
```
