import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/AddUser.dart';

import 'package:matrimonial_app/project/aboutUs.dart';


class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> iconlist = [
    {'icon': Icons.person_add, 'title': 'Add User', 'route': AddUser()},
    {'icon': Icons.list_alt, 'title': 'User List', 'route': UserListScreen()},
    {'icon': Icons.favorite_border, 'title': 'Favourite', 'route': Favourite()},
    {'icon': Icons.info_outline, 'title': 'About Us', 'route': AboutUs()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrimonial App',

            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
        elevation: 5,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            itemCount: iconlist.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => iconlist[index]['route']),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(iconlist[index]['icon'],
                            size: 34, color: Colors.indigo.shade800),
                      ),
                      SizedBox(height: 15),
                      Text(
                        iconlist[index]['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
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
    );
  }
}

class UserListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = List.generate(
    10,
        (index) => {
      'name': 'User ${index + 1}',
      'age': (25 + index).toString(),
      'location': 'City ${index + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.indigo.shade700,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: users.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.indigo.shade800),
                ),
              ),
              title: Text(users[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('Age: ${users[index]['age']}'),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
          );
        },
      ),
    );
  }
}

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.indigo.shade700,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 50, color: Colors.pink.shade300),
            SizedBox(height: 20),
            Text(
              'No Favourites Yet',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            SizedBox(height: 10),
            Text(
              'Your favourite profiles will appear here',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}

