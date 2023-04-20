class Lesson {
  Lesson({
    required this.lessonIndex,
    required this.lessonId,
    required this.lessonName,
    required this.lessonType,
    required this.isPreviewable,
    required this.contentSize,
    required this.contentUrl,
  });

  int lessonId;
  int lessonIndex;
  String lessonName;
  String lessonType;
  bool isPreviewable;
  int contentSize;
  String contentUrl;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        lessonId: json["lesson_id"],
        lessonIndex: json["lesson_index"],
        lessonName: json["lesson_name"],
        lessonType: json["lesson_type"],
        isPreviewable: json["is_previewable"],
        contentSize: json["content_size"],
        contentUrl: json["content_url"],
      );

  Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "lesson_index": lessonIndex,
        "lesson_name": lessonName,
        "lesson_type": lessonType,
        "is_previewable": isPreviewable,
        "content_size": contentSize,
        "content_url": contentUrl,
      };
}
