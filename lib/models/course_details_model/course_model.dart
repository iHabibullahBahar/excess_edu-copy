import 'course_includes_model.dart';
import 'curriculam_model.dart';
import 'instructor_model.dart';
import 'rating_model.dart';

class Course {
  Course({
    required this.courseId,
    required this.categoryId,
    required this.name,
    required this.shortDescription,
    required this.price,
    required this.priceUnit,
    required this.coverType,
    required this.coverImage,
    required this.coverVideo,
    required this.lastUpdated,
    required this.rating,
    required this.totalRating,
    required this.totalEnrolled,
    required this.courseIncludes,
    required this.instructor,
    required this.description,
    required this.whatYouLearn,
    required this.curriculum,
    required this.ratings,
  });

  int courseId;
  int categoryId;
  String name;
  String shortDescription;
  double price;
  String priceUnit;
  String coverType;
  String coverImage;
  String coverVideo;
  DateTime lastUpdated;
  double rating;
  int totalRating;
  int totalEnrolled;
  CourseIncludes courseIncludes;
  Instructor instructor;
  String description;
  List<String> whatYouLearn;
  Curriculum curriculum;
  List<Rating> ratings;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseId: json["course_id"],
        categoryId: json["category_id"],
        name: json["name"],
        shortDescription: json["short_description"],
        price: json["price"].toDouble(),
        priceUnit: json["price_unit"],
        coverType: json["cover_type"],
        coverImage: json["cover_image"],
        coverVideo: json["cover_video"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        rating: json["rating"].toDouble(),
        totalRating: json["total_rating"],
        totalEnrolled: json["total_enrolled"],
        courseIncludes: CourseIncludes.fromJson(json["course_includes"]),
        instructor: Instructor.fromJson(json["instructor"]),
        description: json["description"],
        whatYouLearn: List<String>.from(json["what_you_learn"].map((x) => x)),
        curriculum: Curriculum.fromJson(json["curriculum"]),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "category_id": categoryId,
        "name": name,
        "short_description": shortDescription,
        "price": price,
        "price_unit": priceUnit,
        "cover_type": coverType,
        "cover_image": coverImage,
        "cover_video": coverVideo,
        "last_updated":
            "${lastUpdated.year.toString().padLeft(4, '0')}-${lastUpdated.month.toString().padLeft(2, '0')}-${lastUpdated.day.toString().padLeft(2, '0')}",
        "rating": rating,
        "total_rating": totalRating,
        "total_enrolled": totalEnrolled,
        "course_includes": courseIncludes.toJson(),
        "instructor": instructor.toJson(),
        "description": description,
        "what_you_learn": List<dynamic>.from(whatYouLearn.map((x) => x)),
        "curriculum": curriculum.toJson(),
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
      };
}
