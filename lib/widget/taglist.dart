import 'package:flutter/material.dart';
import '../res/dimens.dart';

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MyDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          reverse: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(MyDimens.large)),
              margin: const EdgeInsets.symmetric(horizontal: MyDimens.small),
              padding: const EdgeInsets.symmetric(horizontal: MyDimens.small),
            );
          },
        ),
      ),
    );
  }
}

