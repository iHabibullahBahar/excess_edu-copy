import 'section_model.dart';

class Curriculum {
  Curriculum({
    required this.sections,
  });

  List<Section> sections;

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}
