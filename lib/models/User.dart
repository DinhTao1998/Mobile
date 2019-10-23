import 'dart:convert';
import 'dart:ffi';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mobile/models/List_Post.dart';
import 'package:mobile/models/Rate_User.dart';
import 'package:mobile/models/User_Followed.dart';
class User{
  String token;
  int id;
  String name;
  String email;
  String full_name;
  String image;
  String birthday;
  String gender;
  String phone;
  String link;
  Float rate;
  List<User_Followed> user_followed;
  List<Rate_User> user_rate;
  List<List_Post> list_post;

  User({
    this.token,
    this.id,
    this.name,
    this.email,
    this.full_name,
    this.image,
    this.birthday,
    this.gender,
    this.phone,
    this.link,
    this.rate,
    this.user_rate,
    this.list_post,
    this.user_followed,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      token: json['token'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      full_name: json['full_name'],
      image: json['image'],
      birthday: json['birthday'],
      gender: json['gender'],
      phone: json['phone'],
      rate: json['rate'],
      user_rate:json['user_rate']!= null ?parseRateUser(json['user_rate']):null,
      user_followed:json['user_followed']!= null? parseUserFollowed(json['user_followed']):null,
      list_post: json['list_post']!= null?parseListPost(json['list_post']):null,

    );
  }
  static List<Rate_User> parseRateUser(json) {
    var list = json as List;
    List<Rate_User> rateUserList =
    list.map((data) => Rate_User.fromJson(data)).toList();
    return rateUserList;
  }

  static List<User_Followed> parseUserFollowed(json) {
    var list = json as List;
    List<User_Followed> userFollowedList =
    list.map((data) => User_Followed.fromJson(data)).toList();
    return userFollowedList;
  }

  static List<List_Post> parseListPost(json) {
    var list = json as List;
    List<List_Post> listPost =
    list.map((data) => List_Post.fromJson(data)).toList();
    return listPost;
  }
}

Future<User> fetchUsers(http.Client client) async{
  sleep(Duration(seconds: 3));
    var tokenData = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM4ZTA5ZDUxODUwYTBlNDE1NTdkNWZhMWVlNTI0NDM5OGZkN2NhYTllOWYzNDQ1MzY2ZTQzNjhmYjE3Yjg0ZGY4NDM2MGRiNDAzNzI1NWM5In0.eyJhdWQiOiIxIiwianRpIjoiMzhlMDlkNTE4NTBhMGU0MTU1N2Q1ZmExZWU1MjQ0Mzk4ZmQ3Y2FhOWU5ZjM0NDUzNjZlNDM2OGZiMTdiODRkZjg0MzYwZGI0MDM3MjU1YzkiLCJpYXQiOjE1NzA1MTc1NTIsIm5iZiI6MTU3MDUxNzU1MiwiZXhwIjoxNjAyMTM5OTUyLCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.L2-qAsJ8VsrQEVGPPqIyKwOQ7Ka-oKEaFCk9GhzNeynLPiqqZ-rnccnRDhjqCUkL6JuH9JZ_KRio45HjIMgd7H1hxwg8J4PbECdl2lnb2HYWwX7lbHmCCYUO2OxQ5rfqkkl-SFFMglLE7DTMML68QpxbfSdBSOhhsZnN8gvPXUBolgYaSGvRVxTOURjixxf5a8AqWdyyy5BLTidt5qJEkoCXUvX5qUjNv4Mk9aLPpdo6kXccjXAHSEwmt31xnyP51yT0dPHhf39v8_pxK96Ew1nIrbQm8dns6KU7J-IoT_N23qduS7QFv6TIbGL9uIZjFUKUiPIzdcYTjvx9xYD6izGpPLBs52vjwbMrevRu6HIGl8kQA2AD3ZPJSxaP8H8nhP_ilfGnRSmPnETMk_6Ho7n4F0S-VtO2h-F7qgpjTzyvZ2rZDjOYnL0Z5dVLgA_VrrienkS6O-0cX8yUv8EZ8Md2u_NCLm8-eoSYDrRxCsn4xcHkgGtGait6H5u1WF5jLN8U2sIL9CkYOnu70Z1nesntEsjYVPoqE5t_MTwQ0MbLWMszg7IHKnvPrO1RUrl1bHDAj76h_sEmGUDFOaIDsvV-xyJ4nmxy2yjto3t_oOogxSsLIM1wcv5Zf4l5C1s8R5fe0aCnuPzsnjrR4p2dh-kOv6bZ3hAQOK7vzNZgv3Q',
      'Accept': 'application/json',
    };
    final response = await client.get(
        'http://tfashion.store/RestfulApi/public/api/User/7',
        headers: tokenData);
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse['response'] == 200) {
       Map<String, dynamic> mapUser = mapResponse['data']['7'];
      final _user =User.fromJson(mapUser);
       return  _user;
      }
      else
        return User();
    }
    else
      throw Exception('Error');
}

Future<User> editUser(http.Client client, String name, String phone, String email, String birthday, String gender, User u) async{
  sleep(Duration(seconds: 3));
  dynamic id = u.id.toString();
  dynamic url = 'http://tfashion.store/RestfulApi/public/api/User/' + id;
  var tokenData = {
    'Authorization':'Bearer ' + u.token,
    'Accept': 'application/json',
  };
  var data ={
    'name' : name,
    'phone':phone,
    'email':email,
    'birthday':birthday,
    'gender': gender,
  };
  try{
    Response response = await Dio().put(url, data: data, options: Options(headers:tokenData));
    print(response);
    if (response.statusCode ==200)
      return User.fromJson(response.data['data']);
    else
      return User();
  }on DioError catch (e) {
    print(e.request);
    print(e.message);
  }
}

Future<User> Signin(http.Client client, String email, String password) async {
  sleep(Duration(seconds: 3));
  var data = {
    'email': email,
    'password': password,
  };
  try {
    Response response = await Dio().post(
        'http://tfashion.store/RestfulApi/public/api/Login',
        data: data);
    print(response);
    if (response.statusCode ==200)
      return User.fromJson(response.data['data']);
      else
        return User();
  } on DioError catch (e) {
    print(e.request);
    print(e.message);
  }
}
