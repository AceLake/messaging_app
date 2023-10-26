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
    apiKey: 'AIzaSyBljV0ExCqx9s--161K4RVqlQcEfyU5ebk',
    appId: '1:591701198356:web:f57a7b45395e3273d04901',
    messagingSenderId: '591701198356',
    projectId: 'chatapp-33a0b',
    authDomain: 'chatapp-33a0b.firebaseapp.com',
    storageBucket: 'chatapp-33a0b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3RiBNja_acijeNX5RJiJ9nJznhDKNI7o',
    appId: '1:591701198356:android:5f8300383270967fd04901',
    messagingSenderId: '591701198356',
    projectId: 'chatapp-33a0b',
    storageBucket: 'chatapp-33a0b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtKHiuds-i2nYKf-q3PFUVZA50jcERDCo',
    appId: '1:591701198356:ios:0176d446b34d5289d04901',
    messagingSenderId: '591701198356',
    projectId: 'chatapp-33a0b',
    storageBucket: 'chatapp-33a0b.appspot.com',
    iosBundleId: 'com.example.messagingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtKHiuds-i2nYKf-q3PFUVZA50jcERDCo',
    appId: '1:591701198356:ios:2dc895a0589fd672d04901',
    messagingSenderId: '591701198356',
    projectId: 'chatapp-33a0b',
    storageBucket: 'chatapp-33a0b.appspot.com',
    iosBundleId: 'com.example.messagingApp.RunnerTests',
  );
}
