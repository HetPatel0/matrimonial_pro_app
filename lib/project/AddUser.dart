import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimonial_app/project/UserList.dart';
import 'package:matrimonial_app/project/particles_widget.dart';

class UserListData{
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String mobile;
  final String? gender;
  final String? city;
  final String dob;
  final int age;
  final List<String> hobbies;


  const UserListData({

    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.mobile,
    this.gender,
    this.city,
    required this.dob,
    required this.age,
    required this.hobbies,

  });
}

class Hobbies extends StatefulWidget {
  final Function(List<String>) onHobbiesChanged;

  const Hobbies({super.key, required this.onHobbiesChanged});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  final List<String> _selectedHobbies = [];

  void _handleHobbyChange(String hobby, bool selected) {
    setState(() {
      selected ? _selectedHobbies.add(hobby)
          : _selectedHobbies.remove(hobby);
    });
    widget.onHobbiesChanged(_selectedHobbies);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text("Hobbies : ",
              style: TextStyle(fontFamily: 'Font2', fontSize: 30)),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildCheckbox("Reading"),
              _buildCheckbox("Dancing"),
              _buildCheckbox("Singing"),
              _buildCheckbox("Swimming"),
              _buildCheckbox("Gaming"),
              _buildCheckbox("Drawing"),
            ],
          ),
        )
      ],
    );
  }

  CheckboxListTile _buildCheckbox(String hobby) {
    return CheckboxListTile(
      title: Text(hobby),
      value: _selectedHobbies.contains(hobby),
      onChanged: (bool? value) {
        _handleHobbyChange(hobby, value ?? false);
      },
    );
  }
}

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AdduserState();
}

class _AdduserState extends State<AddUser> {
  var first_name = TextEditingController();
  var last_name = TextEditingController();
  var address = TextEditingController();
  var email = TextEditingController();
  var mobile = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  List<String> selectedHobbies = [];
  List<UserListData> users =[];
  // In _AdduserState

  String? selectedCity;
  String? selectedgender;
  int age = 0;
  String dob = 'Select DOB';
  DateTime? date = DateTime.now();

  final _kaka = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          title: Text(
            'Add a User',
            style:
            TextStyle(fontFamily: 'Font1', fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _kaka,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "FirstName : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: first_name,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Last Name : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: last_name,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Address : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: address,
                            decoration: InputDecoration(
                              labelText: "Address",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Email : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Mobile no : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: mobile,
                            decoration: InputDecoration(
                              labelText: 'MobileNo',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Gender: ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                            value: null,
                            hint: Text('Select Gender'),
                            items: [
                              DropdownMenuItem(
                                  value: 'Male', child: Text('Male')),
                              DropdownMenuItem(
                                  value: 'Female', child: Text('Female')),
                              DropdownMenuItem(
                                  value: 'Others', child: Text('Others')),
                            ],
                            onChanged: (value) {
                              selectedgender = value;
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "City: ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                            value: null,
                            hint: Text('Select City'),
                            items: [
                              DropdownMenuItem(
                                  value: 'Rajkot', child: Text('Rajkot')),
                              DropdownMenuItem(
                                  value: 'Ahemdabad',
                                  child: Text('Ahemdabad')),
                              DropdownMenuItem(
                                  value: 'Vadodara', child: Text('Vadodara')),
                              DropdownMenuItem(
                                  value: 'Surat', child: Text('Surat')),
                            ],
                            onChanged: (value) {
                              selectedCity = value;
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "DOB  : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                            child: InkWell(
                              child: Text(
                                dob,
                              ),
                              onTap: () async {
                                date = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1991),
                                  lastDate: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                  ),
                                );

                                setState(() {
                                  dob =
                                  "${date!.day}-${date!.month}-${date!.year}";
                                  List<String> dobParts = dob.split("-");
                                  int day = int.parse(dobParts[0]);
                                  int month = int.parse(dobParts[1]);
                                  int year = int.parse(dobParts[2]);
                                  DateTime birthDate =
                                  DateTime(year, month, day);
                                  DateTime currentDate = DateTime.now();
                                  age = currentDate.year - birthDate.year;

                                  if (currentDate.month < birthDate.month ||
                                      (currentDate.month == birthDate.month &&
                                          currentDate.day < birthDate.day)) {
                                    age--;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Age is : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                            flex: 5,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2)),
                              ),
                              child: Container(
                                child: Text(age.toString()),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ), // In _AdduserState

// In build method, replace Hobbies() with:
                    Hobbies(
                      onHobbiesChanged: (hobbies) {
                        setState(() {
                          selectedHobbies = hobbies;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Password : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "Confirm Password : ",
                              style: TextStyle(
                                  fontFamily: 'Font2', fontSize: 30),
                            )),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: confirm_password,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                            ),
                          ),
                        )
                      ],
                    ),
                    // After Confirm Password Row
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_kaka.currentState!.validate()) {
                          if (password.text != confirm_password.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                            return;
                          }


                          users.add(UserListData(
                            firstName: first_name.text,
                            lastName: last_name.text,
                            address: address.text,
                            email: email.text,
                            mobile: mobile.text,
                            gender: selectedgender,
                            city: selectedCity,
                            dob: dob,
                            age: age,
                            hobbies: selectedHobbies,
                          ));


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserList(users: users),
                            ),
                          );
                          first_name.text='';
                          last_name.text='';
                          mobile.text ='';


                        }
                      },
                      child: Text('Submit', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
 }
}
