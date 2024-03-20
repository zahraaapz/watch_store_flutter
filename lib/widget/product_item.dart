import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/data/model/product.dart';
import 'package:watch_store_flutter/screens/product_single/product_single_screen.dart';
import 'package:watch_store_flutter/utils/format_time.dart';
import '../components/text_style.dart';
import '../res/color.dart';
import '../res/dimens.dart';

class productItem extends StatefulWidget {
  const productItem({
required this.product
  });

final Product product;

  @override
  State<productItem> createState() => _productItemState();
}

class _productItemState extends State<productItem> {
  Duration duration = Duration(seconds: 0);
  late Timer timer;
  int inSeconds = 0;
  @override
  void initState() {
    timer = Timer(duration, () {});
    if (widget.product.specialExpiration != '') {
      DateTime now = DateTime.now();
      DateTime exp = DateTime.parse(widget.product.specialExpiration);

      duration = now.difference(exp).abs();
      inSeconds = duration.inSeconds;
      startTimer();
    }

    super.initState();
  }

  startTimer() {
    const onesec = Duration(seconds: 1);
    timer = Timer.periodic(onesec, (timer) {
      setState(() {
        if (inSeconds == 0) {
          timer.cancel();
          print('l');
        } else {
          inSeconds--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductSingleScreen(id: widget.product.id),
            ));
      },
      child: Container(
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
              widget.product.image,
              scale: 2.4,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.product.title,
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
                      ' ${widget.product.price.separateWithComma} تومان ',
                      style: MyStyles.title,
                    ),
                    Visibility(
                        visible: widget.product.discount > 0 ? true : false,
                        child: Text(
                          '${widget.product.discountPrice.separateWithComma}',
                          style: MyStyles.oldPrice,
                        )),
                  ],
                ),
                Visibility(
                  visible: widget.product.discount > 0 ? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(MyDimens.small * .5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.red),
                    child: Text('${widget.product.discount} %'),
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
      ),
    );
  }
}
