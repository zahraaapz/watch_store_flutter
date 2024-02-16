import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../data/model/slide.dart';

class AppSlider extends StatefulWidget {
  AppSlider({
    super.key, required this.imgList,
  });
final List<Slide> imgList;
  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  int _current=0;

  final CarouselController _controller = CarouselController();



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: CarouselSlider(
            carouselController: _controller,
              items: widget.imgList.map((e) => Padding(padding: const EdgeInsets.all(MyDimens.medium),
              child: ClipRRect(borderRadius:BorderRadius.circular(MyDimens.medium),child: Image.network(e.image,fit: BoxFit.cover,), ),)).toList(),
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current=index;
                  });
                },
              )),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries
              .map((e) => Padding(
                padding: const EdgeInsets.all(MyDimens.small),
                child: GestureDetector(
                  onTap: () => _controller.animateToPage(e.key),
                  child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                             color:_current==e.key? Colors.black:Colors.grey),
                      ),
                ),
              ))
              .toList(),
        )
      ],
    );
  }
}
