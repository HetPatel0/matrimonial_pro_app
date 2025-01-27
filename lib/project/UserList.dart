import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/AddUser.dart';

class UserList extends StatefulWidget {
  final List<UserListData> users;

  const UserList({
    required this.users,
  });

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details List '),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: ListView(
            children: widget.users
                .map((user) => Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                        .withOpacity(0.5) // Dark theme shadow
                                    : Colors.grey
                                        .withOpacity(0.5), // Light theme shadow
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Name: ${user.firstName + " " + user.lastName} "),
                                    Text("Ciyt : ${user.city}"),
                                    Text("Mobile No: ${user.mobile}"),
                                    Text("Email : ${user.email}")
                                  ]),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.favorite)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {}, child: Icon(Icons.edit)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.users.remove(user);
                                        });
                                      },
                                      child: Icon(Icons.delete))
                                ],
                              )
                            ]),
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
