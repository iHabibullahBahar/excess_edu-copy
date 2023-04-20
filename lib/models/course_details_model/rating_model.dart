class Rating {
  Rating({
    required this.ratingVlaue,
    required this.dateAndTime,
    required this.userName,
    required this.comment,
  });

  var ratingVlaue;
  DateTime dateAndTime;
  String userName;
  String comment;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        ratingVlaue: json["rating_vlaue"],
        dateAndTime: DateTime.parse(json["date_and_time"]),
        userName: json["user_name"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "rating_vlaue": ratingVlaue,
        "date_and_time": dateAndTime.toIso8601String(),
        "user_name": userName,
        "comment": comment,
      };
}
