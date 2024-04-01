import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/repo/user_info_repo.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/res/string.dart';
import 'package:watch_store_flutter/screens/profile/order_detail_screen.dart';
import 'package:watch_store_flutter/screens/profile/bloc/profile_bloc.dart';
import 'package:watch_store_flutter/widget/custom_app_bar.dart';
import '../../gen/assets.gen.dart';
import '../../widget/cart_screen.dart';
import '../../widget/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final profBloc = ProfileBloc(iUserInfoRepo);
        profBloc.add(ProfileInitEvent());
        return profBloc;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              MyStrings.profile,
              style: MyStyles.title,
            ),
          )),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: MyDimens.large),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (contxt, state) {
                    if (state is ProfileLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is ProfileLoadedState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyDimens.medium.height,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Image.asset(Assets.png.avatar.path),
                          ),
                          MyDimens.medium.height,
                          Text(
                            state.userInfo.name,
                            style: MyStyles.avatarText,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.userInfo.address.postalCode,
                                style: MyStyles.title,
                              )),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.userInfo.address.address,
                                style: MyStyles.title,
                                softWrap: true,
                                maxLines: 2,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.end,
                              )),
                          MyDimens.small.height,
                          Container(
                            height: 2,
                            width: double.infinity,
                            color: MyColors.surfaceColor,
                          ),
                          MyDimens.small.height,
                          ProfileItem(
                            svgIcon: Assets.svg.user,
                            title: state.userInfo.name,
                          ),
                          ProfileItem(
                              svgIcon: Assets.svg.cart,
                              title: state.userInfo.id),
                          ProfileItem(
                            svgIcon: Assets.svg.phone,
                            title: state.userInfo.phone,
                          ),
                          textTitle(
                              title: MyStrings.termOfService, onTap: () {}),
                          textTitle(
                              title: MyStrings.cancelled,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                          value: BlocProvider.of<ProfileBloc>(
                                              contxt),
                                          child: OrderDetailScreen(
                                            event:CanceledOrderEvent(),
                                          )),
                                    ));
                              }),  textTitle(
                              title: MyStrings.inProccess,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                          value: BlocProvider.of<ProfileBloc>(
                                              contxt),
                                          child: OrderDetailScreen(
                                            event:ProcessingOrderEvent(),
                                          )),
                                    ));
                              }),  textTitle(
                              title: MyStrings.delivered,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                          value: BlocProvider.of<ProfileBloc>(
                                              contxt),
                                          child: OrderDetailScreen(
                                            event:ReceivedOrderEvent(),
                                          )),
                                    ));
                              }),
                       
                       
                        ],
                      );
                    } else {
                      return const Text('Error');
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class textTitle extends StatelessWidget {
  const textTitle({super.key, this.onTap, this.title});
  final onTap;
  final title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 50,
          child: SurfaceContainer(
              child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              title.toString(),
              style: MyStyles.avatarText,
              textAlign: TextAlign.end,
            ),
          ))),
    );
  }
}
