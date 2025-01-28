import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/AddUser.dart';

class UserList extends StatefulWidget {
  final List<UserListData> users;
  const UserList({required this.users});
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  TextEditingController searchController = TextEditingController();
  List<UserListData> _filteredUsers = [];


  @override
  void initState() {
    super.initState();
    // Initialize with all users
    _filteredUsers = widget.users;
  }

  void _updateFilteredUsers(String query) {
    setState(() {

      if (query.isEmpty) {
        _filteredUsers = widget.users;
      } else {
        _filteredUsers = widget.users.where((user) {
          return user.firstName.toLowerCase().contains(query.toLowerCase()) ||user.city.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details List', style: TextStyle(fontFamily: "Font1")),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  // onChanged: _updateFilteredUsers, // Real-time search
                  decoration: InputDecoration(
                    labelText: 'Search here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _updateFilteredUsers(searchController.text);
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              child: ListView(
                children: _filteredUsers // Use filtered list here!
                    .map((user) => Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black.withOpacity(0.5)
                            : Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${user.firstName} ${user.lastName}",
                              style: TextStyle(fontFamily: "Font2", fontSize: 25),
                            ),
                            Text("City: ${user.city}", style: TextStyle(fontFamily: "Font2", fontSize: 25)),
                            Text("Mobile No: ${user.mobile}", style: TextStyle(fontFamily: "Font2", fontSize: 25)),
                            Text("Email: ${user.email}", style: TextStyle(fontFamily: "Font2", fontSize: 25)),
                            Text("Hobbies: ${user.hobbies}", style: TextStyle(fontFamily: "Font2", fontSize: 25)),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(onTap: () {}, child: Icon(Icons.favorite)),
                            SizedBox(height: 15),
                            InkWell(onTap: () {}, child: Icon(Icons.edit)),
                            SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.users.remove(user);
                                  _filteredUsers.remove(user); // Also remove from filtered list
                                });
                              },
                              child: Icon(Icons.delete),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}