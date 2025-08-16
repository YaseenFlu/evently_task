
import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_task/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../data/firestore_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/user_dm.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/app_assets.dart';
import '../utils/app_routes.dart';
import '../utils/dialog_utils.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AppLocalizations l10n;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 24,),
                buildAppLogo(context),
                SizedBox(height: 24,),
                buildEmailTextField(),
                SizedBox(height: 16,),
                buildPasswordTextField(),
                SizedBox(height: 16,),
                buildForgetPasswordText(context),
                SizedBox(height: 24),
                buildLoginButton(),
                SizedBox(height: 24),
                buildSignUpText(),
                SizedBox(height: 24),
                buildOrRow(),
                SizedBox(height: 24),
                buildGoogleLogin(),
                SizedBox(height: 24),
                buildLanguageToggle(),
                SizedBox(height: 24),
                buildThemeToggle()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppLogo(BuildContext context) => Image.asset(
        AppAssets.appVerticalLogo,
        height: MediaQuery.of(context).size.height * 0.2,
      );

  buildEmailTextField() => Container(
        child: CustomTextField(
          hint: l10n.emailHint,
          prefixIcon: AppSvg.icEmail,
          controller: emailController,
        ),
      );

  buildPasswordTextField() => Container(
        child: CustomTextField(
          hint: l10n.passwordHint,
          prefixIcon: AppSvg.icPassword,
          isPassword: true,
          controller: passwordController,
        ),
      );

  buildSignUpText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.dontHaveAccount,
              style: Theme.of(context).textTheme.labelSmall),
          InkWell(
            onTap: () {
              Navigator.push(context, AppRoutes.register);
            },
            child: Text(l10n.createAccount,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline)),
          ),
        ],
      );

  buildForgetPasswordText(BuildContext context) => Container(
        width: double.infinity,
        child: Text(
          l10n.forgetPassword,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline),
        ),
      );

  buildLoginButton() => CustomButton(
      text: l10n.loginButton,
      onClick: () async {
        showLoading(context);
        try {
          var userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
          UserDM.currentUser =await getFromUserFirestore(userCredential.user!.uid);
          Navigator.pop(context);

          ///Hide loadingx
          Navigator.pushReplacement(context,AppRoutes.eventDetails);// 'onboardingScreen' as Route<Object?>);
          //Navigator.pushReplacement(context, AppRoutes.login);
        } on FirebaseAuthException catch (e) {
          var message =
              e.message ?? "Something went wrong, Please try again later!";
          Navigator.pop(context);

          ///Hide loading
          showMessage(context, content: message, posButtonTitle: "ok");
        }
      });

  buildOrRow() => Row(
        children: [
          Expanded(
              child: Divider(
            indent: 24,
            endIndent: 24,
          )),
          Text(l10n.orText, style: Theme.of(context).textTheme.labelMedium),
          Expanded(
              child: Divider(
            indent: 24,
            endIndent: 24,
          ))
        ],
      );

  buildGoogleLogin() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade400),
      ),
    ),
    onPressed: () async {
      final userCredential = await signInWithGoogle();
      if (userCredential != null) {
        User? user = userCredential.user;

        showMessage(context, content: "Signed in as ${user?.displayName}",
          posButtonTitle: "OK",
          onPosButtonClick: () {
            Navigator.pushReplacement(context, AppRoutes.eventDetails);
          },
        );
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.iconGoogle, height: 24, width: 24),
        const SizedBox(width: 12),
        Text(
          l10n.loginWithGoogle,
          style: const TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  Future<UserCredential?> signInWithGoogle() async {
    try {
      showLoading(context);
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        Navigator.pop(context);
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      Navigator.pop(context);
      return userCredential;
    } catch (e) {
      Navigator.pop(context);
      showMessage(
        context,
        content: "Google Sign-In failed. Please try again.",
        posButtonTitle: "OK",
      );
      debugPrint("Google Sign-In error: $e");
      return null;
    }
  }

  late LanguageProvider languageProvider;

  late ThemeProvider themeProvider;

  buildLanguageToggle() => AnimatedToggleSwitch<String>.dual(
    current: languageProvider.currentLocale,
    iconBuilder: (language) =>
        Image.asset(language == "ar" ? AppAssets.icEg : AppAssets.icUsa),
    first: "ar",
    second: "en",
    onChanged: (language) {
      languageProvider.changeLanguage(language);
    },
  );

  buildThemeToggle() => AnimatedToggleSwitch<ThemeMode>.dual(
    current: themeProvider.mode,
    iconBuilder: (mode) =>
        Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
    first: ThemeMode.light,
    second: ThemeMode.dark,
    onChanged: (mode) {
      themeProvider.changeMode(mode);
    },
  );




}
