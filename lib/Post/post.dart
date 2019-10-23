import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;

  class post extends StatefulWidget {
    @override
    _postState createState() => _postState();
  }

  class _postState extends State<post> {
    String _content;
    String _local;
    String _price;

    @override
    Widget build(BuildContext context) {
      final TextField _content = new TextField(
        decoration: new InputDecoration.collapsed(
          hintText: "Mô tả sản phẩm.",
        ),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontSize: 20.0,
        ),
      );

      final TextField _price = new TextField(
        decoration: new InputDecoration.collapsed(
          hintText: "Nhập giá sản phẩm.",
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      );

      final TextField _local = new TextField(
        decoration: new InputDecoration.collapsed(
          hintText: "Nhập địa chỉ.",
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      );

      Widget _buildrecord(IconData icon, String title){
        final Color _color = Colors.amber;
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            children: <Widget>[
              new Icon(icon,color:_color),
              new Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        );
      };

      Widget User =  new Container(
        child: new Row(
          children: <Widget>[
             new Container(
                  padding: const EdgeInsets.all(10.0),
                  child:CircleAvatar(
                    minRadius: 25.0,
                    maxRadius: 30.0,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTMaDhPg0fZT1TI9BW7jsGzTCEnNp5w2T9eE5PGEGvPMsPLyAbi'),
                    backgroundColor: Colors.transparent,
                  )
                ),
            new Expanded(
                  child: new Text(
                  "Trần Đình Tạo",
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                )
            ),
           new Container(
             padding: const EdgeInsets.all(10.0),
             child:  new RaisedButton(
               child:  new Text(
                 "+ Album",
                 style: TextStyle(fontSize: 16.0),

               ),
               elevation: 5.0,
               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
               onPressed: (){},

             ),
           )
          ],
        ),
      );
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Tạo bài viết"),
          actions: <Widget>[
            Container(
              width: 80,
              child: IconButton(
                icon: Text(
                  'ĐĂNG',
                  style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,

                ),
                onPressed: () {
                },
              ),
            )
          ],
        ),
        body:SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              User,
              Divider(),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(bottom: 190.0),
                child: _content,
              ),
              Divider(),
              _buildrecord(Icons.add_a_photo,"Ảnh/Video"),
              Divider(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[

                    new Container(
                        padding: const EdgeInsets.only(right:20.0),
                        child:new Icon(Icons.attach_money,color:Colors.amber)),
                    new Container(
                        child: new Expanded(child: _price,))
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[

                    new Container(
                        padding: const EdgeInsets.only(right:20.0),
                        child:new Icon(Icons.location_on,color:Colors.amber)),
                    new Container(
                        child: new Expanded(child: _local,))
                  ],
                ),
              ),

            ],
          ),
        )

      );

    }
  }