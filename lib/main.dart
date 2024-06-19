import 'package:api_handling/pixabay_api/provider.dart';
import 'package:api_handling/pixabay_api/screen.dart';
import 'package:api_handling/user_Api_x_Model/user_api_call.dart';
import 'package:api_handling/user_Api_x_Model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_Api_x_Model/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserApiServices apiServices = UserApiServices();
  List<UserModel> data = await apiServices.loadData();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PixabayProvider(),
      )
    ],
    child: MyApp(
      data: data,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/day2',
      routes: {
        '/day1': (context) => HomeScreen(
              data: data,
            ),
        '/day2': (context) => Screen(),
      },
    );
  }
}
