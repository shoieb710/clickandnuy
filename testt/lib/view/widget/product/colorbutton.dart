import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class Colorbutton extends StatefulWidget {
  const Colorbutton({super.key, required this.avelablecolors});
  final List avelablecolors;
    @override
  State<Colorbutton> createState() => _ColorbuttonState();
}
class _ColorbuttonState extends State<Colorbutton> {
      bool selected = false;
      bool selected1 = false;
      bool selected2 = false;
    void chageselected(int index){
      setState(() {
      if(index==0){
        selected=!selected;}
      else if(index==1){
        selected1=!selected1;
      }else{
        selected2=!selected2;
      }
      });
    }
    bool selectornum(int index){
      if(index==0){
        return selected ;}
      else if(index==1){
        return selected1;
      }else{
        return selected2;
      }
    }
  @override
  Widget build(BuildContext context) {
    return 
    Row(children: <Widget>[
      ...List.generate(widget.avelablecolors.length,
        (index) => Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(bottom: 5),
          alignment: Alignment.center,
          height: 65,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.primary),
            borderRadius: BorderRadius.circular(10),
            color: selectornum(index) == true ? ColorApp.logo : ColorApp.white,
          ),
          child: MaterialButton(
            child: Text(widget.avelablecolors[index],
                style: TextStyle(
                    color: ColorApp.black, fontWeight: FontWeight.bold)),
            onPressed: () {   
              chageselected(index);
              
            },
          ),
        ),
      )
    ])
    ;

  }
}

