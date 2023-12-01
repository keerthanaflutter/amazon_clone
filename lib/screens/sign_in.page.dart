//import 'dart:ffi';

import 'package:amazon_clone/resources/authendication_methods.dart';
import 'package:amazon_clone/screens/sign_uppage.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/util/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_feild_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScrren extends StatefulWidget {
  const SignInScrren({super.key});

  @override
  State<SignInScrren> createState() => _SignInScrrenState();
}

class _SignInScrrenState extends State<SignInScrren> {
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthenticationMethod authenticationMethod = AuthenticationMethod();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
    Emailcontroller.dispose();
    passwordcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Container(
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign-In",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 33),
                        ),
                        textFeildWidget(
                          title: "Email",
                          controller: Emailcontroller,
                          obscureText: false,
                          hintText: "Enter your email",
                        ),
                        textFeildWidget(
                          title: "Password",
                          controller: passwordcontroller,
                          obscureText: true,
                          hintText: "Enter your password",
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMianButton(
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.6, color: Colors.black),
                              ),
                              color: yellowColor,
                              isloading: isloading,
                              onpressed: () async {
                                setState(() {
                                  isloading = true;
                                });

                                
                                String output =
                                    await authenticationMethod.SigninScreen(
                                        email: Emailcontroller.text,
                                        password: passwordcontroller.text);

                                setState(() {
                                  isloading = false;
                                });

                                if (output == "success") {
                                  //function
                                } else {
                                  utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "New to amazon?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  CustomMianButton(
                      child: Text(
                        "create an Amazon account",
                        style: const TextStyle(letterSpacing: 0.6),
                      ),
                      color: Colors.grey[400]!,
                      isloading: false,
                      onpressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
