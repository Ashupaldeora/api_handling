import 'package:api_handling/Api-x-Model/user_api_call.dart';
import 'package:api_handling/Api-x-Model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserApiServices apiServices = UserApiServices();
  List<UserModel> data = await apiServices.loadData();
  runApp(MyApp(
    data: data,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        data: data,
      ),
    );
  }
}
