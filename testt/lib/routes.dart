
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testt/core/constant/rout.dart';
import 'package:testt/core/middlware/mymiddlware.dart';
import 'package:testt/view/screen/cart.dart';
import 'package:testt/view/screen/ditaels.dart';

import 'package:testt/view/screen/auth/forgetpass/forgetpassword.dart';
import 'package:testt/view/screen/homescreen.dart';
import 'package:testt/view/screen/auth/login.dart';
import 'package:testt/view/screen/auth/onbording.dart';
import 'package:testt/view/screen/auth/forgetpass/resetpassword.dart';
import 'package:testt/view/screen/auth/forgetpass/success.dart';
import 'package:testt/view/screen/auth/forgetpass/success_signup.dart';
import 'package:testt/view/screen/auth/forgetpass/verifiycode.dart';
import 'package:testt/view/screen/auth/verfiycodesinup.dart';
import 'package:testt/view/screen/favoritepage.dart';
import 'package:testt/view/screen/items.dart';
import 'package:testt/view/screen/auth/signup.dart';
import 'package:testt/view/screen/settings.dart';

List<GetPage<dynamic>>? getPages =[
  GetPage(name: AppRoute.forgetpassword, page: ()=>const Forgetpassword()),
  GetPage(name: AppRoute.login, page: ()=>const Login()),
  GetPage(name: "/", page: ()=>const Onboarding(),middlewares: [Middlware()]),
  GetPage(name: AppRoute.signup, page: ()=>const Signup()),
  GetPage(name: AppRoute.verifiycode, page: ()=>const Verifiycode()),
  GetPage(name: AppRoute.resetpassword, page: ()=>const ResetPassword()),
  GetPage(name: AppRoute.success, page: ()=>const ResetSuccess()),
  GetPage(name: AppRoute.successinup, page: ()=>const SuccessSignup()),
  GetPage(name: AppRoute.verifiycodesinup, page: ()=>const VerifiycodeSignUp()),
  GetPage(name: AppRoute.home, page: ()=>const Homescreen()),
  GetPage(name: AppRoute.items, page: ()=>const Items()),
  GetPage(name: AppRoute.itemdetales, page: ()=>const Itemsdetiels()),
  GetPage(name: AppRoute.favoritepagr, page: ()=>const FavoritePage()),
  GetPage(name: AppRoute.settings, page: ()=>const Settings()),
  GetPage(name: AppRoute.cart, page: ()=>const Cart()),
  //  GetPage(name: "/", page: ()=>const Itemsdetiels()),
  
];


// Map<String,Widget Function(BuildContext)> routes={
//   AppRoute.forgetpassword : (context)=> const Forgetpassword(),
//   AppRoute.login : (context)=> const Login(),
//   AppRoute.onBoarding : (context)=> const Onboarding(),
//   AppRoute.signup : (context)=> const Signup(),
//   AppRoute.verifiycode : (context)=> const Verifiycode(),
//   AppRoute.resetpassword : (context)=> const ResetPassword(),
//   AppRoute.success : (context)=> const ResetSuccess(),
//   AppRoute.successinup : (context)=> const SuccessSignup(),
//    AppRoute.verifiycodesinup : (context)=> const VerifiycodeSignUp(),
  
// };