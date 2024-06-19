import 'package:api_handling/user_Api_x_Model/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.data});
  final List<UserModel> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Services"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(data[index].name.toString()),
          subtitle: Text(data[index].email.toString()),
          leading: Text(data[index].id.toString()),
          trailing: Text(data[index].address!.city.toString()),
        ),
      ),
    );
  }
}
