import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/color.dart';
import '../res/dimens.dart';

class productItem extends StatelessWidget {
  const productItem({
    super.key,
    required this.productName,
    required this.price,
    required this.imagePath,
    this.time=0,
    this.discount=0,
    this.oldPrice=0,
  });


final String productName;
final int price;
final int oldPrice;
final int discount;
final int time;
final imagePath;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
         width: 190,
        
         decoration: const BoxDecoration(
             gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: MyColors.productBgGradiant)),
         child: Column(
           children: [
             Image.network(imagePath,scale:2.4,),
             Align(
               alignment: Alignment.centerRight,
               child: Text(
                 productName,
                 style: MyStyles.productTite,
               ),
             ),

             MyDimens.medium.height,
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(' ${price.separateWithComma} تومان ',style: MyStyles.title,),
                     Visibility(
                      visible: discount>0?true:false,
                      child: Text('${oldPrice.separateWithComma}',style: MyStyles.oldPrice,)),
                   ],
                 ),
                 Visibility(
                    visible: discount>0?true:false,
                   child: Container(
                     padding:
                         const EdgeInsets.all(MyDimens.small * .5),
                     decoration: BoxDecoration(
                         borderRadius:
                             BorderRadius.circular(60),
                         color: Colors.red),
                         child: Text('$discount %'),
                   ),
                 )
               ],
             ),  MyDimens.medium.height,
             Visibility(
                visible: discount>0?true:false,
               child: Container(
                 height: 2,
                 width: double.infinity,
                 color: Colors.blue,
               ),
             ),
             Visibility(
                visible: discount>0?true:false,
              child: Text('$time',style: MyStyles.prodTimeStyle,))
           ],
         ),
       );
  }
}

