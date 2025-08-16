
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
        apiKey: "AIzaSyCVCT9dQJ16Ag2Lr93rqr8P_s_FzA-wiQo",
        appId: "1:688736515862:android:6a8da516be3a249a278237",
        messagingSenderId: "688736515862",//"132585537654",
        //messagingSenderId: "",
        projectId: "eventlytask"),
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
