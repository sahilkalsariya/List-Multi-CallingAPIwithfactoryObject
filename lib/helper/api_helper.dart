import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_app/%20models/post_model.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apihelper = APIHelper._();

  Future<List<Post>?> fetchData() async {
    String baseUI = "https://jsonplaceholder.typicode.com";
    String endPoint = "/posts";

    String api = baseUI + endPoint;

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      List decodedata = jsonDecode(res.body);

      List<Post> allPosts =
          decodedata.map((e) => Post.fromJson(json: e)).toList();

      return allPosts;
    } else {
      return null;
    }
  }
}
