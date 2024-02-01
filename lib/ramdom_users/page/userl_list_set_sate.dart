import 'package:bloc_tut_24/ramdom_users/page/componets/user_info.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../model/user_info_result.dart';

class UserlListSetSate extends StatefulWidget {
  const UserlListSetSate({Key? key}) : super(key: key);

  @override
  State<UserlListSetSate> createState() => _UserlListSetSateState();
}

class _UserlListSetSateState extends State<UserlListSetSate> {
  late Dio dio;
  ScrollController scrollController = ScrollController();
  late UserResultInfo userResultInfo;
  int nextPage = -1;
  @override
  void initState() {
    super.initState();
    userResultInfo = const UserResultInfo(currentPage: 0, userInfoList: []);
    dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent * 0.7 <=
              scrollController.offset &&
          nextPage != userResultInfo.currentPage) {
        nextPage = userResultInfo.currentPage;
        setState(() {});
        print('Next page');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<UserResultInfo> _loadUsers() async {
      var result = await dio.get('api', queryParameters: {
        'results': 10,
        'seed': 'sudar',
        'page': userResultInfo.currentPage,
      });
      print(result);
      userResultInfo = userResultInfo.copyWithFromJson(result.data);
      return userResultInfo;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SetSate'),
      ),
      body: FutureBuilder<UserResultInfo>(
          future: _loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              return ListView.separated(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return UserInfo(
                      userInfoResult: snapshot.data!.userInfoList[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.userInfoList.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
