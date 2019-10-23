class User_Followed{
  int id;
  String name;
  String image;

  User_Followed({

    this.id,
    this.name,
    this.image,
  });

  factory User_Followed.fromJson(Map<String, dynamic> json){
    return User_Followed(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}