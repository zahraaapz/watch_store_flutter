import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_flutter/res/dimens.dart';

class AppSlider extends StatefulWidget {
  AppSlider({
    super.key,
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  int _current=0;
  List<String> imgList = [
    'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
    'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
    'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
    'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  ];

  final CarouselController _controller = CarouselController();

  late final List<Widget> items = imgList
      .map((e) => Padding(
          padding: EdgeInsets.all(MyDimens.large),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(MyDimens.medium),
              child: Image.network(
                e,
                fit: BoxFit.cover,
              ))))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: CarouselSlider(
            carouselController: _controller,
              items: items,
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current=index;
                  });
                },
              )),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: imgList.asMap().entries
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
