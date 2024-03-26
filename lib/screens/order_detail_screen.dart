import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_flutter/data/repo/user_info_repo.dart';
import 'package:watch_store_flutter/screens/profile/bloc/profile_bloc.dart';
import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/string.dart';
import '../widget/custom_app_bar.dart';


class OrderDetailScreen extends StatelessWidget {
const OrderDetailScreen({super.key,this.event});
final event;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) { 
        final b=ProfileBloc(iUserInfoRepo);
        b.add(ProcessingOrderEvent());
        return b;
        },
      child: Scaffold(
        appBar:  CustomAppBar(
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, icon: SvgPicture.asset(Assets.svg.close))
          ],
        )),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) { 
            if (state is ProcessingOrderState) {
              return   Column(
             children: [
              Text(state.orderList[0].product)
             ],
          );
            }
             else{
              return Text('data');
             }
           },
        
        ),
      ),
    );
  }
}