// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBszIDNr28jE6XultshTvKGpwICujZl7VE',
    appId: '1:314490303486:web:8ae72024ad0f291a1286af',
    messagingSenderId: '314490303486',
    projectId: 'posturt1-e256d',
    authDomain: 'posturt1-e256d.firebaseapp.com',
    storageBucket: 'posturt1-e256d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmBAvEk_y5oLZYrs7tNFy72XI-RgBGlkw',
    appId: '1:314490303486:android:0b00b93a1294c40b1286af',
    messagingSenderId: '314490303486',
    projectId: 'posturt1-e256d',
    storageBucket: 'posturt1-e256d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD20X3Af0WlPX5I8YBMnPcrhoJL1mf_Dhw',
    appId: '1:314490303486:ios:c4265cbade6294501286af',
    messagingSenderId: '314490303486',
    projectId: 'posturt1-e256d',
    storageBucket: 'posturt1-e256d.appspot.com',
    iosClientId: '314490303486-821vc5tioum8p0kj8o2eue9lpvrbk9c4.apps.googleusercontent.com',
    iosBundleId: 'com.example.authTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD20X3Af0WlPX5I8YBMnPcrhoJL1mf_Dhw',
    appId: '1:314490303486:ios:23d054757494e3c81286af',
    messagingSenderId: '314490303486',
    projectId: 'posturt1-e256d',
    storageBucket: 'posturt1-e256d.appspot.com',
    iosClientId: '314490303486-l9istq58ni34ht5fe27345lf34md1f06.apps.googleusercontent.com',
    iosBundleId: 'com.example.authTest.RunnerTests',
  );
}
