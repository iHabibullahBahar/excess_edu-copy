class Instructor {
  Instructor({
    required this.name,
    required this.designation,
    required this.institution,
    required this.image,
  });

  String name;
  String designation;
  String institution;
  String image;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        name: json["name"],
        designation: json["designation"],
        institution: json["institution"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "designation": designation,
        "institution": institution,
        "image": image,
      };
}
