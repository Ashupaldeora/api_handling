import 'package:http/http.dart%20';
import 'package:http/http.dart' as http;

class ApiService {
  Future<String?> apiCalling(String query) async {
    String api =
        'https://pixabay.com/api/?key=44453202-45ef7c677649f9bab57181230&q=$query&image_type=photo';
    Uri url = Uri.parse(api);
    Response response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
}
