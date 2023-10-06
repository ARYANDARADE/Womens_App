import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProfilePageForm extends StatefulWidget {
  @override
  _ProfilePageFormState createState() => _ProfilePageFormState();
}

class _ProfilePageFormState extends State<ProfilePageForm> {
  String? dropValue;
  String name = '';
  String number = '';
  int age = 0;
  String selectedGender = 'Male'; // Default to Male
  List<String> emergencyContactRelations = [];
  List<String> emergencyContactNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1100,
          child: Stack(
            children: [
              // Background Image
              Image.asset(
                'assets/images/pink2.jpg', // Replace with your image path
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              // Container with Semi-Transparent Color
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
              ),
              // Form Content
              Stack(
                children:[
                  Positioned(
                    top: 90.0, // Adjust the space between the top of the screen and the text
                    left: 20,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Color(0xff37949d), size: 30),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          '   Profile Form',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff37949d),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Positioned(
                    top: 150.0, // Adjust the space between the text and the form
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    label: Text('   Name',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.person, color:Color(0xff37949d),size: 35,),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                                    SizedBox(height: 30,),
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      number = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    label: Text('   Number',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.phone, color:Color(0xff37949d),size: 35,),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Color(0xfff6b4bb),
                                  border: Border.all(
                                    color: Color(0xff37949d),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      age = int.tryParse(value) ?? 0;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    label: Text('   Age',
                                      style: TextStyle(
                                        color: Color(0xFF383330),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                      child: Icon(Icons.cake, color:Color(0xff37949d),size: 35,),
                                    ),
                                    labelStyle: TextStyle(
                                      color: Color(0xFF383330),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                                SizedBox(height: 30,),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Row(
                                      children: [
                                        Icon(
                                          Icons.list,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Gender??',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: ['Male', 'Female', 'Others']
                                        .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value!;
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: 300,
                                      padding: const EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        // border: Border.all(
                                        //   color: Colors.black26,
                                        // ),
                                        color: const Color(0xff37949d),
                                      ),
                                      elevation: 2,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_downward_outlined,
                                      ),
                                      iconSize: 20,
                                      iconEnabledColor: Colors.white,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff7eabb6),
                                      ),
                                      //offset: const Offset(-20, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all(6),
                                        thumbVisibility: MaterialStateProperty.all(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              // DropdownButton<String>(
                              //   value: selectedGender,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       selectedGender = value!;
                              //     });
                              //   },
                              //   items: ['Male', 'Female', 'Others']
                              //       .map<DropdownMenuItem<String>>(
                              //         (String value) => DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     ),
                              //   )
                              //       .toList(),
                              //   hint: Text('Select Gender'),
                              // ),
                              SizedBox(height: 70,),
                              Text('Emergency Contacts:', style: TextStyle(color: Color(0xff37949d), fontWeight: FontWeight.bold,fontSize: 20)),
                              SizedBox(height: 30,),
                              Column(
                                children: [
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          emergencyContactRelations.add(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        label: Text('   Relation',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.cake, color:Color(0xff37949d),size: 35,),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          emergencyContactNumbers.add(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        label: Text('   Contact No.',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.cake, color:Color(0xff37949d),size: 35,),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          emergencyContactRelations.add(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        label: Text('   Relation',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.cake, color:Color(0xff37949d),size: 35,),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    width: 450,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff6b4bb),
                                      border: Border.all(
                                        color: Color(0xff37949d),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          emergencyContactNumbers.add(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        label: Text('   Contact No.',
                                          style: TextStyle(
                                            color: Color(0xFF383330),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                                          child: Icon(Icons.cake, color:Color(0xff37949d),size: 35,),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Color(0xFF383330),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Your existing onPressed logic remains unchanged
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(fontSize: 16,color: Color(0xfff6b4bb),),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff37949d), // Updated color to pink
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Rounded corners
                                      side: BorderSide(color: Color(0xfff6b4bb),), // Border color
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
