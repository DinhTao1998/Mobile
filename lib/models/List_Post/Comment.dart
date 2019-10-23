import 'package:mobile/models/List_Post/Children.dart';

class Comment{
  int id;
  String content;
  String created_at;
  int user_id;
  String name;
  String image;
  List<Children> children;
  Comment({

    this.id,
    this.name,
    this.image,
    this.user_id,
    this.content,
    this.created_at,
    this.children,

  });

  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
      id: json['id'],
      content: json['content'],
      created_at: json['created_at'],
      user_id: json['user_id'],
      name: json['name'],
      image: json['image'],
      children: json['children']!= null?parseChildren(json['children']):null,
    );
  }

  static List<Children> parseChildren(json) {
    var list = json as List;
    List<Children> listChildren =
    list.map((data) => Children.fromJson(data)).toList();
    return listChildren;
  }
}