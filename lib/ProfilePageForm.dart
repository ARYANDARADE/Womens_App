import 'package:flutter/material.dart';

class ProfilePageForm extends StatefulWidget {
  @override
  _ProfilePageFormState createState() => _ProfilePageFormState();
}

class _ProfilePageFormState extends State<ProfilePageForm> {
  String name = '';
  String number = '';
  int age = 0;
  String selectedGender = 'Male'; // Default to Male
  List<Map<String, String>> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  number = value;
                });
              },
              decoration: InputDecoration(labelText: 'Number'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(labelText: 'Age'),
            ),
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              items: ['Male', 'Female', 'Others']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
              hint: Text('Select Gender'),
            ),
            Text('Emergency Contacts:'),

              Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        emergencyContacts[0]['relation'] = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Relation'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        emergencyContacts[0]['Contact'] = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Contact No.'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        emergencyContacts[1]['relation'] = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Relation'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        emergencyContacts[1]['Contact'] = value;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Contact No.'),
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                // Handle the submit action here
                // You can access the entered data like name, number, age, selectedGender, and emergencyContacts
                // For example, you can print them:
                print('Name: $name');
                print('Number: $number');
                print('Age: $age');
                print('Gender: $selectedGender');
                print('Emergency Contacts: $emergencyContacts');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
