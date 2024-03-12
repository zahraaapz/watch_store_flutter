import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/utils/response_validator.dart';

import '../model/home.dart';

abstract class IHomeDataSrc {
  Future<Home> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio httpClient;

  HomeRemoteDataSrc(this.httpClient);

  @override
  Future<Home>getHome() async {
    final Home home;
    final response = await httpClient.get(Endpoints.home);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    
    home = Home.fromJson(response.data['data']);
    return home;
  }
}
