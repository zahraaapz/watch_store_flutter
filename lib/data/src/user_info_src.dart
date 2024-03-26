import 'package:dio/dio.dart';
import 'package:watch_store_flutter/data/constant.dart';
import 'package:watch_store_flutter/data/model/Order.dart';
import 'package:watch_store_flutter/data/model/user_info.dart';
import 'package:watch_store_flutter/data/model/address.dart';
import '../../utils/response_validator.dart';

abstract class IUserInfoDataSrc {
  Future<UserInfo> getUserInfo();
  Future<Addres> getUserAddress();
  Future<List<OrderDetail>> getReceivedOrder();
  Future<List<OrderDetail>> getCanceledOrder();
  Future<List<OrderDetail>> getProcessingOrder();
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
  Future<List<OrderDetail>> getCanceledOrder()async {
   List<OrderDetail>order=[];

    final response = await httpClient.post(Endpoints.getCanceledOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    print(response.data.toString());
    response.data.forEach((e){
      
      order.add(OrderDetail.fromJson(e));
    });
 
  
   return order;
  }

  @override
  Future<List<OrderDetail>> getProcessingOrder()async {
   List<OrderDetail>order=[];
    final response = await httpClient.post(Endpoints.getProcessingOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
       print('lzl'+response.data.toString());
    // response.data.forEach((e){
   
    //   order.add(OrderDetail.fromJson(e));
    // });
   return order;
  }

  @override
  Future<List<OrderDetail>> getReceivedOrder()async {
   List<OrderDetail>order=[];
    final response = await httpClient.post(Endpoints.getRecievedOrder);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    response.data.forEach((e){
   
      order.add(OrderDetail.fromJson(e));
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
