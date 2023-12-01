import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:amazon_clone/widgets/account_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/production_showcase_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              children: [
                const IntroductionWidgetAccountScreen(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMianButton(
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.orange,
                      isloading: false,
                      onpressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMianButton(
                      child: const Text(
                        "Sell",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.yellow,
                      isloading: false,
                      onpressed: () {}),
                ),
                ProductsShowcaseListView(
                    title: "Your Orders", children: testchildren),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                         child: Text("Order request", style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                    ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, Index) {
                        return ListTile(
                          title:const Text("Order: Black shoe", style: TextStyle(fontWeight: FontWeight.w600),), 
                          subtitle: const Text("Address: someones on the earth"),
                          trailing: IconButton(
                            onPressed: (){}, icon: const Icon(Icons.check),
                            ),
                            );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.000000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "hello ,",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                        text: "keerthi,",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
