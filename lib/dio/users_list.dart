import 'package:flutter/material.dart';
import 'package:flutter_app_testing/dio/model/model.dart';
import 'package:flutter_app_testing/dio/service.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User> users = [];
  
  @override
  void initState() {
    super.initState();
    
    Service service = Service();
    
    service.users().then((list) {
        setState(() {
          users = list ?? [];
        });
    }).catchError((error){
      print("error: $error");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Users"),
          ),
          body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("id:"),
                            Text("${users[index].id}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("name:"),
                            Text("${users[index].name}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("phone:"),
                            Text("${users[index].phone}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("website:"),
                            Text("${users[index].website}")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }),
        ),
    );
  }
}
