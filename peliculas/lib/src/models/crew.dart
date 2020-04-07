class Crew {
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew({
    this.creditId,
    this.department,
    this.gender,
    this.id,
    this.job,
    this.name,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        creditId: json["credit_id"],
        department: json["department"],
        gender: json["gender"],
        id: json["id"],
        job: json["job"],
        name: json["name"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "credit_id": creditId,
        "department": department,
        "gender": gender,
        "id": id,
        "job": job,
        "name": name,
        "profile_path": profilePath == null ? null : profilePath,
      };
}
