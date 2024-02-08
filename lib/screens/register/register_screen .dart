import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_flutter/components/button_style.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/data/model/model.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/screens/register/cubit/register_cubit.dart';
import 'package:watch_store_flutter/widget/avatar.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../../components/text_style.dart';
import '../../res/string.dart';
import '../../widget/app_text_field.dart';
import '../../widget/registerAppBar.dart';
import 'package:dio/dio.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerAddress = TextEditingController();
  final TextEditingController controllerPostalCode = TextEditingController();
  var image = null;
  double lat = 0;
  double lng = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: RegisterationAppBar(size: size),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: Center(
            child: Column(

                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyDimens.medium.height,
                  BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (contxt, state) {
                    if (state is IntialImageState) {
                      image = state.image;
                    }
                    if (state is CancelImageState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Cancel')));
                    }
                  }, builder: (contxt, state) {
                    return Avatar(
                        file: image,
                        onTap: () {
                          galleryOrcamera(context, size, contxt);
                        });
                  }),
                  AppTextField(
                      lable: MyStrings.nameLastName,
                      hint: MyStrings.hintNameLastName,
                      controller: controllerLastName),
                  AppTextField(
                      lable: MyStrings.homeNumber,
                      hint: MyStrings.hintHomeNumber,
                      controller: controllerPhone),
                  AppTextField(
                      lable: MyStrings.address,
                      hint: MyStrings.hintAddress,
                      controller: controllerAddress),
                  AppTextField(
                      lable: MyStrings.postalCode,
                      hint: MyStrings.hintPostalCode,
                      controller: controllerPostalCode),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) async {
                      if (state is LocationPickedState) {
                        if (state.location != null) {
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;

                          controllerLocation.text = await getAddress(
                              state.location!.longitude,
                              state.location!.latitude);
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickTheLocation(context: context);
                        },
                        child: AppTextField(
                            icon: const Icon(Icons.location_on),
                            lable: MyStrings.location,
                            hint: MyStrings.hintLocation,
                            controller: controllerLocation),
                      );
                    },
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is OkResponsestate) {
                        Navigator.pushNamed(context, Screens.mainScreen);
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('خطا')));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return MainButton(
                            text: MyStrings.next,
                            onPressed: () async {
                              User user = User(
                                  name: controllerLastName.text,
                                  phone: controllerPhone.text,
                                  postalCode: controllerPostalCode.text,
                                  address: controllerAddress.text,
                                  image:
                                      await MultipartFile.fromFile(image.path),
                                  lat: lat,
                                  lng: lng);

                              BlocProvider.of<RegisterCubit>(context)
                                  .register(user: user);
                            });
                      }
                    },
                  ),
                  MyDimens.small.height
                ]),
          ),
        ),
      ),
    ));
  }
//////////////not work
  // Future<String> getAddress(double lng, double lat) async {
  //   String address = '';
  //   try {
  //     await placemarkFromCoordinates(lat, lng, localeIdentifier: 'fa')
  //         .then((value) {
  //       Placemark first = value.first;

  //       address = '${first.street}' '${first.locality}' '${first.country}';
  //     });
  //     print(lat.toString());
  //     print(lng.toString());
  //     return address;
  //   } catch (e) {
  //     return 'آدرس یافت نشد';
  //   }
  // }

  Future<String> getAddress(double lng, double lat) async {

    String add = '';
    await Dio()
        .get("https://api.neshan.org/v5/reverse?lat=$lat&lng=$lng",
            options: Options(headers: {
              "Api-Key":'service.b25fe0490cb348ca8fab44bb75b2481a'
            }))
        .then((val) {
                print(val.toString());
                add=val.data['formatted_address'];
        });

    return add;
  }

Future<dynamic> galleryOrcamera(
      BuildContext context, Size size, BuildContext contxt) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          height: size.height / 5,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: size.width / 1.8,
                  child: ElevatedButton(
                      style: AppButtonStyle.mainButtonStyle.copyWith(
                          backgroundColor: const MaterialStatePropertyAll(
                              MyColors.primaryColor)),
                      onPressed: () async =>
                          await BlocProvider.of<RegisterCubit>(contxt)
                              .pickAndCropImage(source: ImageSource.gallery),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.photo_library, color: Colors.white),
                          Text('انتخاب عکس از گالری',
                              style: MyStyles.mainButton),
                        ],
                      ))),
              SizedBox(
                width: size.width / 1.8,
                child: ElevatedButton(
                    style: AppButtonStyle.mainButtonStyle.copyWith(
                        backgroundColor: const MaterialStatePropertyAll(
                            MyColors.primaryColor)),
                    onPressed: () async =>
                        await BlocProvider.of<RegisterCubit>(contxt)
                            .pickAndCropImage(source: ImageSource.camera),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.camera_alt_outlined, color: Colors.white),
                        Text('انتخاب عکس از دوربین',
                            style: MyStyles.mainButton),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
