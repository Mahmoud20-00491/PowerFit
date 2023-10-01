import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_app/jason.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final _myBox = Hive.box('mybox');
    DataBase db = DataBase();

    db.userInfo = _myBox.get("DATABASE");
    db.details = _myBox.get("DATABASE1");

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: db.details[0]["image"] != null
                      ? FileImage(File(db.details[0]["image"]!))
                      : null,
                  backgroundColor: Colors.orange[600],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    db.details[0]["firstName"] ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    db.details[0]["lastName"] ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                db.details[0]["userNumber"] ?? "",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.orange[600],
                        child: Text(
                          db.userInfo[0]["age"] ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.orange[600],
                        child: Text(
                          db.userInfo[0]["height"] ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Height",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.orange[600],
                        child: Text(
                          db.userInfo[0]["weight"] ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
