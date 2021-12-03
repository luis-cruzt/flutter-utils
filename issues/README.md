## Common Solutions

This folder contains all the common solutions for the solutions appearing when developing apps.

# Flutter

Common solutions for flutter issues.

---

App stuck on hot restart or hot reload when developing.

Solution:
```bash
 Close app on simulator or real device.
 Close debug session and start it again.
```
---
App stuck on "Running xcode build" even if it has already finished.

Solution:

1. Stop build with Cmd + C
2. Open xcode
3. Build on xcode and wait till' it finishes.
4. Stop xcode build.
5. Run flutter run again (or start debug session).

---
Waiting for another flutter command to release the startup lock

Solution:
```
killall -9 dart
```

---
# iOS

If you are stuck with a transaction unfinished.

To unblock you from current state you can follow these steps

Find following method defined in InAppPurchasePlugin.m and replace the implementation:
```
- (void)handleTransactionsUpdated:(NSArray<SKPaymentTransaction *> *)transactions {
    // This will remove all old transactions regardless of states.
    for (SKPaymentTransaction *transaction in transactions) {
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    }
}
```
Launch your app on the test device one.

Restore the implementation of the above method:
```
- (void)handleTransactionsUpdated:(NSArray<SKPaymentTransaction *> *)transactions {
  NSMutableArray *maps = [NSMutableArray new];
  for (SKPaymentTransaction *transaction in transactions) {
    [maps addObject:[FIAObjectTranslator getMapFromSKPaymentTransaction:transaction]];
  }
  [self.callbackChannel invokeMethod:@"updatedTransactions" arguments:maps];
}
```
Add a new transaction and verify.

---

Failed to connect with mDNS, falling back to log scanning

1. End debug session
2. Run ``` flutter clean ```
3. Turn off/on wifi from device
4. Disconnect device from computer
5. Start debug session again.

---

Upload 1 missing dSYM required to process 1 crash

Get the dSYMs folder by following the next steps:

1. Open xcode
2. Window -> Organizer
3. Right click the app
4. Show in finder
5. Show package content

Solution:
```
Pods/Fabric/upload-symbols -gsp GoogleService-Info.plist -p ios /Users/luchocruz/Desktop/dSYMs
```
---
'Flutter/Flutter.h' file not found when flutter run on iOS

Solution:


1. Backup `ios/Runner` folder.

1. Delete the `ios` folder.

1. Run `flutter create (your project name)`. in the previous folder where you have your project(`cd users/user/"projects_folder"`)
(this will recreate your `ios` folder).

1. Paste your Runner backup in the `ios` folder (into the project).

1. Open `Runner.xcworkspace` (into `ios` folder) and there, check the Version, the Bundle ID, all the info.

1. (If do you Have Firebase, you have to copy and paste again the Google `Service-Info.Plist` into the `Runner` folder (Always through Xcode) (If do you do this manually, it doesn't work).



Finally, `flutter run` and should work!

If `flutter run` fails:


1. `cd ios`
1. `pod install`
1. `cd ..`
1. `flutter run`

--- 
GeneratedPluginRegistrant.m Module not found

```
rm ios/Podfile && flutter build ios
```

---

# Android

Local Auth is not working due to the following error:

```
PlatformException(no_fragment_activity, local_auth plugin requires activity to be a FragmentActivity., null)
```
Replace the following code in ```android/app/src/main/kotlin/com/example/package_name/MainActivity.kt```

```
package com.romerock.apps.utilities.xxx

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
```
