class Rate_User{
  int id;
  String name;
  String image;
  int rate;
  String comment;
  String user_rate_id;

  Rate_User({

    this.id,
    this.name,
    this.image,
    this.rate,
    this.comment,
    this.user_rate_id

  });

  factory Rate_User.fromJson(Map<String, dynamic> json){
    return Rate_User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rate: json['rate'],
      comment: json['comment'],
      user_rate_id: json['user_rate_id'],
    );
  }
}