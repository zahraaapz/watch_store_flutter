import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/home_repo.dart';
import 'package:watch_store_flutter/gen/assets.gen.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store_flutter/screens/home/bloc/home_bloc.dart';
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
      child: SingleChildScrollView(
        child: Scaffold(
            body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is LoadingState) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryWidget(
                        size: size,
                        title: MyStrings.desktop,
                        iconPath: Assets.svg.desktop,
                        colors: MyColors.catDesktop,
                        ontap: () {}),
                    CategoryWidget(
                        size: size,
                        title: MyStrings.digital,
                        iconPath: Assets.svg.digital,
                        colors: MyColors.catDigital,
                        ontap: () {}),
                    CategoryWidget(
                        size: size,
                        title: MyStrings.smart,
                        iconPath: Assets.svg.smart,
                        colors: MyColors.catSmart,
                        ontap: () {}),
                    CategoryWidget(
                        size: size,
                        title: MyStrings.classic,
                        iconPath: Assets.svg.clasic,
                        colors: MyColors.catClassic,
                        ontap: () {}),
                  ],
                ),
                MyDimens.large.height,
                Row(
                  children: [
                    SizedBox(
                      height: 197,
                      width: 310,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.home.amazingProducts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => productItem(
                                price: state.home.amazingProducts[index].price,
                                productName:
                                    state.home.amazingProducts[index].title,
                                time: 10,
                                discount:
                                    state.home.amazingProducts[index].discount,
                              )),
                    ),
                    VerticalText()
                  ],
                )
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text('error'));
          } else {
            throw Exception('invalid state');
          }
        })),
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
                Text('مشاهده همه')
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
