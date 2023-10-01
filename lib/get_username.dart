import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/jason.dart';
import 'package:gym_app/user_info.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class UserName extends StatefulWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final _myBox = Hive.box('mybox');
  DataBase db = DataBase();
  @override
  void initState() {
    super.initState();
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userNumber = TextEditingController();

  XFile? selectedImage;
  // New list to store selected image paths
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Fill your profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orange[600],
                      backgroundImage: selectedImage != null
                          ? FileImage(File(selectedImage!.path))
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: _pickImage)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: firstName,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    hintText: "Enter Your First Name",
                    fillColor: Colors.grey.withOpacity(.5),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: lastName,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    fillColor: Colors.grey.withOpacity(.5),
                    filled: true,
                    hintText: "Enter Your Last Name",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: userNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    fillColor: Colors.grey.withOpacity(.5),
                    filled: true,
                    hintText: "Enter Your Number",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 130,
                ),
                GestureDetector(
                  onTap: () {
                    if (firstName.text.isNotEmpty &&
                        lastName.text.isNotEmpty &&
                        userNumber.text.isNotEmpty &&
                        selectedImage != null) {
                      db.details.add({
                        'firstName': firstName.text,
                        'lastName': lastName.text,
                        'userNumber': userNumber.text,
                        'image': selectedImage!.path,
                      });
                    }

                    db.updateDataBaseDetails();
                    db.loadDataDetails();
                    // Add the user information to the Hive box

                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: UserInfo()));

                    print(db.details);

                    // Navigate to the next screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const UserInfo()),
                    // );
                  },
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.orange[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); // Rest of the build method
  }
}
