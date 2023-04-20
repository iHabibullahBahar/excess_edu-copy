class CourseIncludes {
  CourseIncludes({
    required this.totalVideo,
    required this.totalSection,
    required this.totalArticle,
    required this.totalQuiz,
    required this.courseDuration,
  });

  int totalSection;
  int totalVideo;
  int  totalArticle;
  int  totalQuiz;
  int courseDuration;

  factory CourseIncludes.fromJson(Map<String, dynamic> json) => CourseIncludes(
        totalSection: json["total_section"],
        totalVideo: json["total_video"],
        totalArticle: json["total_article"],
        totalQuiz: json["total_quiz"],
        courseDuration: json["course_duration"],
      );

  Map<String, dynamic> toJson() => {
        "total_section": totalSection,
        "total_video": totalVideo,
        "total_article": totalArticle,
        "total_quiz": totalQuiz,
        "course_duration": courseDuration,
      };
}
