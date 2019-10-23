import 'package:flutter/material.dart';
import 'validateMau.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
import '../Profile/Profile.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User _user = new User();
  TextEditingController controller_email= TextEditingController();
  TextEditingController controller_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        home: Scaffold(

            body: Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                constraints: BoxConstraints.expand(),
                color: Colors.amber[300],
                child: SingleChildScrollView(
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
//                      child: Image.asset('assets/images/logo.jpg'),
//                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          controller: controller_email,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(hintText: 'Tên đăng nhập...'
                              ),
                        )),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: TextField(
                              controller: controller_password,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Mật khẩu...'
                                  ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                      child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: RaisedButton(
                            color: Colors.orangeAccent[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              "ĐĂNG NHẬP",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),

                            onPressed: (){
                              Signin(http.Client(), controller_email.text, controller_password.text).then((value){
                                if(value !=null) {
                                  setState(() {
                                    _user = value;
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          Profile(
                                            user: _user,
                                          ))
                                  );
                                }

                              });

                            },
                          )),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text("Quên mật khẩu?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic)),
                        )),

                    Padding(
                      padding: EdgeInsets.only(top: 110.0, bottom: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    Colors.black12,
                                    Colors.black,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            width: 100.0,
                            height: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              "hoặc",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: "WorkSansMedium"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black12,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 1.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            width: 100.0,
                            height: 1.0,
                          ),
                        ],
                      ),
                    ),

                    new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              child: RaisedButton(
                                color: Colors.orangeAccent[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                                child: Text(
                                  "Đăng nhập bằng FB",
                                  style:
                                  TextStyle(fontSize: 16.5, color: Colors.white),
                                ),
                                onPressed: (){},
                              ),
                          ),

                          SizedBox(
                            child: RaisedButton(
                              color: Colors.orangeAccent[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                              child: Text(
                                "Đăng ký",
                                style:
                                TextStyle(fontSize: 16.5, color: Colors.white),
                              ),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Valid(
                                    ))
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )))));
  }

}
