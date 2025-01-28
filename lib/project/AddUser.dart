import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimonial_app/project/UserList.dart';

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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add a User',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.indigo.shade700,
        elevation: 5,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _kaka,
            child: ListView(
              children: [
                _buildFormRow(
                  label: "First Name:",
                  child: TextFormField(
                    controller: first_name,
                    decoration: _inputDecoration('Enter first name'),
                  ),
                ),
                _buildFormRow(
                  label: "Last Name:",
                  child: TextFormField(
                    controller: last_name,
                    decoration: _inputDecoration('Enter last name'),
                  ),
                ),
                _buildFormRow(
                  label: "Address:",
                  child: TextFormField(
                    controller: address,
                    decoration: _inputDecoration('Enter address'),
                  ),
                ),
                _buildFormRow(
                  label: "Email:",
                  child: TextFormField(
                    controller: email,
                    decoration: _inputDecoration('Enter email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                _buildFormRow(
                  label: "Mobile no:",
                  child: TextFormField(
                    controller: mobile,
                    decoration: _inputDecoration('Enter mobile number'),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                _buildFormRow(
                  label: "Gender:",
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Select Gender'),
                    items: ['Male', 'Female', 'Others']
                        .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                        .toList(),
                    onChanged: (value) => selectedgender = value,
                  ),
                ),
                _buildFormRow(
                  label: "City:",
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Select City'),
                    items: ['Rajkot', 'Ahemdabad', 'Vadodara', 'Surat']
                        .map((city) => DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    ))
                        .toList(),
                    onChanged: (value) => selectedCity = value,
                  ),
                ),
                _buildFormRow(
                  label: "DOB:",
                  child: InkWell(
                    onTap: _selectDate,
                    child: InputDecorator(
                      decoration: _inputDecoration('Select Date of Birth'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dob),
                          Icon(Icons.calendar_today,
                              color: Colors.indigo.shade700),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildFormRow(
                  label: "Age:",
                  child: InputDecorator(
                    decoration: _inputDecoration('Age'),
                    child: Text(age.toString(),
                        style: TextStyle(color: Colors.grey.shade800)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Hobbies(
                    onHobbiesChanged: (hobbies) =>
                        setState(() => selectedHobbies = hobbies),
                  ),
                ),
                _buildFormRow(
                  label: "Password:",
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: _inputDecoration('Enter password'),
                  ),
                ),
                _buildFormRow(
                  label: "Confirm Password:",
                  child: TextFormField(
                    controller: confirm_password,
                    obscureText: true,
                    decoration: _inputDecoration('Confirm password'),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade700,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormRow({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(flex: 5, child: child),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.indigo.shade700, width: 2),
      ),
    );
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dob = DateFormat('dd-MM-yyyy').format(date!);
        age = DateTime.now().year - date!.year;
        if (DateTime.now().isBefore(
            DateTime(date!.year, date!.month, date!.day).add(Duration(days: 1)))) {
          age--;
        }
      });
    }
  }

  void _submitForm() {
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
        MaterialPageRoute(builder: (context) => UserList(users: users)),
      );

      // Clear controllers
      first_name.clear();
      last_name.clear();
      mobile.clear();
      // ... clear other controllers as needed ...
    }
  }
}

// Keep your existing Hobbies widget class with updated styling
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
      selected ? _selectedHobbies.add(hobby) : _selectedHobbies.remove(hobby);
    });
    widget.onHobbiesChanged(_selectedHobbies);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hobbies",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            'Reading', 'Dancing', 'Singing',
            'Swimming', 'Gaming', 'Drawing'
          ].map((hobby) => FilterChip(
            label: Text(hobby),
            selected: _selectedHobbies.contains(hobby),
            onSelected: (selected) => _handleHobbyChange(hobby, selected),
            selectedColor: Colors.indigo.shade100,
            checkmarkColor: Colors.indigo.shade700,
            labelStyle: TextStyle(
              color: _selectedHobbies.contains(hobby)
                  ? Colors.indigo.shade700
                  : Colors.grey.shade800,
            ),
          )).toList(),
        ),
      ],
    );
  }
}