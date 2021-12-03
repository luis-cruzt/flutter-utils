
# Common Snippets

This file contains all useful files for coding in dart.

---

## Required named parameters (Deprecated).

> **_NOTE:_**  This is now deprecated on Flutter sound null safety, use required instead of @required.

```
import 'package:meta/meta.dart';

void flipFlags({@required bool on, @required bool up, @required bool hidden}) {
  // ...
}
```
