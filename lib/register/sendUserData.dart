import 'package:http/http.dart' as http;


var url = "http://10.144.36.48:5000/register";

sendUserData(String fname, String lname,String email, String phone,String license) async {
  http.Response response = await http
      .post(Uri.parse(url),body: {"fname": fname, "lname": lname,"email": email, "phone": phone,"license": license});
  return (response.body);
}
