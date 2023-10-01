class PostModel {
  final String id;
  final DateTime date;
  final int todayFeelingIndex;
  final List<String> weather;
  final List<String> meals;
  final List<String> food;
  final List<String> people;
  final List<String> outing;
  final List<String> activities;
  final List<String> health;
  final List<String> photoUrlList;
  final String diary;

  PostModel({
    required this.id,
    required this.date,
    required this.todayFeelingIndex,
    required this.weather,
    required this.meals,
    required this.food,
    required this.people,
    required this.outing,
    required this.activities,
    required this.health,
    required this.photoUrlList,
    required this.diary,
  });

  PostModel.empty()
      : id = "",
        date = DateTime.now(),
        todayFeelingIndex = -1,
        weather = [],
        meals = [],
        food = [],
        people = [],
        outing = [],
        activities = [],
        health = [],
        photoUrlList = [],
        diary = "";

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        date = json["date"],
        todayFeelingIndex = json["todayFeelingIndex"],
        weather = List<String>.from(json["weather"]),
        meals = List<String>.from(json["meals"]),
        food = List<String>.from(json["food"]),
        people = List<String>.from(json["people"]),
        outing = List<String>.from(json["outing"]),
        activities = List<String>.from(json["activities"]),
        health = List<String>.from(json["health"]),
        photoUrlList = List<String>.from(json["photoUrlList"]),
        diary = json["diary"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "todayFeelingIndex": todayFeelingIndex,
      "weather": weather,
      "meals": meals,
      "food": food,
      "people": people,
      "outing": outing,
      "activities": activities,
      "health": health,
      "photoUrlList": photoUrlList,
      "diary": diary,
    };
  }
}
