import 'package:hive/hive.dart';

List images = [
  {
    'img': 'assets/photo1.jfif',
    'text': 'Get ready for new ',
    'specialWord': 'experience'
  },
  {
    'img': 'assets/photo2.jfif',
    'text': 'Make your own ',
    'specialWord': 'Healthy'
  },
  {
    'img': 'assets/photo3.jfif',
    'text': 'Unleash your inner ',
    'specialWord': 'strength'
  },
  {
    'img': 'assets/photo4.jfif',
    'text': 'Achieve your fitness',
    'specialWord': 'goals'
  },
  {
    'img': 'assets/photo5.jfif',
    'text': 'Unlock your full  ',
    'specialWord': 'potential'
  },
  {
    "img": "assets/squats.jfif",
    "text": "Improved bone",
    "specialWord": " density"
  },
  {
    "img": "assets/deadhead.jfif",
    "text": "Increased muscle mass and",
    "specialWord": " strength"
  },
  {
    "img": "assets/bench.jfif",
    "text": "Improved cardiovascular",
    "specialWord": " injury"
  },
  {
    "img": "assets/overhead.jfif",
    "text": "Reduced risk of chronic",
    "specialWord": " diseases"
  },
  {
    "img": "assets/pull2.jfif",
    "text": "Increased muscle mass and ",
    "specialWord": " strength"
  },
  {
    "img": "assets/rows.jfif",
    "text": "Improved mental",
    "specialWord": " health"
  }
];

List gym_traning = [
  {
    "img": "assets/squats.jfif",
    "trainName": "Squats",
    "specialWords": " Training"
  },
  {
    "img": "assets/deadhead.jfif",
    "trainName": "Deadlifts",
    "specialWords": " Training"
  },
  {
    "img": "assets/bench.jfif",
    "trainName": "Bench Press",
    "specialWords": " Training"
  },
  {
    "img": "assets/overhead.jfif",
    "trainName": "Overhead Press",
    "specialWords": " Training"
  },
  {
    "img": "assets/pull2.jfif",
    "trainName": "Pull-Ups",
    "specialWords": " Training"
  },
  {"img": "assets/rows.jfif", "trainName": "Rows", "specialWords": " Training"}
];

List<Map<String, dynamic>> foodItems = [
  {"foodName": 'Apple', "foodCalories": 95},
  {"foodName": 'Banana', "foodCalories": 105},
  {"foodName": 'Orange', "foodCalories": 85},
  {"foodName": 'Egg', "foodCalories": 78},
  {"foodName": 'Oatmeal', "foodCalories": 150},
  {"foodName": 'Yogurt', "foodCalories": 100},
  {"foodName": 'Chicken breast', "foodCalories": 165},
  {"foodName": 'Salmon', "foodCalories": 200},
  {"foodName": 'Broccoli', "foodCalories": 35},
  {"foodName": 'Carrots', "foodCalories": 40},
  {"foodName": 'Rice', "foodCalories": 200},
  {"foodName": 'Whole-wheat bread', "foodCalories": 160},
  {"foodName": 'Peanut butter', "foodCalories": 190},
  {"foodName": 'Almonds', "foodCalories": 165},
  {"foodName": 'Avocados', "foodCalories": 240},
  {"foodName": 'Dark chocolate', "foodCalories": 150},
  {"foodName": 'Applesauce', "foodCalories": 95},
  {"foodName": 'Asparagus', "foodCalories": 20},
  {"foodName": 'Avocado toast', "foodCalories": 250},
  {"foodName": 'Baked potato', "foodCalories": 200},
  {"foodName": 'Beans', "foodCalories": 150},
  {"foodName": 'Berries', "foodCalories": 50},
  {"foodName": 'Black beans', "foodCalories": 130},
  {"foodName": 'Blueberries', " foodCalories": 80},
  {"foodName": 'Breakfast burrito', "foodCalories": 300},
  {"foodName": 'Broccoli florets', "foodCalories": 30},
  {"foodName": 'Brown rice', "foodCalories": 215},
  {"foodName": 'Brussels sprouts', "foodCalories": 38},
  {"foodName": 'Butternut squash', "foodCalories": 115},
  {"foodName": 'Cabbage', "foodCalories": 22},
  {"foodName": 'Cantaloupe', "foodCalories": 53},
  {"foodName": 'Cauliflower', "foodCalories": 25},
  {"foodName": 'Celery', "foodCalories": 6},
  {"foodName": 'Cheerios', "foodCalories": 110},
  {"foodName": 'Chickpeas', "foodCalories": 269},
  {"foodName": 'Chicken noodle soup', "foodCalories": 190},
  {"foodName": 'Chili', "foodCalories": 200},
  {"foodName": 'Chocolate chip cookies', "foodCalories": 230},
  {"foodName": 'Coffee', "foodCalories": 5},
  {"foodName": 'Cottage cheese', "foodCalories": 98},
  {"foodName": 'Couscous', "foodCalories": 200},
  {"foodName": 'Crapes', "foodCalories": 200},
  {"foodName": 'Cream of wheat', "foodCalories": 150},
  {"foodName": 'Cucumber', "foodCalories": 16},
  {"foodName": 'Dates', "foodCalories": 20},
  {"foodName": 'Edamame', "foodCalories": 120},
  {"foodName": 'Ezekiel bread', "foodCalories": 160},
  {"foodName": 'Figs', "foodCalories": 37},
  {"foodName": 'Flaxseed', "foodCalories": 55},
  {"foodName": 'French fries', "foodCalories": 230},
  {"foodName": 'Fruit salad', "foodCalories": 150},
  {"foodName": 'Garbanzo beans', "foodCalories": 269},
  {"foodName": 'Ginger', "foodCalories": 5}
];

class DataBase {
  List userInfo = [];
  List details = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // load the data from database
  void loadData() {
    userInfo = _myBox.get("DATABASE");
  }

  void loadDataDetails() {
    userInfo = _myBox.get("DATABASE1");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("DATABASE", userInfo);
  }

  void updateDataBaseDetails() {
    _myBox.put("DATABASE1", details);
  }
}
