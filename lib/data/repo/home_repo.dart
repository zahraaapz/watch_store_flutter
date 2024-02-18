import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/src/home_data_src.dart';

import '../model/home.dart';

abstract class IHomeRepo {
  Future<Home> getHome();
}


class HomeRepository implements IHomeRepo{

  final IHomeDataSrc homeDataSrc;

  HomeRepository(this.homeDataSrc);
  
  @override
  Future<Home> getHome()=>  homeDataSrc.getHome();

}

 final homeRepository=HomeRepository(HomeRemoteDataSrc(Dio()));