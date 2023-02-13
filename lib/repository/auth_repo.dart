import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Data_model.dart';

class AuthRepo {
  // sign up
  Future<bool> signUpWithEmail(String firstName, String lastName,
      String emailAddress, String password, String confirmPassword) async {
    var response = await http
        .post(Uri.parse("https://reqres.in/api/users"), body: <String, String>{
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "password": password,
      "confirm_password": confirmPassword
    });

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<DataModel> getData() async {
    var response = await http.get(Uri.parse("https://reqres.in/api/users"));
    if (response.statusCode == 200) {
      return DataModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Something wrong");
    }
  }
}
