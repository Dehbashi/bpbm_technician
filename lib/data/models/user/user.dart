class User {
  final int userId;
  final String name;
  final String englishName;
  final String img;
  final String cellNumber;
  final String jobTitle;

  const User({
    required this.userId,
    required this.name,
    required this.englishName,
    required this.img,
    required this.cellNumber,
    required this.jobTitle,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['id'],
        name = json['name'],
        englishName = json['name_en'],
        img = json['img'],
        cellNumber = json['phone'],
        jobTitle = json['jobtitle'];
}
