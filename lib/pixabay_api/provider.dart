import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'helper_api_class.dart';

class PixabayProvider extends ChangeNotifier {
  Map data = {};
  bool isLoading = false;
  ApiService apiService = ApiService();

  Future<void> fetchData(String query) async {
    isLoading = true;
    notifyListeners();

    String? json = await apiService.apiCalling(query);
    data = jsonDecode(json!);

    isLoading = false;
    notifyListeners();
  }

  PixabayProvider() {
    fetchData("Nature");
  }
}
