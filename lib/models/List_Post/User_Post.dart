class User_Post{
  int id;
  String name;
  String image;
  User_Post({

    this.id,
    this.name,
    this.image,

  });

  factory User_Post.fromJson(Map<String, dynamic> json){
    return User_Post(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}