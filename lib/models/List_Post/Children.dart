class Children{
  int id;
  String content;
  String created_at;
  int user_id;
  String name;
  String image;
  Children({

    this.id,
    this.name,
    this.image,
    this.user_id,
    this.content,
    this.created_at,

  });

  factory Children.fromJson(Map<String, dynamic> json){
    return Children(
      id: json['id'],
      content: json['content'],
      created_at: json['created_at'],
      user_id: json['user_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}