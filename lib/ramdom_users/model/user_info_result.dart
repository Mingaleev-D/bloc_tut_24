import 'package:equatable/equatable.dart';

import '../page/componets/user_info.dart';

class UserResultInfo extends Equatable {
  final int currentPage;
  final List<UserInfoResult> userInfoList;

  const UserResultInfo({
    required this.currentPage,
    required this.userInfoList,
  });

  // userInfoList: json['results'].map<UserInfo>((item) => UserInfo.fromJson(item)).toList(),
  factory UserResultInfo.fromJson(Map<String, dynamic> json) {
    return UserResultInfo(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList: json['results']
          .map<UserInfoResult>((item) => UserInfoResult.fromJson(item))
          .toList(),
    );
  }

  UserResultInfo copyWithFromJson(Map<String, dynamic> json) {
    return UserResultInfo(
      currentPage: (json['info']['page'] as int) + 1,
      userInfoList: userInfoList
        ..addAll(json['results']
            .map<UserInfo>((item) => UserInfoResult.fromJson(item))
            .toList()),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [currentPage, userInfoList];
}

class UserInfoResult extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String image;

  const UserInfoResult(
      {required this.name,
      required this.email,
      required this.phone,
      required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, image];

  factory UserInfoResult.fromJson(Map<String, dynamic> json) {
    return UserInfoResult(
      image: json['picture']['thumbnail'] as String,
      name: json['name']['first'] + json['name']['last'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}
