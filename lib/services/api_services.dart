

 import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_paper/models/articale.dart';

class ApiServices{
  final endPoint="https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=ba1ec4437ce441f394db06676ed06f79";

  Future<List<Articale>> getArticle() async{

   Response response = await get(Uri.parse(endPoint)); // get response from uri

   if(response.statusCode == 200){

     Map<String , dynamic> json = jsonDecode(response.body); // asing to json all data to map

     List<dynamic> body = json['articles']; // asing to body all article data

     List<Articale> article = body.map((dynamic item) => Articale.fromJson(item)).toList();

     return article;

   }else{
     throw("cant\'t get article");
   }
  }
 }