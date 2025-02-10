import 'package:flutter/material.dart';
import 'package:testt/core/constant/color1.dart';

class StarsDiscription extends StatelessWidget {
  const StarsDiscription({super.key,required this.itemlist, required this.index});
    final List? itemlist ;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemlist?[index]["dis"],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall),
        Row(
          children: [
            ...List.generate(
                5,
                (i) => i>= itemlist?[index]["stars"]?  
                Icon(
                      Icons.star_border_outlined,
                      size: 15,
                    )
                :Icon(
                      Icons.star,
                      size: 15,
                      color: ColorApp.ambr,)
)
          ],
        )
      ],
    );
  }
}
