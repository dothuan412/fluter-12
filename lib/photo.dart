import 'dart:convert';

import 'package:http/http.dart' as http;
class Photo{
 final int albumId;
 final int id;
 final String title;
 final String url;
 final String thumbnailUrl;

  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
  static Future<List<Photo>> fetchdata() async{
    String url="https://jsonplaceholder.typicode.com/photos";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
      print('Tai du lieu thanh cong');
      var result = response.body;
      var jsonData= jsonDecode(result);
      print(jsonData.runtimeType);
      print(jsonData[0].runtimeType);
      List<Photo> ls = [];
      for(var item in jsonData){
        var albumId = item['albumId'];
        var id = item['id'];
        var title = item['title'];
        var url = item['url'];
        var thumbnailUrl =item['thumbnailUrl'];
        Photo p = new Photo(albumId, id, title, url, thumbnailUrl);
        ls.add(p);
      }
      return ls;
    }
    else {
      print('tai du lieu that bai');
      throw Exception("Loi lay du lieu: ${response.statusCode}");
    }
  }
}