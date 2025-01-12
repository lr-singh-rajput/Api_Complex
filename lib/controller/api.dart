
import 'dart:convert';

import 'package:api_l3_nullsafty/models/UserModel.dart';
import 'package:http/http.dart' as http;

class Api{
  List<userModel> userList = [];

  Future<List<userModel>> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      for(Map i in data){
        userList.add(userModel.fromJson(i as Map<String, dynamic>));
      }
      return userList;
    }else{
      return userList;
    }
  }
}
