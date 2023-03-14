import 'package:http/http.dart' as http;

 var url = "http://10.144.36.48:5000/login";
fetchUser(String email, String password) async {
  http.Response response = await http
      .post(Uri.parse(url), body: {"email": email, "password": password});
  return (response.body);
}
