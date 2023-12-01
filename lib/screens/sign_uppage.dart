//import 'dart:ffi';

import 'dart:math';

import 'package:amazon_clone/resources/authendication_methods.dart';
import 'package:amazon_clone/screens/sign_in.page.dart';
import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/util/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_feild_widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthenticationMethod authenticationMethod = AuthenticationMethod();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    addresscontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
                  SizedBox(
                    height: screenSize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
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
                              "Sign-Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 33),
                            ),
                            textFeildWidget(
                              title: "Name",
                              controller: namecontroller,
                              obscureText: false,
                              hintText: "Enter your  ",
                            ),
                            textFeildWidget(
                              title: "Address",
                              controller: addresscontroller,
                              obscureText: false,
                              hintText: "Enter your email",
                            ),
                            textFeildWidget(
                              title: "Email",
                              controller: emailcontroller,
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
                                isloading: isLoading,
                                onpressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  String output =
                                      await authenticationMethod.SignUpScreen(
                                          name: namecontroller.text,
                                          address: addresscontroller.text,
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);

                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (output == "succes") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignInScrren()));
                                  } else {
                                    utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomMianButton(
                      child: Text(
                        "Back",
                        style: const TextStyle(letterSpacing: 0.6),
                      ),
                      color: Colors.grey[400]!,
                      isloading: false,
                      onpressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInScrren();
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
