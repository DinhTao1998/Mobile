import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
import 'UserDetail.dart';

class Profile extends StatefulWidget {
  User user;
  Profile({this.user});
  @override
  _proFileState createState() => _proFileState();
}

class _proFileState extends State<Profile> {
//  User __user = new User();
//  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////    fetchUsers(http.Client()).then((value){
////      setState(() {
////        __user = value;
////      });
////    });
////  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Thông tin tài khoản"),
        ),
        body: UserDetail(user: widget.user,)
    );

  }
}
