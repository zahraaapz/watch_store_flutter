import 'package:flutter/material.dart';
import 'package:watch_store_flutter/data/model/product_detail.dart';
import 'package:watch_store_flutter/res/dimens.dart';

import '../components/text_style.dart';
import '../res/color.dart';

class ProductTabView extends StatefulWidget {
 ProductTabView({super.key,this.productDetailes});
final productDetailes;
  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
 
 var selectedIndex=2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.sizeOf(context).width * .3,
          child: ListView.builder(
          itemCount:tabs.length ,
          itemExtent: MediaQuery.sizeOf(context).width /tabs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex=index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(MyDimens.medium),
                child: Text(tabs[index],
                style: index==selectedIndex? MyStyles.selectedTab:MyStyles.unselectedTab,),
              ),
            ),
          ),
        ),
        IndexedStack(index: selectedIndex,
        children: [
     Review(
              text: widget.productDetailes.discussion,
            ),
            CommentsList(comments: widget.productDetailes.comments!),
            PropertiesList(
              properties: widget.productDetailes.properties!,
            )
        ],)
      ],
    );
  }
}

List<String> tabs = ['خصوصیات', 'نظرات', 'نقد و برسی'];

class PropertiesList extends StatelessWidget {
  final List<Properties> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(MyDimens.medium),
          margin: const EdgeInsets.all(MyDimens.medium),
          color: MyColors.surfaceColor,
          child: Text(
            "${properties[index].property} : ${properties[index].value}",
            style: MyStyles.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    ));
  }
}

class CommentsList extends StatelessWidget {
  final List<Comments> comments;

  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(MyDimens.medium),
          margin: const EdgeInsets.all(MyDimens.medium),
          color: MyColors.surfaceColor,
          child: Text(
            "${comments[index].user} : ${comments[index].body}",
            style: MyStyles.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    ));
  }
}

class Review extends StatelessWidget {
  final text;
  const Review({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}