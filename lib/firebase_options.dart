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
    apiKey: 'AIzaSyBkyfgjpw4GaluWfH35hAwEH-v7urCBGks',
    appId: '1:600204088827:web:d6f231c1851c64aedee75e',
    messagingSenderId: '600204088827',
    projectId: 'grow-guard-f62d7',
    authDomain: 'grow-guard-f62d7.firebaseapp.com',
    storageBucket: 'grow-guard-f62d7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY6v_IWkPmYvruvi8n3eLmsY7mbWw2roU',
    appId: '1:600204088827:android:522cab165873ea18dee75e',
    messagingSenderId: '600204088827',
    projectId: 'grow-guard-f62d7',
    storageBucket: 'grow-guard-f62d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfFw3YDd3W8OlxC702Qclow8s5kZcILao',
    appId: '1:600204088827:ios:972ac56866250ae6dee75e',
    messagingSenderId: '600204088827',
    projectId: 'grow-guard-f62d7',
    storageBucket: 'grow-guard-f62d7.appspot.com',
    iosBundleId: 'com.example.growGuard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfFw3YDd3W8OlxC702Qclow8s5kZcILao',
    appId: '1:600204088827:ios:972ac56866250ae6dee75e',
    messagingSenderId: '600204088827',
    projectId: 'grow-guard-f62d7',
    storageBucket: 'grow-guard-f62d7.appspot.com',
    iosBundleId: 'com.example.growGuard',
  );
}
