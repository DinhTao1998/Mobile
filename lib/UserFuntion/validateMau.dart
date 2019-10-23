import 'package:flutter/material.dart';
import 'login.dart';
class Valid extends StatefulWidget {
  @override
  _ValidState createState() => _ValidState();
}

class _ValidState extends State<Valid> {
//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber[300]
      ),
      home: new Scaffold(
          appBar: new AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: new Text('Đăng ký tài khoản'),
        ),
           body: new SingleChildScrollView(
              child: new Container(
                  margin: new EdgeInsets.all(15.0),
                  child: new Form(
                    key: _formKey,
                   autovalidate: _autoValidate,
                     child: FormUI(),
          ),
        ),
      ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: InputDecoration(
              labelText: 'Họ Tên',
              prefixIcon: Container(
                  width:50,
                  child: Icon(Icons.person),
              ),
          ),
          keyboardType: TextInputType.text,
          validator: validateName,
        ),

        new TextFormField(
          decoration: InputDecoration(
            labelText: 'Username',
            prefixIcon: Container(
              width:50,
              child: Icon(Icons.person),
            ),
          ),
          keyboardType: TextInputType.text,
          //validate
        ),

        new TextFormField(
          decoration: InputDecoration(
              labelText: 'Điện thoại',
            prefixIcon: Container(
              width: 50,
              child: Icon(Icons.phone),
            ),
          ),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
        ),

        new TextFormField(
          decoration: InputDecoration(
              labelText: 'Email',
            prefixIcon: Container(
              width: 50,
              child: Icon(Icons.email),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
        ),

        new TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Container(
              width: 50,
              child: Icon(Icons.lock),
            ),
          ),
          obscureText: true,
          validator: validatePassword,
        ),

        new TextFormField(
          decoration: InputDecoration(
            labelText: 'Nhập lại password',
            prefixIcon: Container(
              width: 50,
              child: Icon(Icons.lock),
            ),
          ),
          obscureText: true,
//          validator: validatePassword,
        ),

        new SizedBox(
          height: 30.0,
        ),

        SizedBox(
          width: 190,
          height: 45,
          child: RaisedButton(
            color: Colors.orangeAccent[700],
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(8.0))),
//                      onPressed: onChangePass,
            child: Text(
              "Đăng ký",
              style:
              TextStyle(fontSize: 16.5, color: Colors.white),
            ),
            onPressed: (){

          }
          ),
        ),

        new SizedBox(
          height: 12.0,
        ),

        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0),
            child: new GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login(
                    ))
                );
              },
              child: Center(
                  child: RichText(
                      text: TextSpan(
                        text: "Đã có tài khoản? ",
                        style: TextStyle(
                            color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Đăng nhập",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 16)
                          )
                        ],
                      )
                  )
              ),
            )
        ),
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Họ tên không hợp lệ';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'SĐT không hợp lệ';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email không hợp lệ';
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Password phải có ít nhất 8 kí tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt';
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}