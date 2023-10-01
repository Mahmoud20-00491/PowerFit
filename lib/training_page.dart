import 'package:flutter/material.dart';

class Practises extends StatelessWidget {
  const Practises({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bench Training',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Bench training involves lying on a bench and pushing a weighted barbell or dumbbells away from the chest, extending the arms fully. This exercise helps to build upper body strength and muscle mass.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/bench/img1.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'Dumbbell Shoulder Press',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'This exercise is designed to strengthen the arms and chest muscles',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/bench/img2.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'Dumbbell Flat Pres',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Description for Bench Training Variation 2',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/bench/img3.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'Dumbbell Shoulder Press',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'This exercise is designed to strengthen the arms and chest muscles',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/bench/img4.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'Dumbbell Flat Pres',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Description for Bench Training Variation 2',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
