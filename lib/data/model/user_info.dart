import 'package:watch_store_flutter/data/model/address.dart';

class UserInfo {
  int id;
  String name;
  String mobile;
  String phone;
  Addres address;

  UserInfo({
    required this.id,
    required this.name,
    required this.mobile,
    required this.phone,
    required this.address,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      phone: json['phone'],
      address: Addres.fromJson(json['address']),
    );
  }
}

class User {
  UserInfo userInfo;
  int userProcessingCount;
  int userReceivedCount;
  int userCancelCount;

  User({
    required this.userInfo,
    required this.userProcessingCount,
    required this.userReceivedCount,
    required this.userCancelCount,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userInfo: UserInfo.fromJson(json['user_info']),
      userProcessingCount: json['user_processing_count'],
      userReceivedCount: json['user_received_count'],
      userCancelCount: json['user_cancel_count'],
    );
  }
}