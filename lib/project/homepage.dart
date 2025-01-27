import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/AddUser.dart';
import 'package:matrimonial_app/project/UserList.dart';
import 'package:matrimonial_app/project/meteors.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> iconlist = [
    {'icon': Icons.person_add, 'title': 'Add User', 'route': AddUser()},
    {'icon': Icons.list, 'title': 'User List', 'route': UserListScreen(),},
    {'icon': Icons.favorite, 'title': 'Favourite', 'route': Favourite()},
    {'icon': Icons.info, 'title': 'About Us', 'route': AboutUs()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrimonial App',
            style: TextStyle(fontFamily: 'Font1', fontWeight: FontWeight.w800)),
        backgroundColor: Colors.blueAccent,
      ),
      body: MeteorShower(
        numberOfMeteors: 10,
        duration: Duration(seconds: 5),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 45),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: iconlist.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => iconlist[index]['route'],
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconlist[index]['icon'],
                            size: 50.0, color: Colors.white),
                        SizedBox(height: 10.0),
                        Text(
                          iconlist[index]['title'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Add this new screen for showing user list
class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('User List Screen - Implement your user list here'),
      ),
    );
  }
}

// Favourite Screen
class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Center(
        child: Text('Favourite Screen'),
      ),
    );
  }
}

// About Us Screen
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Text('About Us Screen'),
      ),
    );
  }
}