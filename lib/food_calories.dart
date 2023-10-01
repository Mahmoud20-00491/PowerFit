import 'package:flutter/material.dart';
import 'package:gym_app/jason.dart';

class FoodCalories extends StatefulWidget {
  const FoodCalories({Key? key}) : super(key: key);

  @override
  _FoodCaloriesState createState() => _FoodCaloriesState();
}

class _FoodCaloriesState extends State<FoodCalories> {
  List<Map<String, dynamic>> filteredFoodItems =
      List<Map<String, dynamic>>.from(foodItems);

  void filterFoodItems(String query) {
    setState(() {
      filteredFoodItems = foodItems
          .where((item) => item["foodName"]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  late int itemCalories;
  List<int> caloriesList = [];

  int get totalCalories => caloriesList.fold(
      0, (int previousValue, int element) => previousValue + element);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Food Calories",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      onChanged: filterFoodItems,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.grey[900],
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.black54,
                            content: Container(
                              height: 100,
                              width: 100,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'The total calories is ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '$totalCalories',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.orange[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange[600],
                                          onPrimary: Colors.white,
                                          textStyle: TextStyle(fontSize: 18),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange[600],
                      ),
                      child: Center(
                        child: Text(
                          caloriesList.length.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Text(
                      "Items",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Text(
                      "Food Calories",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredFoodItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        itemCalories = filteredFoodItems[index]["foodCalories"];

                        setState(() {
                          caloriesList.add(itemCalories);
                        });

                        print(caloriesList);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 20),
                            child: Text(
                              filteredFoodItems[index]["foodName"],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Text(
                                  "${filteredFoodItems[index]["foodCalories"]}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange[600]),
                                ),
                                Text(
                                  " Calories",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
