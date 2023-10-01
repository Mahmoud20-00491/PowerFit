import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gym_app/bmr_page.dart';
import 'package:gym_app/food_calories.dart';
import 'package:gym_app/gym_practice.dart';
import 'package:gym_app/jason.dart';
import 'package:gym_app/profilepage.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    // Initialize the PageController with initialPage set to 5
    _pageController = PageController(initialPage: _currentPageIndex);

    // Start auto scroll after 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // Go to the next page
      if (_currentPageIndex < 4) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
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
    final _myBox = Hive.box('mybox');
    DataBase db = DataBase();
    db.details = _myBox.get("DATABASE1");

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome, ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        db.details[0]["firstName"] != null &&
                                db.details[0]["firstName"].isNotEmpty
                            ? db.details[0]["firstName"]
                            : '',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: ProfilePage()));
                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: db.details[0]["image"] != null
                          ? FileImage(File(db.details[0]["image"]!))
                          : null,
                      backgroundColor: Colors.orange[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 320,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
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
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 210,
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: BMRPage()));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/muscle.png',
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Calculate BMR",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: Training()));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/weightlifting.png',
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Start Your Training",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: FoodCalories()));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/dumbbell.png',
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Calculate Food Calories",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
