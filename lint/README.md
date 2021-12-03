# Pedantic Lint

The [pedantic](https://pub.dev/packages/pedantic) package uses Dart static analysis used internally at Google.

Using this linter on RomeRock's projects, prevents [Spaghetti code](https://en.wikipedia.org/wiki/Spaghetti_code) and standarizes the code.

Linting improves readability, removes silly errors before execution and code review

## Quick Snippets
#### Auto-Fix everything in VSCode Workspace
```
dartfix --pedantic lib/ --overwrite
```
