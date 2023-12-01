import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/screens/sign_in.page.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon clone",
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> User) {
            if (User.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (User.hasData) {
             
              return const Screenlayout();
              // return ResultScreen(query: "xdcfvbn");
            } else {
              return const SignInScrren();
            }
          }
          ),
    );
  }
}
