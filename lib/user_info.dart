import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gym_app/home_page.dart';
import 'package:gym_app/jason.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final _myBox = Hive.box('mybox');
  DataBase db = DataBase();

  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _genderController;
  late TextEditingController _ageController;
  bool _selectedGenderMale = false;
  bool _selectedGenderFemale = false;
  int _selectedHeightIndex = -1;
  int _selectedWeightIndex = -1;
  int _selectedageIndex = -1;

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _genderController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Set your Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _genderController.text = "male";
                          _selectedGenderMale = true;
                          _selectedGenderFemale = false;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 160,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: _selectedGenderMale
                                ? Colors.orange[600]!
                                : Colors.white.withOpacity(.5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.man,
                              size: 50,
                              color: _selectedGenderMale
                                  ? Colors.orange[600]
                                  : Colors.white.withOpacity(.5),
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 18,
                                color: _selectedGenderMale
                                    ? Colors.orange[600]
                                    : Colors.white.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _genderController.text = "female";
                          _selectedGenderMale = false;
                          _selectedGenderFemale = true;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 160,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: _selectedGenderFemale
                                ? Colors.orange[600]!
                                : Colors.white.withOpacity(.5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.woman,
                              size: 50,
                              color: _selectedGenderFemale
                                  ? Colors.orange[600]
                                  : Colors.white.withOpacity(.5),
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 18,
                                color: _selectedGenderFemale
                                    ? Colors.orange[600]
                                    : Colors.white.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Age",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 49,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      index = index + 12;
                      double opacity = _selectedageIndex == index ? 1.0 : 0.5;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedageIndex = index;
                            _ageController.text = index.toString();
                          });
                        },
                        onVerticalDragDown: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        onVerticalDragEnd: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: _selectedageIndex == index
                                  ? Colors.orange[600]?.withOpacity(opacity)
                                  : Colors.white.withOpacity(opacity),
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Height",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 60,
                    itemBuilder: (context, index) {
                      index = index + 150;
                      double opacity =
                          _selectedHeightIndex == index ? 1.0 : 0.5;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHeightIndex = index;
                            _heightController.text = index.toString();
                          });
                        },
                        onVerticalDragDown: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        onVerticalDragEnd: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: _selectedHeightIndex == index
                                  ? Colors.orange[600]?.withOpacity(opacity)
                                  : Colors.white.withOpacity(opacity),
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 150,
                    itemBuilder: (context, index) {
                      index = index + 50;
                      double opacity =
                          _selectedWeightIndex == index ? 1.0 : 0.5;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedWeightIndex = index;
                            _weightController.text = index.toString();
                          });
                        },
                        onVerticalDragDown: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        onVerticalDragEnd: (_) {
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        child: Container(
                          width: 60,
                          alignment: Alignment.center,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: _selectedWeightIndex == index
                                  ? Colors.orange[600]?.withOpacity(opacity)
                                  : Colors.white.withOpacity(opacity),
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 115,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_ageController.text.isNotEmpty &&
                          _genderController.text.isNotEmpty &&
                          _heightController.text.isNotEmpty &&
                          _weightController.text.isNotEmpty) {
                        db.userInfo.add({
                          'height': _heightController.text,
                          'weight': _weightController.text,
                          'gender': _genderController.text,
                          'age': _ageController.text,
                        });
                      }
                      ;
                      db.updateDataBase();
                      db.loadData();

                      print(db.userInfo);

                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: HomePage()));
                    },
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.orange[600],
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )

                //   ElevatedButton(
                //     onPressed: () {
                //  userInfoList.add(_heightController.text);
                //       userInfoList.add(_weightController.text);
                //       userInfoList.add(_genderController.text);
                //       userInfoList.add(_ageController.text);

                //     },
                //     child: Text(
                //       "Print",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
