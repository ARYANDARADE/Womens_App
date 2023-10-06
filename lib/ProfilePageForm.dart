import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilePageForm extends StatefulWidget {
  @override
  _ProfilePageFormState createState() => _ProfilePageFormState();
}

class _ProfilePageFormState extends State<ProfilePageForm> {
  String name = '';
  String number = '';
  int age = 0;
  String selectedGender = 'Male'; // Default to Male
  List<String> emergencyContactRelations = [];
  List<String> emergencyContactNumbers = [];

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
                      emergencyContactRelations.add(value);
                    });
                  },
                  decoration: InputDecoration(labelText: 'Relation'),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      emergencyContactNumbers.add(value);
                    });
                  },
                  decoration: InputDecoration(labelText: 'Contact No.'),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      emergencyContactRelations.add(value);
                    });
                  },
                  decoration: InputDecoration(labelText: 'Relation'),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      emergencyContactNumbers.add(value);
                    });
                  },
                  decoration: InputDecoration(labelText: 'Contact No.'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Create a Firestore instance
                  FirebaseFirestore firestore = FirebaseFirestore.instance;

                  // Create a new document in the "profiles" collection
                  await firestore.collection('profiles').add({
                    'name': name,
                    'number': number,
                    'age': age,
                    'gender': selectedGender,
                  });

                  // Create a new document in the "emergencyContacts" collection
                  for (int i = 0; i < emergencyContactRelations.length; i++) {
                    await firestore.collection('emergencyContacts').add({
                      'relation': emergencyContactRelations[i],
                      'contact': emergencyContactNumbers[i],
                    });
                  }

                  // Data successfully stored in Firestore
                  print('Data stored in Firestore.');
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: Text('Submit'),
            ),

          ],
        ),
      ),
    );
  }
}
