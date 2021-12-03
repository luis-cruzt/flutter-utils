# CLI Commands
This files contains all the common used commands used on development.

## Prerequisites

- <a href="https://flutter.dev" target="_blank">Flutter</a>
- <a href="https://pub.dev/packages/get_cli" target="_blank">Get CLI</a>

## Outdated packages
If you need to check for outdated versions inside your project, you can run the following command: 

```dart pub outdated```

This will throw a list with all the packages that are outdated.

## Generate new page
To generate a new page inside the project you can use Get CLI, with the following command:

```get create page:yourpage```

## Generate project locales
To generate the project locales you need to first have the json files inside your project like ```assets/locales/*``` where ```*``` are all the json files that your project needs.

Then, run the following command:

```get generate locales assets/locales```

This will generate the locales that the CLI founds inside the ```locales``` folder.
