
import 'package:evently_task/login/login.dart';
import 'package:evently_task/providers/language_provider.dart';
import 'package:evently_task/providers/theme_provider.dart';
import 'package:evently_task/screens/onboarding/onboardingScreen.dart';
import 'package:evently_task/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() async{
 // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBir_qd6FDZPLZnOQi6tN1C0TNadr3VbgY",
        appId: "1:132585537654:android:3df09b57eec8e74a5e9f57",
        messagingSenderId: "132585537654",
        //messagingSenderId: "",
        projectId: "evently-task"),
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
    // languageProvider = Provider.of(context);
    // themeProvider = Provider.of(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.mode,
      locale: Locale(languageProvider.currentLocale),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      home:OnboardingScreen(
          toggleTheme:themeProvider.toggleTheme,
          isDarkMode:themeProvider.mode==ThemeMode.dark),
    );
     // home: const MyHomePage(),

  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key,});// required this.title});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _isDarkMode = false;
//   void toggleTheme(bool value) {
//     setState(() {
//       _isDarkMode = value;
//     });
//   }


 //  @override
 //  Widget build(BuildContext context) {
 //    languageProvider = Provider.of(context);
 //    themeProvider = Provider.of(context);
 // return Scaffold(
 //      body:MaterialApp(
 //        theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
 //        darkTheme: AppTheme.darkTheme,
 //        debugShowCheckedModeBanner: false,
 //        initialRoute:'onboarding',//'login',
 //        routes: {
 //          'login':(_)=> Login(),
 //          "onboarding":(_) =>OnboardingScreen(
 //            toggleTheme: toggleTheme,
 //            isDarkMode: _isDarkMode,
 //          ),
 //          'eventDetails':(_)=> EventDetails(),
 //          'editEvent':(_)=> EditEvent(),
 //        },
 //      ) ,
 //
 //    );
 //  }
 //  @override
 //  Widget build(BuildContext context) {
 //    languageProvider = Provider.of(context);
 //    themeProvider = Provider.of(context);
 //
 //    return MaterialApp(
 //      debugShowCheckedModeBanner: false,
 //      theme: AppTheme.lightTheme,
 //      darkTheme: AppTheme.darkTheme,
 //      themeMode: themeProvider.mode,
 //      locale: Locale(languageProvider.currentLocale),
 //      localizationsDelegates: [
 //        AppLocalizations.delegate, // Add this line
 //        GlobalMaterialLocalizations.delegate,
 //        GlobalWidgetsLocalizations.delegate,
 //        GlobalCupertinoLocalizations.delegate,
 //      ],
 //      supportedLocales: [
 //        Locale('en'),
 //        Locale('ar'),
 //      ],
 //      home:OnboardingScreen(
 //          toggleTheme: toggleTheme,
 //          isDarkMode: _isDarkMode),
 //      routes: {
 //        'onboardingScreen':(_)=>OnboardingScreen(
 //            toggleTheme: toggleTheme,
 //            isDarkMode: _isDarkMode)
 //      },
 //    );
 //  }
//}
