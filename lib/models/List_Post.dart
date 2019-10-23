import 'package:mobile/models/List_Post/Comment.dart';
import 'package:mobile/models/List_Post/User_Post.dart';
import 'package:mobile/models/List_Post/User_Rate.dart';

class List_Post{
  int id;
  String content;
  String image;
  int price;
  int rate;
  String location;
  String created_at;
  User_Post user_post;
  List<User_Rate> user_rate;
  List <Comment> comment;

  List_Post({

    this.id,
    this.image,
    this.comment,
    this.rate,
    this.created_at,
    this.content,
    this.location,
    this.price,
    this.user_post,
    this.user_rate,

  });

  factory List_Post.fromJson(Map<String, dynamic> json){
    return List_Post(
      id: json['id'],
      content: json['content'],
      image: json['image'],
      created_at: json['created_at'],
      rate: json['rate'],
      price: json['price'],
      location: json['location'],
      user_post:User_Post.fromJson(json['user_post']),
      user_rate:json['user_rate']!=null?parseUserRate(json['user_rate']):null,
      comment:json['comment']!= null?parseComment(json['comment']):null,


    );
  }
  static List<User_Rate> parseUserRate(json) {
    var list = json as List;
    List<User_Rate> listUserRate =
    list.map((data) => User_Rate.fromJson(data)).toList();
    return listUserRate;
  }

  static List<Comment> parseComment(json) {
    var list = json as List;
    List<Comment> listComment =
    list.map((data) => Comment.fromJson(data)).toList();
    return listComment;
  }
}