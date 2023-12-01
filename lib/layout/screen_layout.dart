import 'package:amazon_clone/util/color_themes.dart';
import 'package:amazon_clone/util/constance.dart';
import 'package:flutter/material.dart';

class Screenlayout extends StatefulWidget {
  const Screenlayout({super.key});

  @override
  State<Screenlayout> createState() => _ScreeblayoutState();
}

class _ScreeblayoutState extends State<Screenlayout> {
  PageController pageController = PageController();
  int currentpage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

   changepage(int page){
    
     pageController.jumpToPage(page);
              setState(() {
                currentpage = page;
              });

   }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: pageController,
             children: screens ,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[400]!, width: 1))
            ),
            child: TabBar(
              indicator: const BoxDecoration(
                border: Border(top: BorderSide(color: activeCyanColor, width: 4,),)
              ),
                onTap: changepage,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Icon(Icons.home_outlined, color:currentpage==0? activeCyanColor : Colors.black , ),
                  ),
                  Tab(
                    child: Icon(Icons.account_circle_outlined,  color:currentpage==1? activeCyanColor : Colors.black ,),
                  ),
                  Tab(
                    child: Icon(Icons.shopping_cart_outlined,  color:currentpage==2? activeCyanColor : Colors.black ,),
                  ),
                  Tab(
                    child: Icon(Icons.menu,  color:currentpage==3? activeCyanColor : Colors.black ,),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
