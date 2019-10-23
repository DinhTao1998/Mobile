class User_Rate{
  int id;
  String name;
  String image;
  int rate;
  String comment;
  String user_id;

  User_Rate({

    this.id,
    this.name,
    this.image,
    this.rate,
    this.comment,
    this.user_id,

  });

  factory User_Rate.fromJson(Map<String, dynamic> json){
    return User_Rate(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rate: json['rate'],
      comment: json['comment'],
      user_id: json['user_id'],
    );
  }
}