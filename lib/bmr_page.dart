import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/jason.dart';

class BMRPage extends StatefulWidget {
  const BMRPage({Key? key}) : super(key: key);

  @override
  State<BMRPage> createState() => _BMRPageState();
}

class _BMRPageState extends State<BMRPage> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  late double age = double.parse(_ageController.text);
  late double height = double.parse(_heightController.text);
  late double weight = double.parse(_weightController.text);
  late String bmr_type = '';
  late double BMR;

  void _calculate() {
    double age = double.parse(_ageController.text);
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    String gender = _genderController.text.toLowerCase();
    double BMR = 0;

    if (gender == "male") {
      BMR = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
    } else if (gender == "female") {
      BMR = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    } else {
      print("ERROR");
      return;
    }

    int bmr = BMR.toInt();
    String bmrType = '';

    if (gender == "male") {
      if (bmr > 1600 && bmr < 1800) {
        bmrType = "Normal";
      } else if (bmr < 1300) {
        bmrType = "Low";
      } else if (bmr > 2000) {
        bmrType = "High";
      }
    } else if (gender == "female") {
      if (bmr > 1400 && bmr < 1600) {
        bmrType = "Normal";
      } else if (bmr < 1200) {
        bmrType = "Low";
      } else if (bmr > 1800) {
        bmrType = "High";
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          content: Container(
            height: 300,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Calculate BMR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    const Text(
                      'Your BMR is ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$bmr',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.orange[600],
                      ),
                    ),
                    const Text(
                      ' calories/day',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your BMR is ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmrType,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.orange[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[600],
                    onPrimary: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );

    _ageController.clear();
    _heightController.clear();
    _weightController.clear();
    _genderController.clear();

    FocusScope.of(context).requestFocus(FocusNode());
  }

  int _currentPageIndex = 5;

// Add a Timer to start auto scroll after 5 seconds
  Timer? _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    // Initialize the PageController with initialPage set to 5
    _pageController = PageController(initialPage: _currentPageIndex);

    // Start auto scroll after 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // Go to the next page
      if (_currentPageIndex < images.length) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 5;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // Cancel the Timer
    _timer?.cancel();

    // Dispose the PageController
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculate BMR',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                  height: 250,
                  child: PageView.builder(
                    // Add the PageController
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(images[index]['img']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Background image
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              // Text overlay
                              Positioned(
                                top: 180,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      images[index]['text'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      images[index]['specialWord'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Gender:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.orange[600] ?? Colors.orange),
                        value: "male",
                        groupValue: _genderController.text,
                        onChanged: (value) {
                          setState(() {
                            _genderController.text = value.toString();
                          });
                        },
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.orange[600] ?? Colors.orange),
                        value: "female",
                        groupValue: _genderController.text,
                        onChanged: (value) {
                          setState(() {
                            _genderController.text = value.toString();
                          });
                        },
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Age:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        hintText: "Enter your age",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Height:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        hintText: "Enter your height",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Weight:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        hintText: "Enter your Weight",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  _calculate();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20)),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
