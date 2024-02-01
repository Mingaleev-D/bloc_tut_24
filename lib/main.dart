import 'package:bloc_tut_24/counter/bloc/counter_bloc.dart';
import 'package:bloc_tut_24/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_tut_24/image_picker/utils/picker_util.dart';
import 'package:bloc_tut_24/ramdom_users/page/users_page.dart';
import 'package:bloc_tut_24/switcher/bloc/swither_bloc.dart';
import 'package:bloc_tut_24/switcher/page/swither_page.dart';
import 'package:bloc_tut_24/todo/bloc/todo_bloc.dart';
import 'package:bloc_tut_24/todo/page/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_picker/page/image_picker_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitherBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(PickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const UsersPage()),
    );
  }
}
