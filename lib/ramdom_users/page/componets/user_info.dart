import 'package:bloc_tut_24/ramdom_users/model/user_info_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.userInfoResult}) : super(key: key);
  final UserInfoResult userInfoResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: Image.network(userInfoResult.image).image,
          radius: 35,
        ),
        SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: ${userInfoResult.name}'),
            Text('Email: ${userInfoResult.email}'),
            Row(
              children: [
                const Icon(CupertinoIcons.phone, size: 16),
                Text(': ${userInfoResult.phone}'),
              ],
            ),
          ],
        ))
      ],
    );
    ();
  }
}
