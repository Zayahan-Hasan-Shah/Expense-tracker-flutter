// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCJH3WEIobJCCUqt3quauJl-fjhBe3ouQU',
    appId: '1:930274799200:web:2843be6c0b1d5885031d05',
    messagingSenderId: '930274799200',
    projectId: 'expense-tracker-flutter-blocs',
    authDomain: 'expense-tracker-flutter-blocs.firebaseapp.com',
    storageBucket: 'expense-tracker-flutter-blocs.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsxIi7YyY21FJgyAZTS5p6p5z5RuXlj2c',
    appId: '1:930274799200:android:f4fd8bad69c63237031d05',
    messagingSenderId: '930274799200',
    projectId: 'expense-tracker-flutter-blocs',
    storageBucket: 'expense-tracker-flutter-blocs.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyO27Mz_rraE1R-xfWjp0jCBBfhz7lrXI',
    appId: '1:930274799200:ios:564fd93a50e89cf7031d05',
    messagingSenderId: '930274799200',
    projectId: 'expense-tracker-flutter-blocs',
    storageBucket: 'expense-tracker-flutter-blocs.firebasestorage.app',
    iosBundleId: 'com.example.expenseTrackerFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyO27Mz_rraE1R-xfWjp0jCBBfhz7lrXI',
    appId: '1:930274799200:ios:564fd93a50e89cf7031d05',
    messagingSenderId: '930274799200',
    projectId: 'expense-tracker-flutter-blocs',
    storageBucket: 'expense-tracker-flutter-blocs.firebasestorage.app',
    iosBundleId: 'com.example.expenseTrackerFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJH3WEIobJCCUqt3quauJl-fjhBe3ouQU',
    appId: '1:930274799200:web:61e02230769eed05031d05',
    messagingSenderId: '930274799200',
    projectId: 'expense-tracker-flutter-blocs',
    authDomain: 'expense-tracker-flutter-blocs.firebaseapp.com',
    storageBucket: 'expense-tracker-flutter-blocs.firebasestorage.app',
  );
}
