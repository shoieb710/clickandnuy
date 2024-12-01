import 'package:get/get.dart';
   bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

validatorT(String val, int min,int max,String type){
  if(type == "username"){
    if( hasMatch(val, r'^[a-zA-Z][a-zA-Z]+[a-zA-Z]$')){
      return "not valid username";
    }
  }
    if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "46".tr;
    }
  }
    if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "47".tr;
    }
  }
    if(val.length < min){
      return "${"48".tr} $min";
    }
        if(val.length > max){
      return "${"49".tr}$max";
    }
        if(val.isEmpty){
      return "50".tr;
    }
  }
