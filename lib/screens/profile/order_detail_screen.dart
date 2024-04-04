import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/components/text_style.dart';
import 'package:watch_store_flutter/data/model/order.dart';
import 'package:watch_store_flutter/screens/profile/bloc/profile_bloc.dart';
import '../../gen/assets.gen.dart';
import '../../widget/custom_app_bar.dart';
import '../../../widget/surface_container.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({super.key,required this.event});
 final ProfileEvent event;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(event);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'جزئیات',
              style: MyStyles.caption.copyWith(fontSize: 16),
              textDirection: TextDirection.rtl,
            ),
            IconButton(
                onPressed: () {
                 BlocProvider.of<ProfileBloc>(context).add(ProfileInitEvent());

                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(Assets.svg.close))
          ],
        )),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            List<Order> order;
            switch (state.runtimeType) {
              case ProcessingOrderState:
              case CanceledOrderState:
              case ReceivedOrderState:
                order = (state as dynamic).order;
                return DetailsSurface(list: order[0].orderDetails);

              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class DetailsSurface extends StatelessWidget {
  const DetailsSurface({super.key, required this.list});
  final List<OrderDetail> list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SizedBox(
              width: 300,
              child: SurfaceContainer(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      list[index].product,
                      style: MyStyles.caption,
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                        "قیمت: ${list[index].discountPrice.separateWithComma} تومان",
                        style: MyStyles.caption),
                    Visibility(
                        visible:
                            (list[index].discountPrice != list[index].price),
                        child: Text(
                            "قیمت: ${list[index].price.separateWithComma} تومان",
                            style:
                                MyStyles.caption.copyWith(color: Colors.blue))),
                  ],
                ),
              )));
        },
      ),
    );
  }
}
