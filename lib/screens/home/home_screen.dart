import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/home_repo.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/screens/home/bloc/home_bloc.dart';
import 'package:watch_store_flutter/screens/product_list/product_list_screen.dart';
import 'package:watch_store_flutter/widget/category_widget.dart';
import '../../widget/app_slider.dart';
import '../../widget/product_item.dart';
import '../../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit());
        return homeBloc;
      },
      child: SafeArea(
        child: Scaffold(body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  searchBtn(
                    onTap: () {},
                  ),
                  AppSlider(
                    imgList: state.home.sliders,
                  ),
                  SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: state.home.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) {
                            return CategoryWidget(
                                size: size,
                                title: state.home.categories[i].title,
                                iconPath: state.home.categories[i].image,
                                colors: i.isEven
                                    ? MyColors.catDesktop
                                    : MyColors.catSmart,
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductListScreen(
                                          param: state.home.categories[i].id,
                                        ),
                                      ));
                                });
                          })),
                  MyDimens.medium.height,
                  Row(
                    children: [
                      SizedBox(
                        height: 255,
                        width: 310,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.home.amazingProducts.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => productItem(
                           product: state.home.amazingProducts[index],
                                )),
                      ),
                      VerticalText()
                    ],
                  )
                ],
              );
            } else if (state is HomeError) {
              return const Center(child: Text('error'));
            } else {
              throw Exception('invalid state');
            }
          }),
        )),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                    angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
                Text('مشاهده همه',style: MyStyles.amazingStyle)
              ],
            ),
            Text(
              'شگفت انگیز',
              style: MyStyles.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}
