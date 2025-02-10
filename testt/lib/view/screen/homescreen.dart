import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testt/controller/favorite_controlar.dart';
import 'package:testt/controller/home_screen%20_controlar.dart';
import 'package:testt/core/constant/color1.dart';
import 'package:testt/core/constant/imageassets.dart';
import 'package:testt/view/screen/settings_page.dart';
import 'package:testt/view/widget/home/custombuttonappbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControlarImp());
    // ignore: unused_local_variable
    FavoriteControllerimp cont=Get.put(FavoriteControllerimp());
    return GetBuilder<HomeScreenControlarImp>(builder: (controlar) {
      return Scaffold(
        
        floatingActionButton: FloatingActionButton(
          elevation: 8,
            backgroundColor: ColorApp.logo,
            onPressed: () {controlar.gotocart();},
            child: Icon(Icons.shopping_cart_outlined,color: ColorApp.white,)),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        drawerScrimColor: ColorApp.logoshadw,

        drawer: Drawer(child:SettingsPage() ,),
        appBar: AppBar(
          iconTheme: IconThemeData(size: 30),
          toolbarHeight: 80,
          backgroundColor: ColorApp.logo,
          shadowColor: ColorApp.white,
          elevation: 5,
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Shop",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.bold,
                    color: ColorApp.white),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Click & Buy',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            Container(
              height: 60,
              width: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    ImageAssets.logoImagewithoutname,
                  )),
                  shape: BoxShape.circle),
            )
          ],
        ),
        
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(vertical:0,horizontal: 0),
            shadowColor: ColorApp.black,
            elevation: 300,
            color: ColorApp.logo,
            shape: CircularNotchedRectangle(),
            notchMargin: 18,
            height: 60,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ...List.generate(controlar.listpage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : Expanded(
                      flex: 2,
                      child: Custombuttonappbar(
                        
                          // text: controlar.titel[i],
                          icon: controlar.icons[i],
                          onPressed: () {
                            // setState(() {
                            // cont.makeitemlist();
                            // cont.getuserdata();
                            // });

                            controlar.changrpage(i);
                          },
                          activr: controlar.currentpage == i ? true : false,
                        ),
                    );
              })
            ])),
        body: controlar.listpage.elementAt(controlar.currentpage),
      );
    });
  }
}
