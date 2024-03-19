import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/widget/surface_container.dart';

import '../gen/assets.gen.dart';
import '../res/color.dart';

class ShoppingCartItem extends StatelessWidget {
  ShoppingCartItem({super.key,required this.count,required this.productTite, this.add, this.delete, this.remove});
  int count = 0;
final add;
final delete;
final remove;
  String productTite;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: 
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                
                productTite,
                style: MyStyles.productTite.copyWith(fontSize: 12),
              ),
              Divider(),
            
               Row(
            children: [
      
              IconButton(
                  onPressed:delete, icon: SvgPicture.asset(Assets.svg.delete)),
              IconButton(
                  onPressed:remove, icon: SvgPicture.asset(Assets.svg.minus)),
              Text('عدد $count'),
              IconButton(
                  onPressed:add, icon: SvgPicture.asset(Assets.svg.plus)),
            ],
          ), ],
          )),
      
       
    );
  }
}