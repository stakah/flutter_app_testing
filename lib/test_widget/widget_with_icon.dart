import 'package:flutter/material.dart';

class WidgetWithIcon extends StatefulWidget {
  @override
  _WidgetWithIconState createState() => _WidgetWithIconState();
}

class _WidgetWithIconState extends State<WidgetWithIcon> {
  var message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context){
          return Column(
            children: [
              FlatButton(
                child: Row(
                  children: [
                    Icon(Icons.arrow_forward),
                    Text("Click me!"),
                  ],
                ),
                onPressed: (){
                  setState(() {
                    message = "button pressed";
                  });
                },

              ),
              Text("$message"),
            ],
          );
        },
      ),
    );
  }
}
