import 'dart:convert';


import 'package:api_http/conatant.dart';
import 'package:api_http/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<PostModel>?> getposts() async {
    try {
      var url = Uri.parse(Constant.baseUrl + Constant.endpoint);
    var res = await http.get(url);
    if (res.statusCode == 200) {
      List<PostModel> posts =(json.decode(res.body) as List).map((e) => PostModel.fromJson(e)).toList();
      return posts;
    }
    } catch (e) {
       (e.toString());
    }
    return null;
    
    

  }
}