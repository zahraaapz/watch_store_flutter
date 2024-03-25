import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/model/order.dart';
import 'package:watch_store_flutter/data/model/user_info.dart';
import 'package:watch_store_flutter/data/model/address.dart';
import '../../utils/response_validator.dart';

abstract class IUserInfoDataSrc {
  Future<UserInfo> getUserInfo();
  Future<Addres> getUserAddress();
  Future<List<Order>> getReceivedOrder();
  Future<List<Order>> getCanceledOrder();
  Future<List<Order>> getProcessingOrder();
}

class UserInfoRemote implements IUserInfoDataSrc {
  Dio httpClient;
  UserInfoRemote(this.httpClient);
  @override
  Future<UserInfo> getUserInfo() async {
    UserInfo userInfo;
    final response = await httpClient.post(Endpoints.getUserInfo);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    userInfo = UserInfo.fromJson(response.data['data']['user_info']);
    return userInfo;
  }

  @override
  Future<List<Order>> getCanceledOrder()async {
   List<Order>order=[];
    final response = await httpClient.post(Endpoints.getCanceledOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    response.data['data']['order_details'].forEach((e){
   
      order.add(Order.fromJson(e));
    });
   return order;
  }

  @override
  Future<List<Order>> getProcessingOrder()async {
   List<Order>order=[];
    final response = await httpClient.post(Endpoints.getProcessingOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    response.data['data']['order_details'].forEach((e){
   
      order.add(Order.fromJson(e));
    });
   return order;
  }

  @override
  Future<List<Order>> getReceivedOrder()async {
   List<Order>order=[];
    final response = await httpClient.post(Endpoints.getRecievedOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    response.data['data']['order_details'].forEach((e){
   
      order.add(Order.fromJson(e));
    });
   return order;
  }

  @override
  Future<Addres> getUserAddress() async {
    Addres addres;
    final response = await httpClient.post(Endpoints.getAddress);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    addres = Addres.fromJson(response.data['data'][0]);
    return addres;
  }
}
