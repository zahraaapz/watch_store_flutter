  import 'package:dio/dio.dart';

Future<String> getAddress(double lng, double lat) async {

    String add = '';
    await Dio()
        .get("https://api.neshan.org/v5/reverse?lat=$lat&lng=$lng",
            options: Options(headers: {
             "Api-Key": 'service.af60e2291dd3468f9cb9637df3818412'
            }))
        .then((val) {
                print(val.toString());
                add=val.data['formatted_address'];
        });

    return add;
  }