import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_flutter/components/button_style.dart';
import 'package:watch_store_flutter/components/extention.dart';
import 'package:watch_store_flutter/res/color.dart';
import 'package:watch_store_flutter/res/dimens.dart';
import 'package:watch_store_flutter/routes/names.dart';
import 'package:watch_store_flutter/utils/image_handler.dart';
import 'package:watch_store_flutter/widget/avatar.dart';
import 'package:watch_store_flutter/widget/main_button.dart';
import '../components/text_style.dart';
import '../res/string.dart';
import '../widget/app_text_field.dart';
import '../widget/registerAppBar.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controller = TextEditingController();
  int _selectedValue = 0;
  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: RegisterationAppBar(size: size),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            MyDimens.medium.height,
            Avatar(
                file: imageHandler.getImage,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: size.height / 5,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width / 1.8,
                            child: ElevatedButton(
                                style: AppButtonStyle.mainButtonStyle.copyWith(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            MyColors.primaryColor)),
                                onPressed: () async => await imageHandler
                                    .pickAndCropImage(
                                        source: ImageSource.gallery)
                                    .then((value) => setState(() {})),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.photo_library,
                                        color: Colors.white),
                                    Text('انتخاب عکس از گالری',
                                        style: MyStyles.mainButton),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: size.width / 1.8,
                            child: ElevatedButton(
                                style: AppButtonStyle.mainButtonStyle.copyWith(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            MyColors.primaryColor)),
                                onPressed: () async => await imageHandler
                                    .pickAndCropImage(
                                        source: ImageSource.camera)
                                    .then((value) => setState(() {})),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.camera_alt_outlined,
                                        color: Colors.white),
                                    Text('انتخاب عکس از دوربین',
                                        style: MyStyles.mainButton),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            AppTextField(
                lable: MyStrings.nameLastName,
                hint: MyStrings.hintNameLastName,
                controller: controller),
            AppTextField(
                lable: MyStrings.homeNumber,
                hint: MyStrings.hintHomeNumber,
                controller: controller),
            AppTextField(
                lable: MyStrings.address,
                hint: MyStrings.hintAddress,
                controller: controller),
            AppTextField(
                lable: MyStrings.postalCode,
                hint: MyStrings.hintPostalCode,
                controller: controller),
            AppTextField(
                icon: const Icon(Icons.location_on),
                lable: MyStrings.location,
                hint: MyStrings.hintLocation,
                controller: controller),
            MainButton(
                text: MyStrings.next,
                onPressed: () {
                  Navigator.pushNamed(context, Screens.mainScreen);
                }),
            MyDimens.small.height
          ]),
        ),
      ),
    ));
  }
}
