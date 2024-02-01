import 'package:bloc_tut_24/ramdom_users/page/userl_list_set_sate.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserlListSetSate(),
                      ));
                },
                child: Text('SetState')),
            ElevatedButton(onPressed: () {}, child: Text('extends')),
            ElevatedButton(onPressed: () {}, child: Text('CopyWith')),
          ],
        ),
      ),
    );
  }
}
