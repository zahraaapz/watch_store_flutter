import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/src/user_info_src.dart';

import '../model/address.dart';
import '../model/order.dart';
import '../model/user_info.dart';

abstract class IUserInfoRepo {
  Future<UserInfo> getUserInfo();
  Future<Addres> getUserAddress();
  Future<List<Order>> getReceivedOrder();
  Future<List<Order>> getCanceledOrder();
  Future<List<Order>> getProcessingOrder();
}

class UserInfoRepository implements IUserInfoRepo{
IUserInfoDataSrc iUserInfo;
UserInfoRepository(this.iUserInfo);
  @override
  Future<List<Order>> getCanceledOrder() =>iUserInfo.getCanceledOrder();

  @override
  Future<List<Order>> getProcessingOrder() =>iUserInfo.getProcessingOrder();

  @override
  Future<List<Order>> getReceivedOrder()=>iUserInfo.getReceivedOrder();

  @override
  Future<Addres> getUserAddress()=>iUserInfo.getUserAddress();

  @override
  Future<UserInfo> getUserInfo() =>iUserInfo.getUserInfo();

}

final IUserInfoRepo iUserInfoRepo=UserInfoRepository(UserInfoRemote(Dio()));