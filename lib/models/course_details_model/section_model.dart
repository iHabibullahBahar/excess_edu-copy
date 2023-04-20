import 'lesson_model.dart';

class Section {
  Section({
    required this.sectionId,
    required this.sectionIndex,
    required this.sectionName,
    required this.lessons,
  });

  int sectionId;
  int sectionIndex;
  String sectionName;
  List<Lesson> lessons;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        sectionId: json["section_id"],
        sectionIndex: json["section_index"],
        sectionName: json["section_name"],
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "section_id": sectionId,
        "section_index": sectionIndex,
        "section_name": sectionName,
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
      };
}
