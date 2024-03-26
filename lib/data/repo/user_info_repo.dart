
import 'package:watch_store_flutter/data/conf/remote_conf.dart';
import 'package:watch_store_flutter/data/src/user_info_src.dart';
import '../model/address.dart';
import '../model/user_info.dart';
import 'package:watch_store_flutter/data/model/Order.dart';

abstract class IUserInfoRepo {
  Future<UserInfo> getUserInfo();
  Future<Addres> getUserAddress();
  Future<List<OrderDetail>> getReceivedOrder();
  Future<List<OrderDetail>> getCanceledOrder();
  Future<List<OrderDetail>> getProcessingOrder();
}

class UserInfoRepository implements IUserInfoRepo{
IUserInfoDataSrc iUserInfo;
UserInfoRepository(this.iUserInfo);
  @override
  Future<List<OrderDetail>> getCanceledOrder() => iUserInfo.getCanceledOrder();

  @override
  Future<List<OrderDetail>> getProcessingOrder() =>iUserInfo.getProcessingOrder();

  @override
  Future<List<OrderDetail>> getReceivedOrder()=>iUserInfo.getReceivedOrder();

  @override
  Future<Addres> getUserAddress()=>iUserInfo.getUserAddress();

  @override
  Future<UserInfo> getUserInfo() =>iUserInfo.getUserInfo();

}

final IUserInfoRepo iUserInfoRepo=UserInfoRepository(UserInfoRemote(DioManager.dio));