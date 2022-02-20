import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IpResponseModel_categories {
  final List<String>? categories;

  IpResponseModel_categories({this.categories});

  factory IpResponseModel_categories.fromJson(List<dynamic> json){
    return IpResponseModel_categories(
      categories: new List<String>.from(json),
    );
  }

  List<String>? toJson() {
    List<String>? data = this.categories;
    return data;
  }

  //@override
  //String toString() => '$categories';
}