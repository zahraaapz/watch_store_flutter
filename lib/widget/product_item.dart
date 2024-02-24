import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/utils/format_time.dart';
import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/color.dart';
import '../res/dimens.dart';

class productItem extends StatefulWidget {
  const productItem({
    super.key,
    required this.productName,
    required this.price,
    required this.imagePath,
    this.specialExpiration='',
    this.discount = 0,
    this.oldPrice = 0,
  });

  final String productName;
  final int price;
  final int oldPrice;
  final int discount;
  final specialExpiration;
  final imagePath;

  @override
  State<productItem> createState() => _productItemState();
}

class _productItemState extends State<productItem> {
  Duration duration = Duration(seconds: 0);
late Timer timer;
late int inSeconds;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    DateTime exp = DateTime.parse(widget.specialExpiration);

    duration=now.difference(exp).abs();
   inSeconds=duration.inSeconds;
  startTimer();

  }

startTimer(){
  const onesec=Duration(seconds: 1);
  timer=Timer.periodic(onesec, (timer) { 
    setState(() {
      if (inSeconds==0) {
        
      } else {
       inSeconds--; 
      }
    });
  });
}
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
          Image.network(
            widget.imagePath,
            scale: 2.4,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.productName,
              style: MyStyles.productTite,
            ),
          ),
          MyDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${widget.price.separateWithComma} تومان ',
                    style: MyStyles.title,
                  ),
                  Visibility(
                      visible: widget.discount > 0 ? true : false,
                      child: Text(
                        '${widget.oldPrice.separateWithComma}',
                        style: MyStyles.oldPrice,
                      )),
                ],
              ),
              Visibility(
                visible: widget.discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(MyDimens.small * .5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red),
                  child: Text('${widget.discount} %'),
                ),
              )
            ],
          ),
          MyDimens.medium.height,
          Visibility(
            visible: duration.inSeconds > 0 ? true : false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          Visibility(
              visible: duration.inSeconds > 0 ? true : false,
              child: Text(
                formatTimer(inSeconds),
                style: MyStyles.prodTimeStyle,
              ))
        ],
      ),
    );
  }
}
