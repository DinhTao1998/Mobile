
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/User.dart';
import 'EditUsername.dart';

class UserDetail extends StatefulWidget {
  User user;
  UserDetail({this.user});
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  Widget build(BuildContext context) {
    Widget _space(){
      return Container(
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
      );
    };
    Widget _buildrecord(IconData icon1,String name, String value, IconData icon2){
      final Color _color = Colors.amber;
      return Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex:1,
              child: Icon(
                icon1,
                color: _color,
              ),
            ),
            new Expanded(
              flex:5,
              child: new Text(
                name,
                style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            new Expanded(
                flex:5,
                child: new Text(
                  value,
                  textAlign: TextAlign.end,
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                )
            ),
            new Expanded(
                flex:2,
                child:  new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        icon2,
                        color: _color,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditUsername(
                                user: widget.user,
                            ))
                        );
                      },
                    ),
                  ],
                )
            )
          ],
        ),
      );
    };

    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
              padding: const EdgeInsets.only(top: 20.0),
              height: 150.0,
              decoration: BoxDecoration(
                color: const Color(0xFFFF7043),
              ),
              child: Center(
                child:  Column(
                  children: <Widget>[
                    new GestureDetector(
                      onTap:(){

                      },
                      child: CircleAvatar(
                        minRadius: 25.0,
                        maxRadius: 40.0,
                        backgroundImage:(widget.user.image!= null)? NetworkImage(widget.user.image??''):NetworkImage(''),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    new Text(
                      "Chỉnh sửa",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    )
                  ],
                ),
              )
          ),
          _buildrecord(Icons.person,"username",widget.user.name??'',Icons.play_arrow),
          Divider(),
          _buildrecord(Icons.person_pin,"Họ tên",widget.user.full_name??'',Icons.play_arrow),
          _space(),
          _buildrecord(Icons.face,"Giới tính",widget.user.gender??'',Icons.play_arrow),
          Divider(),
          _buildrecord(Icons.cake,"Ngày sinh",widget.user.birthday??'',Icons.play_arrow),
          Divider(),
          _buildrecord(Icons.phone_iphone,"Số điện thoại",widget.user.phone??'',Icons.play_arrow),
          Divider(),
          _buildrecord(Icons.email,"Email",widget.user.email??'',Icons.play_arrow),
          Divider(),
          _buildrecord(Icons.link,"Tài khoản xã hội",widget.user.link??'',Icons.play_arrow),
          _space(),
          new Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex:5,
                  child: new Text(
                    "Thay đổi mật khẩu",
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Expanded(
                    flex:1,
                    child:  new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color:Colors.amber ,
                          ),
                          onPressed: () {
                          },
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
          _space(),
        ],
      ),
    );
  }
}
