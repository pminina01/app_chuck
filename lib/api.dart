import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:networking_examples/ip_categories.dart';
import 'package:networking_examples/ip_joke.dart';

class Api{
  final _baseUrl = 'https://api.chucknorris.io';

  Future<dynamic> fetch(String url) async {
    final response = await get(Uri.parse(_baseUrl+url));
    return jsonDecode(response.body).toString();
  }
  Future<List<String>?> fetchCategories() async{
    final response = await get(Uri.parse(_baseUrl+'/jokes/categories'));
    List jsonResponse = jsonDecode(response.body);
    //return jsonResponse.map((data) => new IpResponseModel_categories.fromJson(data)).toList();
    return IpResponseModel_categories.fromJson(jsonResponse).categories;
  }

  Future<List> fetchJoke(String category) async{
    final response = await get(Uri.parse(_baseUrl+'/jokes/random?category='+category));
    //return json.decode(response.body).map((data) => new IpResponseModel.fromJson(data)).toList();
    IpResponseModel data = IpResponseModel.fromJson(jsonDecode(response.body));
    return [data.categories, data.createdAt, data.iconUrl,data.id,  data.updatedAt,  data.url, data.value];
  }
}

