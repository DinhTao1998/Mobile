import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Profile/Profile.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
class EditUsername extends StatefulWidget{
  User user;

  EditUsername({this.user});
  @override
  _EditUsernameState createState() => _EditUsernameState();
}

class _EditUsernameState extends State<EditUsername>{
  User _user = new User();
  TextEditingController controller_name = TextEditingController();
  TextEditingController controller_phone = TextEditingController();
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_birthday = TextEditingController();
  TextEditingController controller_gender = TextEditingController();
  String _name ="";
  String _phone ='';
  String _email ='';
  String _birthday = '';
  String _gender= '';
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller_name.dispose();
    controller_phone.dispose();
    controller_email.dispose();
    controller_birthday.dispose();
    controller_gender.dispose();
    super.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
      setState(() {
        controller_name.text = widget.user.name;
        controller_phone.text = widget.user.phone;
        controller_birthday..text = widget.user.birthday;
        controller_email.text = widget.user.email;
        controller_gender.text = widget.user.gender;

      });
    }
//  Widget _ItemEdit(String title, String value, int pos){
//    return new Container(
//      padding: const EdgeInsets.only(bottom: 10.0),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Text(
//              title + ' :',
//            textAlign: TextAlign.start,
//            style: new TextStyle(
//              fontSize: 15.0,
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//          new TextField(
//            controller: controller,
//            autofocus:true,
//            decoration: new InputDecoration(
//            ),
//            maxLines: 1,
//            keyboardType: TextInputType.text,
//            style: TextStyle(
//              fontSize: 16.0,
//            ),
//            onChanged: (text){
//            },
//          ),
//        ],
//      ),
//    );
//  }
  Widget _Edit(){
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Name:',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new TextField(
                  controller: controller_name,
                  decoration: new InputDecoration(
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  onChanged: (text){
                    controller_name.text = text;
                  },
                ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Phone:',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new TextField(
                  controller: controller_phone,
                  decoration: new InputDecoration(
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  onChanged: (text){
                    controller_phone.text = text;
                  },
                ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Birthday:',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new TextField(
                  controller: controller_birthday,
                  decoration: new InputDecoration(
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  onChanged: (text){
                    controller_birthday.text = text;
                  },
                ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Email:',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new TextField(
                  controller: controller_email,
                  decoration: new InputDecoration(
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  onChanged: (text){
                    controller_email.text = text;
                  },
                ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  'Gender:',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new TextField(
                  controller: controller_gender,
                  decoration: new InputDecoration(
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  onChanged: (text){
                    controller_gender.text = text;
                  },
                ),
              ],
            ),
          ),

          new RaisedButton(
            child: Text(
              'Cập nhập',
                style: TextStyle(fontSize: 16.0),
            ),
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              onPressed:(){
              editUser(http.Client(), controller_name.text, controller_phone.text, controller_email.text, controller_birthday.text, 
                  controller_gender.text, widget.user).then((value){
                      setState(() {
                        _user = value;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>Profile (
                            user: _user,
                          ))
                      );
              });

            })
        ],
      ),
    );
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Chỉnh sửa thông tin"),
        ),
        body: _Edit()
    );
  }
}