# Firebase Snippets

This file contains all the firebase snippets for Flutter Framework.

---

## Auth Service

```dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:microactions/app/data/functions/errors.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GetStorage box = GetStorage();
  Rx<User> _user = Rx<User>();
  RxBool isLogged = false.obs;

  String get getUserEmail => _user.value?.email;
  String get getUserName => _user.value?.displayName;
  String get getUserId => _user.value?.uid;

  @override
  void onInit() async {
    _user.bindStream(_auth.authStateChanges());
    ever(isLogged, handleAuthChanged);
    _user.value = await getCurrentUser();
    isLogged.value = _user.value != null;
    onAuthChanged().listen((event) {
      print('Event: $event');
      isLogged.value = event != null;
      _user.value = event;
    });
    super.onInit();
  }

  handleAuthChanged(isLoggedIn) {
    if (isLoggedIn == false) {
      anonLogin();
    }
  }

  Stream<User> onAuthChanged() {
    return _auth.authStateChanges();
  }

  Future<User> getCurrentUser() async {
    User user = _auth.currentUser;
    return user;
  }

  Future anonLogin() async {
    try {
      var result = await _auth.signInAnonymously();
      isLogged.value = true;
      await box.write('uid', result.user.uid);
      FirebaseCrashlytics.instance.setUserIdentifier(result.user.uid);
    } catch (e) {
      Report().crash(title: 'Error on Login', error: e.toString());
    }
  }
}


```

---

## Dynamic Link Service

```dart
import 'package:get/get.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:microactions/app/data/functions/alert.dart';

class DynamicLinkService {
  static Future handleDynamicLinks() async {
    // Into foreground from dynamic link logic
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
        // handleDeepLink(dynamicLinkData, context, scaffoldKey);
        _handleDynamicLink(dynamicLinkData);
      },
      onError: (OnLinkErrorException e) async {
        showAlertDialog(
          title: 'ALERT_FAILED_TITLE'.tr,
          message: 'ALERT_FAILED_LABEL'.tr,
          messageText: 'ALERT_FAILED_LABEL'.tr,
          type: 'error',
        );
      },
    );

    // Get initial dynamic link if the app is started using the link
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDynamicLink(data);
  }

  static _handleDynamicLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      // Do something
    }
  }
}
```     
