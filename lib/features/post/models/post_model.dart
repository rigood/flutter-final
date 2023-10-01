import 'package:moodtree/features/post/models/emoji_model.dart';

class PostModel {
  final String id;
  final DateTime date;
  final int todayRatingIndex;
  final List<EmojiModel> feelings;
  final List<EmojiModel> weather;
  final List<EmojiModel> meals;
  final List<EmojiModel> food;
  final List<EmojiModel> people;
  final List<EmojiModel> outing;
  final List<EmojiModel> activities;
  final List<EmojiModel> health;
  final List<String> photoUrlList;
  final String diary;
  final DateTime updatedAt;

  PostModel({
    required this.id,
    required this.date,
    required this.todayRatingIndex,
    required this.feelings,
    required this.weather,
    required this.meals,
    required this.food,
    required this.people,
    required this.outing,
    required this.activities,
    required this.health,
    required this.photoUrlList,
    required this.diary,
    required this.updatedAt,
  });

  PostModel.empty()
      : id = "",
        date = DateTime.now(),
        todayRatingIndex = -1,
        feelings = [],
        weather = [],
        meals = [],
        food = [],
        people = [],
        outing = [],
        activities = [],
        health = [],
        photoUrlList = [],
        diary = "",
        updatedAt = DateTime.now();

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        date = json["date"].toDate(),
        todayRatingIndex = json["todayRatingIndex"],
        feelings = List<Map<String, dynamic>>.from(json["feelings"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        weather = List<Map<String, dynamic>>.from(json["weather"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        meals = List<Map<String, dynamic>>.from(json["meals"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        food = List<Map<String, dynamic>>.from(json["food"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        people = List<Map<String, dynamic>>.from(json["people"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        outing = List<Map<String, dynamic>>.from(json["outing"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        activities = List<Map<String, dynamic>>.from(json["activities"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        health = List<Map<String, dynamic>>.from(json["health"])
            .map((e) => EmojiModel.fromJson(e))
            .toList(),
        photoUrlList = List<String>.from(json["photoUrlList"]),
        diary = json["diary"],
        updatedAt = json["updatedAt"].toDate();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "date": date,
      "todayRatingIndex": todayRatingIndex,
      "feelings": feelings.map((e) => e.toJson()),
      "weather": weather.map((e) => e.toJson()),
      "meals": meals.map((e) => e.toJson()),
      "food": food.map((e) => e.toJson()),
      "people": people.map((e) => e.toJson()),
      "outing": outing.map((e) => e.toJson()),
      "activities": activities.map((e) => e.toJson()),
      "health": health.map((e) => e.toJson()),
      "photoUrlList": photoUrlList,
      "diary": diary,
      "updatedAt": updatedAt,
    };
  }
}
