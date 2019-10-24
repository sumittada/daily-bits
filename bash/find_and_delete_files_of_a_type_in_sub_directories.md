### To find files with given extension in a directory and all its sub-directories

```find . -type f -name "*.pyc"```

### To delete all the found files

``` find . -type f -name "*.pyc" -print0 | xargs -0 -Iarg rm arg --option```
