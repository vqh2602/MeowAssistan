
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meowassistan/models/blogPost.dart';

const blogId = '4657871649253079687';
const appid = "AIzaSyB1I9TTV3JFhcEG8O15qg8HFIvmlIObmMo";
//late final LoctionUrl  = (lat,long,lang) => "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$appid&units=metric&lang=$lang";
late final UrlBlog  = () => "https://www.googleapis.com/blogger/v3/blogs/$blogId/posts?key=$appid";

class BlogPostRepositories {
  late final http.Client httpClient;

  BlogPostRepositories({required this.httpClient});

  Future<BlogPost> fetchWeather () async{
    final response = await httpClient.get(Uri.parse(UrlBlog()));
    print("check repornt ${response.statusCode} and/ ${Uri.parse(UrlBlog().toString())}");
    if(response.statusCode !=200){
      print("lôi call api");
      throw Exception("lỗi lấy api blog");
    }else{
      final weatherJson = jsonDecode(response.body);
      print("call api thanh cong");
      return BlogPost.fromJson(weatherJson);
    }
  }
}
