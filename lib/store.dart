import 'package:http/http.dart' as http;
import 'dart:convert';


List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  Store({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };

  static Future<List<Store>> fetchdata() async {
    String url="https://fakestoreapi.com/products";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('Tai du lieu thanh cong');
      var result = response.body;
      var jsonData = jsonDecode(result);
      print(jsonData.runtimeType);
      print(jsonData[0].runtimeType);
      List<Store> stores =storeFromJson(response.body);
      for (var item in jsonData) {
        var id = item['id'];
        var title = item['title'];
        var url = item['image'];
        var price = item['price'];
        var description = item['description'];
        var category = item['category'];
        var rating = item['rating'];

      }
      return stores;
    }
    else {
      print('tai du lieu that bai');
      throw Exception("Loi lay du lieu: ${response.statusCode}");

    }
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}