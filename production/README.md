# Production

This folder contains all the resources for releasing to production.

## Release Mode
To run diferent environments inside any Romerock app, every flutter app comes with a file named ```env.dart``` inside ```app/data/utils``` folder which comes with a pre-configured class to be used across the app.

This way we avoid using flavors inside flutter apps.

To run different environments we just need to run the following command:<br>
```flutter run --dart-define=ENV=SOME_VALUE```

> **_NOTE:_**  You can see that we define the variable ENV which is the variable that comes inside the ```env.dart``` mentioned before.


So for example, if we need to compile the Huawei version run the following command:<br>
```flutter run --dart-define=ENV=huawei```

> **_NOTE:_**  If you do not specify the environment variable it compiles the Google Version.

**This section does not apply for iOS**

## Translates

Common snippets for using on the App Store Connect and Google Play Console.

### Bug Fixes
```
<en-US>
Bug Fixes
</en-US>
<de-DE>
Fehlerbehebung
</de-DE>
<en-AU>
Bug Fixes
</en-AU>
<en-CA>
Bug Fixes
</en-CA>
<en-GB>
Bug Fixes
</en-GB>
<en-IN>
Bug Fixes
</en-IN>
<en-SG>
Bug Fixes
</en-SG>
<en-ZA>
Bug Fixes
</en-ZA>
<es-419>
Corrección de errores
</es-419>
<es-ES>
Corrección de errores
</es-ES>
<es-US>
Corrección de errores
</es-US>
<fr-CA>
Corrections de bogues
</fr-CA>
<fr-FR>
Corrections de bogues
</fr-FR>
<it-IT>
Correzioni di bug
</it-IT>
<ja-JP>
バグの修正
</ja-JP>
<pt-BR>
Correções de bugs
</pt-BR>
<pt-PT>
Correções de bugs
</pt-PT>
<ru-RU>
Исправление ошибок
</ru-RU>
```
