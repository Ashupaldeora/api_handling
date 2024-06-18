import 'dart:convert';

import 'package:api_handling/Api-x-Model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserApiServices {
  String apiString = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> loadData() async {
    Response json = await http.get(Uri.parse(apiString));

    if (json.statusCode == 200) {
      final jsonData = jsonDecode(json.body);
      List<UserModel> finalData =
          jsonData.map<UserModel>((e) => UserModel.fromJson(e)).toList();
      return finalData;
    } else {
      throw Exception('Failed to load API');
    }
  }

  // UserApiServices() {
  //   loadData();
  // }
}
