import 'dart:convert';

import 'package:zxcv/articles.dart';
import 'package:http/http.dart' as http;

class ArticlesData {
  List<Articles> articleslist = <Articles>[];
  String url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-12-10&sortBy=publishedAt&apiKey=430b205f05f34cae9f7323718b7b99c0";

  Future getarticles() async {
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);

    var jsondata = jsonDecode(response.body);

    print(jsondata);
if (jsondata['status'] =='ok') {

  jsondata['articles'].forEach( (element){

    Articles articles = Articles(
        element['author']??"",
        element['title']??"",
        element['description']??"",
        element['url']??"",
        element['urlToImage']??"https://upload.wikimedia.org/wikipedia/commons/b/b9/Youtube_loading_symbol_1_(wobbly).gif",
        element['publishedAt']??"",
        element['content']??"");
    articleslist.add(articles);




  });
}





  }







}
