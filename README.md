# User API Services in Flutter

This Flutter application demonstrates how to fetch and display data from a free API using Dart. The project uses the [jsonplaceholder](https://jsonplaceholder.typicode.com/) API to fetch user data and display it on the screen.

## Features

- Fetch data from an API
- Display data in a list view
- Error handling for failed API requests

## What is an API?

An API (Application Programming Interface) is a set of rules and definitions that allows one software application to interact with another. It defines the methods and data structures that developers use to interact with the functionalities provided by a system. In this project, we use a RESTful API provided by [jsonplaceholder](https://jsonplaceholder.typicode.com/) to fetch user data.

## Getting Started

```dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class UserApiServices {
  String apiString = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> loadData() async {
    final response = await http.get(Uri.parse(apiString));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<UserModel> finalData =
          jsonData.map<UserModel>((e) => UserModel.fromJson(e)).toList();
      return finalData;
    } else {
      throw Exception('Failed to load API');
    }
  }
}
```

<div align="center">
<img src="https://github.com/Ashupaldeora/api_handling/assets/143180848/6b218e3b-9a5a-4cde-8aeb-154abbb7c288" height = 500px></div>
<div align="center">
<a href="https://github.com/Ashupaldeora/api_handling/tree/master/lib/user_Api_x_Model">-> See The Code <-</a>
</div>
# Pixabay Image Fetching with API in Flutter

This Flutter application demonstrates how to fetch and display images from the Pixabay API using Dart.

## Features

- Fetch images from the Pixabay API
- Display images in a grid view
- Error handling for failed API requests

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String?> apiCalling(String query) async {
    String api =
        'https://pixabay.com/api/?key=44453202-45ef7c677649f9bab57181230&q=$query&image_type=photo';
    Uri url = Uri.parse(api);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
```
<div align="center">
<img src="https://github.com/Ashupaldeora/api_handling/assets/143180848/37ed84e0-14b3-4576-afd0-3dbbdeb5edbc" height = 500px></div>



<div align="center">
<a href="https://github.com/Ashupaldeora/api_handling/tree/master/lib/pixabay_api">-> See The Code <-</a>
</div>



